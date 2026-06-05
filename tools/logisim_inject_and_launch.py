import os
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CIRC = ROOT / "LOgic circuit.circ"
FRAG = ROOT / "logisim_fragment.txt"


def replace_contents() -> None:
    if not CIRC.exists():
        print(f"missing circuit: {CIRC}")
        raise SystemExit(1)
    if not FRAG.exists():
        print(f"missing fragment: {FRAG}")
        raise SystemExit(1)

    circ_text = CIRC.read_text(encoding="utf-8")
    frag_text = FRAG.read_text(encoding="utf-8").strip()

    start = circ_text.find('<a name="contents">')
    if start == -1:
        print("could not find <a name=\"contents\"> in circuit")
        raise SystemExit(1)

    end = circ_text.find('</a>', start)
    if end == -1:
        print("could not find closing </a> for contents block")
        raise SystemExit(1)

    new_text = circ_text[:start] + '<a name="contents">' + frag_text + '</a>' + circ_text[end + 4:]
    CIRC.write_text(new_text, encoding="utf-8")
    print(f"updated contents in {CIRC}")


def launch_logisim() -> None:
    exe = os.environ.get("LOGISIM_EXE", "logisim")
    print(f"launching {exe} {CIRC}")
    try:
        subprocess.Popen([exe, str(CIRC)])
        print("Logisim launched; check the Logisim window for the MMIO_BYTE32 probe output")
    except FileNotFoundError:
        print("logisim was not found on PATH")
        print("set LOGISIM_EXE to the full path of logisim.exe or open LOgic circuit.circ manually")
        raise SystemExit(1)


if __name__ == "__main__":
    replace_contents()
    if len(sys.argv) > 1 and sys.argv[1] == "--launch":
        launch_logisim()
    else:
        print("open LOgic circuit.circ in Logisim and use the Probe named MMIO_BYTE32 to see output")
