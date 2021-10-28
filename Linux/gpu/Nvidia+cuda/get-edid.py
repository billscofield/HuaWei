#!/usr/bin/env python

import re
import subprocess


def get_edid_for_output(connector: str) -> bytes:
    xrandr = subprocess.run(
        ['xrandr', '--props'],
        check=True,
        stdout=subprocess.PIPE,
    )

    lines = [b.decode('utf-8') for b in xrandr.stdout.split(b'\n')]
    for i, line in enumerate(lines):
        connector_match = re.match('^{} connected'.format(connector), line)
        if connector_match:
            for j in range(i + 1, len(lines)):
                edid_match = re.match(r'\s*EDID:', lines[j])
                if edid_match:
                    edid = ''
                    for k in range(j + 1, len(lines)):
                        if re.match(r'^\s*[0-9a-f]{32}$', lines[k]):
                            edid += lines[k].strip()
                        elif edid:
                            return bytes.fromhex(edid)


if __name__ == '__main__':
    from sys import argv, stdout, exit

    if len(argv) != 2:
        from os.path import basename
        exit('Usage: {} _OUTPUT_ > output.bin'.format(basename(argv[0])))
    connector = argv[1]

    edid = get_edid_for_output(connector)
    if edid:
        stdout.buffer.write(edid)
    else:
        exit('Could not find an EDID for output: {}'.format(connector))
