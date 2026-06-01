#!/usr/bin/env python3
import sys
from pathlib import Path


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: bin2hex.py <input.bin> <output.hex>", file=sys.stderr)
        return 2

    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])
    data = input_path.read_bytes()

    if len(data) % 4:
        data += b"\x00" * (4 - (len(data) % 4))

    with output_path.open("w", encoding="utf-8") as handle:
        for index in range(0, len(data), 4):
            word = int.from_bytes(data[index:index + 4], "little")
            handle.write(f"{word:08x}\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())