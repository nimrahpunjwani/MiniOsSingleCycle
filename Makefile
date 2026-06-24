# MiniOS Makefile (RV32)
CC = riscv64-unknown-elf-gcc
OBJCOPY = riscv64-unknown-elf-objcopy
PYTHON = python3
CFLAGS = -march=rv32i -mabi=ilp32 -O2 -Wall -ffreestanding -nostdlib
LDFLAGS = -T linker.ld
SRCS = start.S trap.S main.c
OBJS = $(SRCS:.S=.o)
OBJS := $(OBJS:.c=.o)

all: kernel.elf kernel.bin kernel.hex

kernel.elf: start.o trap.o main.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.S
	$(CC) $(CFLAGS) -c -o $@ $<

kernel.bin: kernel.elf
	$(OBJCOPY) -O binary $< $@

kernel.hex: kernel.bin tools/bin2hex.py
	$(PYTHON) tools/bin2hex.py $< $@

clean:
	rm -f *.o kernel.elf kernel.bin kernel.hex

install-ins: kernel.hex
	@echo "Installing kernel.hex into SingleCycle InsMem resource..."
	cp kernel.hex SingleCycle/SingleCycle/src/main/resources/INS.hex || true

.PHONY: install-ins
