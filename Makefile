CROSS_COMPILE 	?=
CROSS_PREFIX	?=
CC		:= $(CROSS_COMPILE)gcc
CXX		:= $(CROSS_COMPILE)g++
CFLAGS 	?= -I. -g -O0 -std=gnu11
CXXFLAGS?= -I. -g -std=gnu++11 `pkg-config --cflags --libs opencv`
LDFLAGS	?=
LIBS	:= -larducam_mipicamera -lpthread #-lwiringPi
OLIB	:= lib
example := arducamstill
%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: $(example)

arducamstill: arducamstill.c
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ $^ $(LIBS)
clean:
	-rm -f *.o
	-rm -f $(example)

.PHONY: install

install: 
	sudo install -m 644 $(OLIB)/libarducam_mipicamera.so /usr/lib/

