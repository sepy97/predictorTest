#./baseline_0.out 1 2 3 4 v 126 >> log_baseline_0.txt
#./baseline_2.out 1 2 3 4 v 126 >> log_baseline_2.txt

#./baseline_0.out 1 2 3 4 r 700014
#./baseline_2.out 1 2 3 4 r 700014

#./traced_0.out 1 2 3 4 v 126 >> log_traced_0.txt
#./traced_2.out 1 2 3 4 v 126 >> log_traced_2.txt

#./traced_0.out 1 2 3 4 r 7014
#./traced_2.out 1 2 3 4 r 7014

################################################################
# Run on a SINGLE core

#taskset --cpu-list 2 ./baseline_0.out 1 2 3 4 r 70
#taskset --cpu-list 1 ./baseline_2.out 1 2 3 4 r 700014

#taskset --cpu-list 2 ./traced_0.out 1 2 3 4 r 70

################################################################
# Run using Intel SDE

#sde64 -tsx -tsx-stats -- taskset --cpu-list 0,2 ./baseline_0.out 1 2 3 4 r 7014
sde64 -tsx -tsx-stats -- taskset --cpu-list 0,2 ./baseline_2.out 1 2 3 4 r 7014

#sde64 -tsx -tsx-stats -- taskset --cpu-list 0,2 ./traced_0.out 1 2 3 4 r 7014
sde64 -tsx -tsx-stats -- taskset --cpu-list 0,2 ./traced_2.out 1 2 3 4 r 7014

################################################################
# Run VTune analysis

#vtune -collect tsx-exploration -knob analysis-step=aborts -- ./traced_0.out 1 2 3 4 r 7014 >> ./logs/vtune_traced_0.txt

#vtune -collect hotspots -- ./traced_0.out 1 2 3 4 r 7014

