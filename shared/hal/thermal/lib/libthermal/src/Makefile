# SPDX-License-Identifier: LGPL-2.1+
CC=gcc
CFLAGS+=-g -Wall -Wno-unused -I/usr/include/libnl3 -I../include -fPIC -Wextra -O2
LDFLAGS=-lnl-genl-3 -lnl-3 -shared
DEPS = include/libthermal.h
OBJS = thermal.o events.o sampling.o commands.o thermal_nl.o
LIB=libthermal.so

BINS=$(C_BINS:.c=)

default: libthermal.so

%.o: %.c $(DEPS)
	$(CROSS_COMPILE)$(CC) -c -o $@ $< $(CFLAGS)

$(LIB): $(OBJS)
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

clean:
	rm -f $(OBJS) $(LIB) *~
