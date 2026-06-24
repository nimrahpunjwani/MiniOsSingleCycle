#!/usr/bin/env bash
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KERNEL="$ROOT/kernel.elf"
if [ ! -f "$KERNEL" ]; then
  echo "kernel.elf not found in project root; build it with 'make'"
  exit 1
fi
if ! command -v spike >/dev/null 2>&1; then
  echo "spike not found on PATH. On Ubuntu: sudo apt install spike (package name may vary)."
  exit 1
fi
spike pk "$KERNEL"
