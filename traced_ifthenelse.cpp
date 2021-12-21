#include <cstdio>
#include <ctime>
#include <cstdlib>
#include <pthread.h>
#include <signal.h>		// for pthread_kill
#include <cstdint>		// for uint64_t

//include for tsx
#include <immintrin.h>
//include for rdtsc
#include <x86intrin.h>

#define CYCLES_PER_SEC 2600000000

using namespace std;

long long var2[2000000], var3[2000000], var10[2000000], var11[2000000];
long long abort1 = 0, abort2 = 0, iter = 0;
	
long long tr[3] = {0,0,0};	// Counters for trace decisions

//Trace Predictor data structure
#define NUMOFTRACES 2		// 2 traces, size of a key is 1 bit
#define PHTSIZE 16		// 4 items in a history register, each can have 2 values, 2^4 = 16
volatile short key = 0;
unsigned int HR = 0, mask_HR = 15;	// 4 items in a history register, each takes 1 bit, last 4 bits are 1, others are 0 -> 1+2+4+8=15
//volatile unsigned long long addr = -1;
//volatile unsigned long long traceAddr [NUMOFTRACES] = {1, 2};
volatile short PHT [PHTSIZE]; 		// will be initialized later
volatile bool coeff [NUMOFTRACES]; 	// will be initialized later

// Predictor function
void* predictor (void* arg)
{
	// initialization of a predictor 
	for (int i = 0; i < PHTSIZE; i++)
	{
		PHT[i]=0;
	}
	for (int j = 0; j < NUMOFTRACES; j++)
	{
		coeff[j] = 1;
	}
	
	while (true)
	{
		key = PHT [HR&mask_HR];
		//addr = traceAddr [key];

		// Speculative modifications of a predictor
		HR = HR << 2;		// shifting HR 
		HR += key;		// and writing there a key

		while (key >= 0) { }	// Synchronization with a trace thread
	}
}

inline void trace1 (int* inp_i, int* inp_j)
{
	int i = *inp_i;
	int j = *inp_j;

	//TRACE 1 (i%7!=0)
	unsigned status = _xbegin ();
	if (status == _XBEGIN_STARTED)
	{
		if (i%7 == 0) _xabort (1);
		var2 [i%7] = var3 [i+j];
		var3 [i/7] = 2;
		var10 [i/7] += var3 [i%7];
		var11 [i+j]++;
		_xend ();
	}
	else 
	{
		abort1++;
		short correctKey = 0;
		// Execute non-optimized code and generate new key
		if (i%7 == 0)
		{
			correctKey = 1;	// generating a new key
			var3 [i] += var2 [i+j];
			var2 [i/7] -= var11 [i+j];
		}
		else
		{
			correctKey = 0; // generating a new key
			var2 [i%7] = var3 [i+j];
			var3 [i/7] = 2;
		}
		var10 [i/7] += var3 [i%7];
		var11 [i+j]++;
		// !!! Starting from here we assume that all speculative updates from the predictor thread is finished
		HR = HR >> 2;		// get rid of an incorrect key
		// !!! after shift we do not get previous version of HR (the one that the prediction was based on)
		if (!coeff [key]) PHT[HR&mask_HR] = correctKey;
		else coeff [key] = false;
		HR = HR << 2;		// shifting HR 
		HR += correctKey;	// and writing there a key
		key = correctKey;
	}
	tr[1]++;
	//goto finish_label;

}

