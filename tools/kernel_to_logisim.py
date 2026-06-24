#!/usr/bin/env python3
"""
Convert a kernel.hex (one 32-bit word per line, little-endian assumed from objcopy output)
into a Logisim `<a name="contents">` fragment suitable for pasting into a ROM/RAM component.

Usage:
  python3 tools/kernel_to_logisim.py kernel.hex > logisim_fragment.txt

The fragment will look like:
  <a name="contents">addr/data: 32 32
  deadbeef
  00112233
  ...
  </a>

Notes:
- Logisim expects the data words in hex per-line (word-wide). If your kernel is little-endian
  the words are already correct for word-aligned memory.
- If you want the kernel to appear at address 0x80000000 in Logisim, you have two options:
  1) Paste this contents into a ROM component that is connected to the instruction bus (address 0)
  2) If you want it in the RAM component whose lowest address is 0, you must either rebase
     the CPU to fetch from 0 or pad the file with zeros up to the desired index (not recommended).
"""
import sys
from pathlib import Path

if len(sys.argv) != 2:
    print("usage: kernel_to_logisim.py <kernel.hex>", file=sys.stderr)
    sys.exit(2)

p = Path(sys.argv[1])
if not p.exists():
    print(f"file not found: {p}", file=sys.stderr)
    sys.exit(2)

lines = [l.strip() for l in p.read_text(encoding='utf-8').splitlines() if l.strip()]
# Normalize: ensure 8 hex chars per line
normalized = []
for ln in lines:
    s = ln.replace("0x","").replace("_","")
    s = s.strip()
    if len(s) == 0:
        continue
    # accept 8 or fewer hex digits; pad to 8
    if len(s) <= 8:
        s = s.rjust(8, '0')
    else:
        s = s[-8:]
    normalized.append(s.lower())

print('<a name="contents">addr/data: 32 32')
for word in normalized:
    print(word)
print('</a>')
