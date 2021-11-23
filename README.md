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
ifthenelse.cpp -- source file that I use for speedup measurement; has a loop with a single branch
***
compile.sh -- bash script to compile everything

run.sh -- bash script to execute everything
