SHELL=/bin/sh
CC=/usr/bin/gcc
TARGET=nsssh

BUILD_DIR=build

SRC=file_parse.c
OBJ=$(BUILD_DIR)/$(SRC:.c=.o)

LIB=

INCLUDE=-I./file_parse

CFLAGS=-std=c99 -o
ALL_CFLAGS= -Wall -Werror $(INCLUDE) $(CFLAGS)

vpath %.o build

.SUFFIXES:
.SUFFIXES:
	.c .o

all:$(TARGET)

.c.o:
	$(CC) $(CFLAGS) $<


$(TARGET): $(OBJ) $(TARGET).c
	gcc $(ALL_CFLAGS) $(TARGET) $(TARGET).c $(OBJ) $(LIB)

clean:
	@rm -f $(OBJ) $(TARGET).o $(TARGET)

depend:
	makedepend -- $(CFLAGS) -- $(INCLUDE) -- $(BUILD_DIR)/$(SRC) $(TARGET).c

build/file_parse.o: file_parse/file_parse.c file_parse/file_parse.h
	$(CC) $(CFLAGS) -c $< -o $@
