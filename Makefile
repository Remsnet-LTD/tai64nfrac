# $Id$
# Makefile for tai64nfrac

prefix		= /usr/local
exec_prefix	= /usr/local
bindir		= $(prefix)/bin
mandir		= $(prefix)/man
man1dir		= $(mandir)/man1

CC		= gcc
CFLAGS		= -g -O
LDFLAGS		=
LIBS		=

FILES		= Makefile README VERSION tai64nfrac.c tai64nfrac.pod \
		  tai64nfrac.1

all: tai64nfrac tai64nfrac.1

tai64nfrac: tai64nfrac.o
	$(CC) $(LDFLAGS) -o tai64nfrac tai64nfrac.o $(LIBS)

tai64nfrac.1: tai64nfrac.pod
	pod2man --release=`cat VERSION` --center="User Commands" \
	    --section=1 $< > $@

install: tai64nfrac tai64nfrac.1
	mkdir -p $(bindir)
	cp tai64nfrac $(bindir)
	mkdir -p $(man1dir)
	cp tai64nfrac.1 $(man1dir)

clean:
	rm -f *.o tai64nfrac

distclean: clean
	rm -rf tai64nfrac-*

maintclean: distclean
	rm -f tai64nfrac.1

dist: $(FILES)
	mkdir tai64nfrac-`cat VERSION`
	cp $(FILES) tai64nfrac-`cat VERSION`
	tar cf tai64nfrac-`cat VERSION`.tar tai64nfrac-`cat VERSION`
	gzip -9 tai64nfrac-`cat VERSION`.tar
	rm -rf tai64nfrac-`cat VERSION`
