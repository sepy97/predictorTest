#include <cstdio>
#include <ctime>
#include <cstdlib>

using namespace std;

int main ()
{
	int var2 = 1, var3 = 0, var10 = 2, var11 = 5;
	for (int i = 0; i < 100000; i++)
	{
		if (i%7 == 0)
		{
			var3 += var2;
			var2 -= var11;
		}
		else
		{
			var2 = var3;
			var3 = 2;
		}
		var10 += var3;
		var11++;

	}

	printf ("\n\n\n****\nCurrent state: %d %d %d %d\n****\n", var2, var3, var10, var11);
}
