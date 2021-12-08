#include <cstdio>
#include <ctime>
#include <cstdlib>

using namespace std;

long long var2[2000000], var3[2000000], var10[2000000], var11[2000000];

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

	//srand (time (NULL));

	// Initializing arrays
	for (int i = 0; i < 2000000; i++) 
	{
		var2 [i] = rand () % 500;
		var3 [i] = rand () % 500;
		var10[i] = rand () % 500;
		var11[i] = rand () % 500;
	}
	int tr0 = 0;
	
	// Main loop
	clock_t start = clock ();
	for (int j = 0; j < 500; j++)
	{
		for (int i = 0; i < 700014; i++)
		{
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
			tr0++;

		}
	}
	clock_t end = clock ();

	// Calculating the execution time in seconds
	double elapsed = (double) (end-start)/CLOCKS_PER_SEC;
	printf ("EXEC time: %.8f \n", elapsed);

	// Printing some data from the array (to check that everything is correct)
	printf ("\n\n\n****\nCurrent state: %lld %lld %lld %lld\n****\ntr0: %d\n", var2 [c2], var3 [c3], var10 [c10], var11 [c11], tr0);
}
