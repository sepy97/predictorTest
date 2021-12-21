#g++ -g -O0 ifthenelse.cpp -o baseline_0.out
g++ -g -O2 ifthenelse.cpp -o baseline_2.out

#g++ -g -O0 -mrtm -S traced_ifthenelse.cpp -o traced_0.s
g++ -g -O2 -mrtm -S traced_ifthenelse.cpp -o traced_2.s
