#g++ -O0 -mrtm -S traced_ifthenelse.cpp -o traced.s

g++ -no-pie -O0 -mrtm -g -c traced_0.s -o traced_0.o -lpthread
g++ -no-pie -O0 -mrtm -g traced_0.o -o traced_0.out -lpthread

#g++ -no-pie -O2 -mrtm -g -c traced_2.s -o traced_2.o -lpthread
#g++ -no-pie -O2 -mrtm -g traced_2.o -o traced_2.out -lpthread