inline void trace2 (int* inp_i, int* inp_j)
{
	int i = *inp_i;
	int j = *inp_j;

	//TRACE 2 (i%7==0)
	unsigned status = _xbegin ();
	if (status == _XBEGIN_STARTED)
	{
		if (i%7 != 0) _xabort (2);
		var3 [i] += var2 [i+j];
		var2 [i/7] -= var11 [i+j];
		var10 [i/7] += var3 [i%7];
		var11 [i+j]++;
		_xend ();
	}
	else 
	{
		abort2++;
		short correctKey = 0;
		// Execute non-optimized code and generate new key
		if (i%7 == 0)
		{
			correctKey = 1;	// generating a new key
			var3 [i] += var2 [i+j];
			var2 [i/7] -= var11 [i+j];
		}
		else
		{
			correctKey = 0; // generating a new key
			var2 [i%7] = var3 [i+j];
			var3 [i/7] = 2;
		}
		var10 [i/7] += var3 [i%7];
		var11 [i+j]++;
		// !!! Starting from here we assume that all speculative updates from the predictor thread is finished
		HR = HR >> 2;		// get rid of an incorrect key
		// !!! after shift we do not get previous version of HR (the one that the prediction was based on)
		if (!coeff [key]) PHT[HR&mask_HR] = correctKey;
		else coeff [key] = false;
		HR = HR << 2;		// shifting HR 
		HR += correctKey;	// and writing there a key
		key = correctKey;
	}
	tr[2]++;
	//goto finish_label;

}

int main (int argc, char *argv[])
{
	long long c2 = 0, c3 = 0, c10 = 0, c11 = 0;
	char execType = 'r';
	int numOfIter = 700014;

	// Receiving indexes that we will print later
	if (argc == 7)
	{
		c2 = atoi (argv[1]);
		c3 = atoi (argv[2]);
		c10 = atoi (argv[3]);
		c11 = atoi (argv[4]);
		execType = *argv[5];
		numOfIter = atoi (argv[6]);
	}

	//srand (time (NULL));

	// Initializing arrays
	for (int i = 0; i < 2000000; i++) 
	{
		var2 [i] = rand () % 500;
		var3 [i] = rand () % 500;
		var10[i] = rand () % 500;
		var11[i] = rand () % 500;
	}

	// Starting a predictor thread
	pthread_t pred_id;
	pthread_create (&pred_id, NULL, predictor, NULL);
	unsigned status = 0; 	// initialization of tx status
	
	// Main loop
	//clock_t start = clock ();
	uint64_t start = _rdtsc ();
	for (int j = 0; j < 500; j++)
	{
		for (int i = 0; i < numOfIter/*700014*/; i++)
		{
			//printf ("%d %d\n", j, i);
			while (key < 0) { }			// Synchronization
			switch (key)
			{
				case 0:
					{
						trace1 (&i, &j);
						break;
					}
				case 1:
					{
						trace2 (&i, &j);
						break;
					}
				default:
					{
						printf ("INCORRECT key! \n");
						break;
					}
			}


finish_label:
			iter++;
			coeff[key] = true;	// initialize coeff with 'taken'
			key = -1;
		}
	}
        uint64_t end = _rdtsc ();
	//clock_t end = clock ();

	// Finishing executing a predictor
	pthread_kill (pred_id, NULL);

	// Calculating the execution time in seconds
	uint64_t total = end-start;
	printf ("EXEC cycles: %lu \n", total);
	//double elapsed = (double) (end-start)/CLOCKS_PER_SEC;
	double elapsed = (double) (total)/CYCLES_PER_SEC;
	printf ("EXEC time: %.8f \n", elapsed);

	// Printing some data from the array (to check that everything is correct)
	printf ("\n\n\n****\nCurrent state: %lld %lld %lld %lld\n****\ntr0: %lld; tr1: %lld; tr2: %lld\nMispredicted trace 1: %lld \nMispredicted trace 2: %lld \n", var2 [c2], var3 [c3], var10 [c10], var11 [c11], tr[0], tr[1], tr[2], abort1, abort2);
	 
	if (execType == 'v')
        {
                printf ("\n#################################################\nVerification: \n");
                for (int i = 0; i < numOfIter; i++)
                {
                        printf ("%lld %lld %lld %lld \n", var2[i], var3[i], var10[i], var11[i]);
                }
        }

        printf ("\n\n\n\n");
}
