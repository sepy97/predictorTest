#g++ -O0 -mrtm -S traced_ifthenelse.cpp -o traced.s
g++ -no-pie -O0 -mrtm -g -c manuallyModifiedTrace.s -o traced.o -lpthread
g++ -no-pie -O0 -mrtm -g traced.o -o traced.out -lpthread
