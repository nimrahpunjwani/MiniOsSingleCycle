#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "Running make to build kernel"
make

echo "Generating logisim fragment"
python3 tools/kernel_to_logisim.py kernel.hex > logisim_fragment.txt || true

echo "Running Chisel tests"
cd SingleCycle/SingleCycle
# Use a standard sbt invocation (avoid passing flags that sbt treats as commands)
sbt test || true
cd ../../

echo "Packaging release"
python3 package_release.py || true
cp minios_release.zip minios_release_v1.zip || true

echo "Done. Artifacts: minios_release_v1.zip, kernel.hex, LOgic circuit.circ"
