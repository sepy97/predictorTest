#g++ -O0 ifthenelse.cpp -o baseline_0.out

g++ -O0 -mrtm -S traced_ifthenelse.cpp -o traced.s
