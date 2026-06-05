#!/usr/bin/env bash
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KERNEL="$ROOT/kernel.elf"
if [ ! -f "$KERNEL" ]; then
  echo "kernel.elf not found in project root; build it with 'make'"
  exit 1
fi
if ! command -v qemu-system-riscv32 >/dev/null 2>&1; then
  echo "qemu-system-riscv32 not found. On Ubuntu: sudo apt install qemu-system-misc"
  exit 1
fi
qemu-system-riscv32 -machine sifive_e -nographic -kernel "$KERNEL"
