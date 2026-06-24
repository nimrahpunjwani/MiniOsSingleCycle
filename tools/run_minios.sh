#!/usr/bin/env bash
# Build kernel (if toolchain present) and run MiniOS in the Chisel simulator.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if command -v riscv64-unknown-elf-gcc >/dev/null 2>&1; then
  echo "==> Building kernel (make)"
  make
else
  echo "==> Skipping make (riscv64-unknown-elf-gcc not found; using existing kernel.hex)"
fi

if [[ ! -f "$ROOT/kernel.hex" ]]; then
  echo "kernel.hex missing. Install the RISC-V toolchain and run: make"
  exit 1
fi

CMD="${MINIOS_CMD:-help\n}"
echo "==> Simulating MiniOS (command script: $(printf '%q' "$CMD"))"
echo "    Set MINIOS_CMD='run\n' for Space Invaders (slow)."

cd "$ROOT/SingleCycle/SingleCycle"
export MINIOS_CMD="$CMD"
sbt -batch "testOnly SingleCycle.RunKernelTest" 2>&1 | sed -n '/=== MiniOS output/,/=== end/p'
echo ""
echo "Tip: MINIOS_CMD='run\\n' bash tools/run_minios.sh   # Space Invaders (slow)"
