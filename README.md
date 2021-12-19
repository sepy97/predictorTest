# predictorTest
Here I do my research on trace prediction
***
test_1.cpp -- source file that contains a very basic loop with a single branch

test_1_opt.cpp -- source file that has the same loop with manually generated traces and very old OOP-based trace predictor
***
predict.pseudo -- pseudocode of a much faster predictor (running in a separate thread)

trace.pseudo -- pseudocode of a loop that executes traces predicted by a 'predict' thread

trace_condAtTheEnd.pseudo -- alternative version of a pseudocode of a loop; main difference is that branch conditions are checked (and captured) at the end of a trace
***
# Shared variables that make up the predictor
key -- the way to identify each trace by a sequence of taken/not taken branches inside of it; for traces with 2 branches there are 4 possible keys (0b00 or 0 in decimal, 0b01 or 1 in decimal, 0b10 or 2 in decimal, 0b11 or three in decimal) and 4 corresponding traces.

var -- the address of a trace that we've predicted. Can be -1 if we're waiting for a prediction.

HR -- history register; containts 4 most recent keys.

PHT -- history table where for each possible HR we have some key.

traceAddr -- array that keeps a physical address for each trace that is identified by a key

coeff -- table of states for each HR (00 -- strongly not taken, 01 -- weakly not taken, 10 -- weakly taken, 11 -- strongly taken).
***
ifthenelse.cpp -- source file that I use for speedup measurement; has a loop with a single branch

traced_ifthenelse.cpp -- source file with manually generated (on a source-level) traces

traced_0.s -- assembly file with traces and manually inserted trace_tbl (aka trace_addr from pseudocode) and jmps to traces

transactionalOverhead_ifthenelse.cpp -- source file where transactional instructions (xbegin and xend) were added to the ifthenelse loop. It's done to measure the overhead that is caused solely by transactional memory itself.
***
compile.sh -- bash script to compile everything

run.sh -- bash script to execute everything
