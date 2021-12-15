#./baseline_0.out 1 2 3 4 v 126 >> log_baseline_0.txt
#./baseline_2.out 1 2 3 4 v 126 >> log_baseline_2.txt

#./baseline_0.out 1 2 3 4 r 700014
#./baseline_2.out 1 2 3 4 r 700014


#./traced_0.out 1 2 3 4 v 126 >> log_traced_0.txt
#./traced_2.out 1 2 3 4 v 126 >> log_traced_2.txt

#./traced_0.out 1 2 3 4 r 700014
#./traced_2.out 1 2 3 4 r 700014

################################################################
# Run on a SINGLE core
taskset --cpu-list 1,2 ./baseline_0.out 1 2 3 4 r 714
#taskset --cpu-list 1 ./baseline_2.out 1 2 3 4 r 700014

taskset --cpu-list 1,2 ./traced_0.out 1 2 3 4 r 714
