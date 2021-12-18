#include <cstdio>
#include <ctime>
#include <cstdlib>
#include <immintrin.h>
#include <x86intrin.h>
#include <cstdint>

#define CYCLES_PER_SEC 2600000000

using namespace std;

long long var2[2000000], var3[2000000], var10[2000000], var11[2000000];
	
long long tr[3] = {0,0,0};	// Counters for trace decisions -- here it will be only tr[0]

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
	
	// Main loop
	uint64_t start = _rdtsc ();
	//clock_t start = clock ();
	unsigned status = 0;
	for (int j = 0; j < 500; j++)
	{
		for (int i = 0; i < numOfIter/*700014*/; i++)
		{
			status = _xbegin ();
			if (status == _XBEGIN_STARTED) {
			if (i%7 == 0)
                	{
                        	var3 [i] += var2 [i+j];
                        	var2 [i/7] -= var11 [i+j];
                	}
                	else
                	{
                        	var2 [i%7] = var3 [i+j];
                        	var3 [i/7] = 2;
                	}
                	var10 [i/7] += var3 [i%7];
                	var11 [i+j]++;
			tr[0]++;
			if (i%7 == 2) _xabort (1);
			_xend ();
			}

		}
	}
	uint64_t end = _rdtsc ();
	//clock_t end = clock ();

	// Calculating the execution time in seconds
	uint64_t total = end-start;
	printf ("EXEC cycles: %lu \n", total);
	//double elapsed = (double) (total)/CLOCKS_PER_SEC;
	double elapsed = (double) (total)/CYCLES_PER_SEC;
	printf ("EXEC time: %.8f \n", elapsed);

	// Printing some data from the array (to check that everything is correct)
	printf ("\n\n\n****\nCurrent state: %lld %lld %lld %lld\n****\ntr0: %lld; tr1: %lld; tr2: %lld\n", var2 [c2], var3 [c3], var10 [c10], var11 [c11], tr[0], tr[1], tr[2]);

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
