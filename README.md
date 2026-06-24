MiniOS (minimal) - quick start

This small scaffold builds a tiny RV32 kernel that writes to a memory-mapped console at 0x10000000.

Prerequisites
- WSL/Ubuntu with riscv toolchain installed (you have `riscv64-unknown-elf-gcc`)

Build

In WSL, from this project folder run:

```bash
make
```

This produces `kernel.elf` and `kernel.bin`.

Notes
- The linker script places `.text` at 0x00000000 and RAM at 0x80000000 (64 MiB). Adjust `linker.ld` to match your Logisim RAM base and size.
- Add a Logisim peripheral that detects writes to `0x10000000` and outputs the low byte to a Probe/LED to see console output.

Run the kernel in Chisel

After `make` produces `kernel.hex`, you can install it into the Chisel project's instruction ROM so `InsMem` will load it by default:

```bash
make install-ins
```

Then run the kernel inside the Chisel simulator (this will print the MMIO console output):

```bash
cd SingleCycle/SingleCycle
sbt "testOnly SingleCycle.RunKernelTest"
```

Or run the whole test suite:

```bash
sbt test
```

Next steps I can do for you
- Show how to add the memory-mapped console in your `LOgic circuit.circ`.
- Build and test the binary and load it into Logisim RAM.

How to load `kernel.hex` into Logisim

I added a helper that generates a Logisim `<a name="contents">` fragment from `kernel.hex`:

```bash
python3 tools/kernel_to_logisim.py kernel.hex > logisim_fragment.txt
```

Two ways to use this fragment:

- Quick (recommended): open `LOgic circuit.circ` in Logisim, add a ROM component where the instruction memory is expected, open its properties and paste the contents from `logisim_fragment.txt` into the `Contents` field (or point the ROM to a file using the GUI). This makes the kernel available at address 0.
- Advanced: if you prefer `RAM` and need the kernel at `0x80000000`, you'd need to either (a) pad the contents with zeros up to that address (impractically large), or (b) change the CPU/Logisim wiring so the ROM provides instructions at address 0 while the RAM remains mapped at `0x80000000` for data. Option (a) is not recommended.

If you want, I can paste the generated XML fragment into `LOgic circuit.circ` for you, replacing the instruction ROM or adding a ROM component connected to the instruction bus. Say "please patch the .circ" and I'll insert it at the most likely ROM location.

CLI and Logisim input (switches + strobe)

- The provided `LOgic circuit.circ` includes an input UI: `SW0`..`SW7` (LSB = `SW0`) and a `STROBE` pin.
- To type a character into the kernel shell:
	1. Set `SW0..SW7` to the ASCII byte you want (use the binary value; `SW0` is bit0).
	2. Click the `STROBE` pin — this latches the byte into a 32-bit MMIO register.
	3. The kernel reads the latched value at address `0x10000004` and will echo it to the shell.

- Example: to send lowercase `a` (ASCII 0x61): set the switches to `01100001` (SW7..SW0 = 0 1 1 0 0 0 0 1) then press `STROBE`.

Tips for faster input

- Instead of toggling switches for every character, you can type commands by using a prepared plan: set switches to the first byte, click `STROBE`, then change switches, `STROBE`, and so on. It's a little manual but works reliably.
- If you'd like automation, I can add a small helper that drives Logisim via its command-line scripting (or by patching the `LOgic circuit.circ` file directly) to simulate typing a string; tell me and I'll implement it.

Contact

If you want me to commit, tag, or prepare a release artifact (zip with `kernel.hex`, `LOgic circuit.circ`, and `logisim_fragment.txt`), say the word and I'll finish that next.
