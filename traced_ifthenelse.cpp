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
volatile short key = 0, HR = 0;
volatile unsigned long long addr = -1;
volatile unsigned long long traceAddr [NUMOFTRACES] = {1, 2};
volatile short PHT [PHTSIZE]; 		// will be initialized later
volatile bool coeff [NUMOFTRACES]; 	// will be initialized later

// Predictor function
void* predictor (void* arg)
{
	// TODO: initialization of a predictor 
	
	while (true)
	{
		key = PHT [HR];
		addr = traceAddr [key];

		// Speculative modifications of a predictor
		HR = HR << 2;		// shifting HR 
		HR += key;		// and writing there a key
		coeff [key] = true;

		while (var >= 0) { }	// Synchronization with a trace thread

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
	int tr1 = 0, tr2 = 0;

	// Starting a predictor thread
	pthread_t pred_id;
	pthread_create (&pred_id, NULL, predictor, NULL);
	
	// Main loop
	clock_t start = clock ();
	for (int j = 0; j < 500; j++)
	{
		for (int i = 0; i < 700014; i++)
		{
			while (addr < 0) { }			// Synchronization
			// TODO: asm mov rax, [addr]
			// TODO: asm jmp *(rax)
			asm volatile
			(
				"mov %1, %%eax"
				"jmp *(%%eax)"
				: "=r" (addr)
				: "r" (addr)
				: "%eax"
			);

			//TRACE 1 (i%7!=0)
			unsigned status = _xbegin ();
			if (status == _XBEGIN_STARTED)
			{
				if (i%7 == 0) _xabort (1);
                        	var2 [i%7] = var3 [i+j];
                        	var3 [i/7] = 2;
                		var10 [i/7] += var3 [i%7];
                		var11 [i+j]++;
				tr1++;
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
				tr1++;
				// !!! Starting from here we assume that all speculative updates from the predictor thread is finished
				HR = HR >> 2;		// get rid of an incorrect key
				// !!! after shift we do not get previous version of HR (the one that the prediction was based on)
				if (!coeff [key]) PHT[HR] = correctKey;
				else coeff [key] = false;
				HR = HR << 2;		// shifting HR 
				HR += correctKey;	// and writing there a key
				coeff[correctKey] = true;	// initialize coeff with 'taken'
			}
			goto finish_label;

			//TRACE 2 (i%7==0)
			unsigned status = _xbegin ();
			if (status == _XBEGIN_STARTED)
			{
				if (i%7 != 0) _xabort (2);
                        	var3 [i] += var2 [i+j];
                        	var2 [i/7] -= var11 [i+j];
                		var10 [i/7] += var3 [i%7];
                		var11 [i+j]++;
				tr2++;
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
				tr2++;
				// !!! Starting from here we assume that all speculative updates from the predictor thread is finished
				HR = HR >> 2;		// get rid of an incorrect key
				// !!! after shift we do not get previous version of HR (the one that the prediction was based on)
				if (!coeff [key]) PHT[HR] = correctKey;
				else coeff [key] = false;
				HR = HR << 2;		// shifting HR 
				HR += correctKey;	// and writing there a key
				coeff[correctKey] = true;	// initialize coeff with 'taken'
			}
			goto finish_label;

finish_label:
			addr = -1;
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
