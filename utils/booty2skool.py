#!/usr/bin/env python3
import sys
import os
import argparse
from collections import OrderedDict
from disassemble import Disassemble

try:
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool
except ImportError:
    SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
    if not SKOOLKIT_HOME:
        sys.stderr.write('SKOOLKIT_HOME is not set; aborting\n')
        sys.exit(1)
    if not os.path.isdir(SKOOLKIT_HOME):
        sys.stderr.write('SKOOLKIT_HOME={}; directory not found\n'.format(SKOOLKIT_HOME))
        sys.exit(1)
    sys.path.insert(0, SKOOLKIT_HOME)
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool

BOOTY_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUILD_DIR = '{}/sources'.format(BOOTY_HOME)
BOOTY_Z80 = '{}/Booty.z80'.format(BOOTY_HOME)


class Booty:
    def __init__(self, snapshot):
        self.snapshot = snapshot

    def address(self, addr):
        return self.snapshot[addr] + self.snapshot[addr + 0x01] * 0x100

    def get_disassembly(self):
        pc = 0xCD14
        end = 0xCD47
        lines = Disassemble(get_snapshot(BOOTY_Z80), pc, end)
        return lines.run()

    def get_room_data(self):
        lines = []

        addr = 0xBAAB
        start = 0xBAAB
        end = 0xBAD3
        id = 21
        while addr <= end:
            room_data = self.snapshot[addr] + (self.snapshot[addr + 0x01] * 0x100)
            lines.append(f"g ${room_data:04X} Data: Room #{id}")
            lines.append(f"@ ${room_data:04X} label=DataRoom{id}")
            lines.append(f"D ${room_data:04X} ROOM${id:02X}.")
            lines.append(f"N ${room_data:04X} The first seven bytes relate to the colours the room uses. See #R$AB44.")
            lines.append(f"B ${room_data:04X},$01 Key Colour: #INK(#PEEK(#PC)).")
            room_data += 0x01
            lines.append(f"B ${room_data:04X},$01 Closed Door Colour: #INK(#PEEK(#PC)).")
            room_data += 0x01
            lines.append(f"B ${room_data:04X},$01 Unused?: #INK(#PEEK(#PC)).")
            room_data += 0x01
            lines.append(f"B ${room_data:04X},$01 Scaffolding Colour: #INK(#PEEK(#PC)).")
            room_data += 0x01
            lines.append(f"B ${room_data:04X},$01 Border Colour: #INK(#PEEK(#PC)).")
            room_data += 0x01
            lines.append(f"B ${room_data:04X},$01 Paper Colour: #INK(#PEEK(#PC)).")
            room_data += 0x01
            lines.append(f"B ${room_data:04X},$01 Ladder Colour: #INK(#PEEK(#PC)).")
            room_data += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")
            lines.append("")
            addr += 0x02
            id -= 0x01

        return '\n'.join(lines)


def run(subcommand):
    if not os.path.isdir(BUILD_DIR):
        os.mkdir(BUILD_DIR)
    if not os.path.isfile(BOOTY_Z80):
        tap2sna.main(('-d', BUILD_DIR, '@{}/booty.t2s'.format(BOOTY_HOME)))
    booty = Booty(get_snapshot(BOOTY_Z80))
    ctlfile = '{}/{}.ctl'.format(BUILD_DIR, subcommand)
    with open(ctlfile, 'wt') as f:
        f.write(getattr(booty, methods[subcommand][0])())


###############################################################################
# Begin
###############################################################################
methods = OrderedDict((
    ('disassemble', ('get_disassembly', 'Disassemble')),
    ('room_data', ('get_room_data', 'Room Data (43990-47777)'))
))
subcommands = '\n'.join('  {} - {}'.format(k, v[1]) for k, v in methods.items())
parser = argparse.ArgumentParser(
    usage='%(prog)s SUBCOMMAND',
    description="Produce a skool file snippet for \"Booty\". SUBCOMMAND must be one of:\n\n{}".format(
        subcommands),
    formatter_class=argparse.RawTextHelpFormatter,
    add_help=False
)
parser.add_argument('subcommand', help=argparse.SUPPRESS, nargs='?')
namespace, unknown_args = parser.parse_known_args()
if unknown_args or namespace.subcommand not in methods:
    parser.exit(2, parser.format_help())
run(namespace.subcommand)