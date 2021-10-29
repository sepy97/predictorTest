#include <cstdio>
#include <ctime>
#include <cstdlib>
#include <vector>
#include <string>
#include <queue>
#include <iostream>
#include <fstream>
#include <sstream>

using namespace std;

typedef unsigned long long llu;

/* ================================================================== */
// States of a FSM
/* ================================================================== */
enum TwoBitState {STRONGLY_NOT_TAKEN=0, WEAKLY_NOT_TAKEN=1, WEAKLY_TAKEN=2, STRONGLY_TAKEN=3};

class myTrace
{
	public:
		myTrace () 
		{
			this->head = 0;
			vector <llu> tst;
			this->branches = tst;
		}

		myTrace (llu head)
		{
			this->head = head;
			vector <llu> tst;
			this->branches = tst;
		}

		myTrace (llu head, vector <llu> branches)
		{
			this->head = head;
			this->branches = branches; 
		}

		llu getHead () const
		{
			return this->head;
		}

		vector <llu> getBranches () const
		{
			return branches;
		}

		llu getHashedBranches () const
		{
			llu result = 0;
			for (int i = branches.size (); --i >= 0; )
			{
				llu value = branches [i] % 65536; //16^4
				result += value;
				result = result << 16; //2^16 = 16^4
			}
			return result;
		}

		bool isEmpty () const 
		{
			if (this == NULL) return true;
			if (this->head == 0) return true;
			return false;
		}

		bool operator == (const myTrace& toCompare)
		{
			if (toCompare.getHead () != this->head) return false;
			if (toCompare.getHashedBranches () != this->getHashedBranches ()) return false;
			return true;
		}

		string toString ()
		{
			std::stringstream ss;
			ss << hex << head << ": ";

			vector <llu> tmp = branches;
			while (tmp.size () > 0)
			{
				llu brAddress = tmp.front ();
				ss << hex << brAddress;
				tmp.erase (tmp.begin ());
				if (tmp.size () > 0) ss << ", ";

			}
			ss << "\n";

			std::string result = ss.str ();
			return result;
		}
			

	private:
		llu head;
		vector <llu> branches;
};

enum predictionMode
{
	TRAIN = 0,
	PREDICT = 1
};

class TracePredictor
{
	public:
		TracePredictor ()
		{
			for (int i = 0; i < 4; i++)
			{
				HR.push (myTrace());
			}
			mode = TRAIN;
		}

		/*
		 *	getKey -- hash function that generates int value from 4 Traces and make entree key out of them 
		 */
		llu getKey (myTrace toUpdate, queue <myTrace> state)	
		{
			queue <myTrace> tmpState = state;
			tmpState.push (toUpdate);
			llu key = 0;
			llu K = 0;
			for (unsigned i = 0; i < tmpState.size (); i++)
			{
				myTrace elem = tmpState.front ();
				K += elem.getHead () ^ elem.getHashedBranches ();
				tmpState.pop ();
			}
			const unsigned a = 1580030173;
			const short w = 281;
			key = (a * K) >> (w - size);
			return key %size; 	
		}

		myTrace getCurrentTrace ()
		{
			return currentTrace;
		}

		void fill (myTrace* toFill) 
		{
			llu key = getKey (*toFill, HR);
			PHT[key] = make_pair (*toFill, WEAKLY_TAKEN);	
		}

		void predict ()
		{
			queue <myTrace> state = HR;
			
			llu key = getKey (currentTrace, state);

			pair <myTrace, TwoBitState> entree = PHT [key];

			if (entree.second > 1) 
			{
				this->currentTrace = entree.first;
				mode = PREDICT;
			}
			else 
			{
				this->currentTrace = myTrace();
				mode = TRAIN;
			}
		}

		bool update (myTrace* arg)
		{
			myTrace toUpdate = *arg;
			bool traceTaken = false;
			if (toUpdate == currentTrace) traceTaken = true;
			llu key = getKey (toUpdate, HR);

			switch (PHT[key].second)
			{
				case STRONGLY_NOT_TAKEN:
					if (traceTaken) PHT[key].second = WEAKLY_NOT_TAKEN;
					else PHT[key].second = STRONGLY_NOT_TAKEN;
					break;
				case WEAKLY_NOT_TAKEN:
					if (traceTaken) PHT[key].second = WEAKLY_TAKEN;
					else PHT[key].second  = STRONGLY_NOT_TAKEN;
					break;
				case WEAKLY_TAKEN:
					if (traceTaken) PHT[key].second  = STRONGLY_TAKEN;
					else PHT[key].second  = WEAKLY_NOT_TAKEN;
					break;
				case STRONGLY_TAKEN:
					if (traceTaken) PHT[key].second  = STRONGLY_TAKEN;
					else PHT[key].second  = WEAKLY_TAKEN;
					break;
			}

			if (!traceTaken && PHT[key].second <= 1)
			{
				fill (arg);
			}

			HR.push (toUpdate);
			HR.pop ();

			return true;
		}	

		bool getMode ()
		{
			return mode;
		}

	private:
		static const short size = 256;		// 2^k = 256
		pair <myTrace, TwoBitState> PHT[size];
		queue <myTrace> HR;//[4]; 	// k = 4*2
		myTrace currentTrace;
		predictionMode mode;// = TRAIN;
};

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
TracePredictor oracle;
int main ()
{
	//Trace construction -- should be done by a compiler and inserted here (right before the loop
	//
	vector <llu> v1 {1};
	vector <llu> v2 {0};
	/*
	void* p1 = &&TRACE1;
	void* p2 = &&TRACE2;

	myTrace tr1 = myTrace ((intptr_t)p1, v1);
	myTrace tr2 = myTrace ((intptr_t)p2, v2);
*/
	myTrace tr1 = myTrace (1, v1);
	myTrace tr2 = myTrace (2, v2);
	oracle = TracePredictor ();
	myTrace* arg ;//= myTrace ();

	//variable initialization
	int var2 = 1, var3 = 0, var10 = 2, var11 = 5;
	//the beginning of the loop
	for (int i = 0; i < 100 /* 000 */ ; i++)
	{
		//call a predictor
		oracle.predict ();
		if (oracle.getMode () == TRAIN)
		{
			//just execute original version of the code
			if (i%7 == 0)
			{
				arg = &tr1;
				var3 += var2;
				var2 -= var11;
			}
			else
			{
				arg = &tr2;
				var2 = var3;
				var3 = 2;
			}
			var10 += var3;
			var11++;

			// need arg as a myTrace* to update the predictor
			oracle.fill (arg);
		}
		else if (oracle.getMode () == PREDICT)
		{
			//choose a trace
			//
			*arg = oracle.getCurrentTrace ();
			if (*arg == tr1) 
			{
				std::cout << "TRACE 1" << std::endl;
TRACE1:
// vector = {1}
				var3  += var2;
				var2  -= var11;
				var10 += var3;
				var11 ++;
			}
			else if (*arg == tr2) 
			{
				std::cout << "TRACE 2" << std::endl;
TRACE2:
// vector = {0}
				var2  = var3;
				var3  = 2;
				var10 += var3;
				var11 ++;
			}
			else
			{
				std::cout << "NOTHING!" << std::endl;
// original version of the code
NONOPTIMIZED:
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




		}
		
		oracle.update (arg);
	}

	printf ("\n\n\n****\nCurrent state: %d %d %d %d\n****\n", var2, var3, var10, var11);
}
