import os
import zipfile

root = os.path.dirname(__file__)
files = [
    'kernel.hex',
    'LOgic circuit.circ',
    'logisim_fragment.txt',
    'README.md',
    'main.c',
    'tools/kernel_to_logisim.py'
]
out = os.path.join(root, 'minios_release.zip')
with zipfile.ZipFile(out, 'w', compression=zipfile.ZIP_DEFLATED) as z:
    for f in files:
        p = os.path.join(root, f)
        if os.path.exists(p):
            z.write(p, arcname=os.path.basename(p))
        else:
            print('missing', f)
print('wrote', out)
