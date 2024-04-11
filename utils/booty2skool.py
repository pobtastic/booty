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

    def movement(self, byte):
        return { 0x00: 'none', 0x01: '+1', 0xFF: '-1'}.get(byte, 'unknown')

    def get_room_data(self):
        lines = []

        addr = 0xBAAB
        start = 0xBAAB
        end = 0xBAD3
        id = 21
        while addr <= end:
            room_data = self.snapshot[addr] + (self.snapshot[addr + 0x01] * 0x100)
            lines.append(f"g ${room_data:04X} Data: Room #{id:02d}")
            lines.append(f"@ ${room_data:04X} label=DataRoom{id:02d}")
            if id == 21:
                lines.append(f"D ${room_data:04X} Note; although this room is present in code, it's unreachable and fairly \"broken\".")
                lines.append(f". See #LINK:Rooms#room_{id:02d}(Room #{id:02d}).")
            else:
                lines.append(f"D ${room_data:04X} See #LINK:Rooms#room_{id:02d}(Room #{id:02d}).")
            lines.append(f'N ${room_data:04X} #HTML(<img alt="room-bare-{id:02d}" src="../images/scr/room-bare-{id:02d}.png">)')
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
            room_data += 0x01
            lines.append(f"N ${room_data:04X} Room scaffolding:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Scaffold #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 Length: #N(#PEEK(#PC)).")
                room_data += 0x01
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")

            room_data += 0x01

            lines.append(f"N ${room_data:04X} Doors:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Door #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 Colour: #INK(#PEEK(#PC)).")
                room_data += 0x01
                lines.append(f"B ${room_data:04X},$01 Leads to room: #N(#PEEK(#PC)).")
                room_data += 0x01
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")

            room_data += 0x01

            lines.append(f"N ${room_data:04X} Ladders:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Ladder #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")

            room_data += 0x01

            lines.append(f"N ${room_data:04X} Keys and locked doors.")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Key/ Door #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                room_data += 0x01
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                room_data += 0x01
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")

            room_data += 0x01

            lines.append(f"N ${room_data:04X} Portholes:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Porthole #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).")
                room_data += 0x01
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")

            room_data += 0x01

            lines.append(f"N ${room_data:04X} Pirates:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Pirate #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                room_data += 0x0E
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")

            room_data += 0x01

            lines.append(f"N ${room_data:04X} Items:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Item #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 Colour: #INK(#PEEK(#PC)).")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).")
                room_data += 0x01
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")
            room_data += 0x01

            lines.append(f"N ${room_data:04X} Furniture:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Item #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).")
                room_data += 0x01
                lines.append(f"B ${room_data:04X},$01 Colour: #INK(#PEEK(#PC)).")
                room_data += 0x01
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")
            room_data += 0x01

            lines.append(f"N ${room_data:04X} Lifts:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Lift #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$02")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 Horizontal movement: {self.movement(self.snapshot[room_data])}.")
                room_data += 0x01
                lines.append(f"B ${room_data:04X},$01 Vertical movement: {self.movement(self.snapshot[room_data])}.")
                room_data += 0x04
                lines.append(f"B ${room_data:04X},$01 Colour: #INK(#PEEK(#PC)).")
                room_data += 0x07
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")
            room_data += 0x01

            lines.append(f"N ${room_data:04X} Disappearing floors:")
            count = 0x01
            while self.snapshot[room_data] != 0xFF:
                lines.append(f"N ${room_data:04X} Instance #{count:02d}.")
                lines.append(f"B ${room_data:04X},$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).")
                room_data += 0x02
                lines.append(f"B ${room_data:04X},$01 Width: #N(#PEEK(#PC)).")
                room_data += 0x04
                count += 0x01
            lines.append(f"B ${room_data:04X},$01 Terminator.")
            room_data += 0x01

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
