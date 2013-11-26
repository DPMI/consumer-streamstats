# Time-stamp: <02/11/09 10:40:24 INGA>
# File: Makefile
# LinkAggregator
#clients


CFLAGS  += -Wall -g -O0
LDFLAGS +=

OBJECTd= main.o
targetd= stream_statistics

all: $(OBJECTd)	
	$(CXX) -o $(targetd) $(LDFLAGS) $(OBJECTd) $(shell pkg-config libcap_utils-0.7 libcap_filter-0.7 --libs) -lqd

clean:
	rm -f *.o $(OBJECTd)

install:
	cp $(targetd) /usr/local/bin/streamstats

main.o: main.cpp
	$(CXX) $(CFLAGS) $(shell pkg-config libcap_stream-0.7 --cflags) -c main.cpp -o main.o
