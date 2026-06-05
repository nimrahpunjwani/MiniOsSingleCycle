#!/usr/bin/env python3
import sys
from pathlib import Path

def byte_to_sw_bits(b):
    return ''.join(str((b>>i)&1) for i in range(8))  # LSB first (SW0..SW7)

def render_sequence(s):
    lines = []
    for i,ch in enumerate(s):
        b = ord(ch)
        bits = byte_to_sw_bits(b)
        lines.append(f"#{i} '{ch}' 0x{b:02x} bits SW7..SW0={bits[::-1]} (display order) | SW0..SW7={bits}")
        lines.append(f"SET {bits}    # set switches SW0..SW7 to these values (LSB=SW0)")
        lines.append(f"STROBE       # press STROBE to latch")
        lines.append("")
    return '\n'.join(lines)

if __name__ == '__main__':
    if len(sys.argv) > 1:
        s = sys.argv[1]
    else:
        s = 'run\n'
    out = Path(__file__).resolve().parent.parent / f"input_sequence_{'_'.join(c for c in s if c.isalnum()) or 'seq'}.txt"
    out_text = render_sequence(s)
    out.write_text(out_text)
    print('wrote', out)
