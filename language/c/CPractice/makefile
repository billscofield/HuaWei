.PHONY: all clean
CC = gcc
CFLAGS = -g -Wall
TARGET = run

all: $(TARGET) clean

$(TARGET):%.o
	$(CC) $^ $(CFLAGS) -o $@

%.o:%.c
	$(CC) $^ -c $(FLAGS) -o $@

clean:
	$(RM) -r ./*.o

