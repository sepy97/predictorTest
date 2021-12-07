#include <cstdio>
#include <ctime>
#include <cstdlib>
#include <pthread.h>

//include for tsx
#include <immintrin.h>
//#include <x86intrin.h>

using namespace std;

long long var2[2000000], var3[2000000], var10[2000000], var11[2000000];

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
	// TODO: initialization of a predictor 
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

int main (int argc, char *argv[])
{
	long long c2 = 0, c3 = 0, c10 = 0, c11 = 0;

	// Receiving indexes that we will print later
	if (argc == 5)
	{
		c2 = atoi (argv[1]);
		c3 = atoi (argv[2]);
		c10 = atoi (argv[3]);
		c11 = atoi (argv[4]);
	}

	srand (time (NULL));

	// Initializing arrays
	for (int i = 0; i < 2000000; i++) 
	{
		var2 [i] = rand () % 500;
		var3 [i] = rand () % 500;
		var10[i] = rand () % 500;
		var11[i] = rand () % 500;
	}
	int tr1 = 0, tr2 = 0, iter = 0;

	// Starting a predictor thread
	pthread_t pred_id;
	pthread_create (&pred_id, NULL, predictor, NULL);
	unsigned status = 0; 	// initialization of tx status
	
	// Main loop
	clock_t start = clock ();
	for (int j = 0; j < 500; j++)
	{
		for (int i = 0; i < 700014; i++)
		{
			while (key < 0) { }			// Synchronization
			asm volatile
			(
				"movq %1, %%rax"
				"jmp *trace_tbl(,%%rax,8)"
				: "=r" (key)
				: "r" (key)
				: "%rax"
			);	// Insert trace_tbl to the asm file

TRACE1:
			//TRACE 1 (i%7!=0)
			status = _xbegin ();
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
			tr1++;
			//goto finish_label;

TRACE2:
			//TRACE 2 (i%7==0)
			status = _xbegin ();
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
			tr2++;
			//goto finish_label;

finish_label:
			iter++;
			coeff[key] = true;	// initialize coeff with 'taken'
			key = -1;
		}
	}
	clock_t end = clock ();

	// Finishing executing a predictor
	pthread_join (pred_id, NULL);

	// Calculating the execution time in seconds
	double elapsed = (double) (end-start)/CLOCKS_PER_SEC;
	printf ("EXEC time: %.8f \n", elapsed);

	// Printing some data from the array (to check that everything is correct)
	printf ("\n\n\n****\nCurrent state: %lld %lld %lld %lld\n****\ntr1: %d; tr2: %d\n", var2 [c2], var3 [c3], var10 [c10], var11 [c11], tr1, tr2);
}
