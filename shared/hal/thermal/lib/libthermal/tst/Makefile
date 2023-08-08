# SPDX-License-Identifier: LGPL-2.1+
CC=gcc
DEPS = ../include/libthermal.h
LIB=../src/libthermal.so
C_BINS=tst_thermal.c
CFLAGS=-Wall -Wno-unused

BINS=$(C_BINS:.c=)

tests: $(LIB) $(BINS)

$(BINS): $(C_BINS)
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $< -o $@ -lthermal -L../src -Wl,-rpath=../src -I../include

clean:
	rm -f $(BINS) *~
