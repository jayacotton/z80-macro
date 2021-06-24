CFILES = $(wildcard *.c)
OFILES = $(CFILES:.c=.o)

CFLAGS = +cpm -Wall --list -DCPM -pragma-include:zpragma.inc
LFLAGS = +cpm -m -create-app -pragma-include:zpragma.inc

macro: $(OFILES) 
	zcc $(LFLAGS) -omacro $(OFILES)

%.o: %.c
	zcc $(CFLAGS) -o $@ -c $^

clean:
	rm *.o *.err *.lis *.def *.sym *.exe *.COM macro *.map

install:
	sudo cp ./*.COM /var/www/html/.
