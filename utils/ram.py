# Copyright 2024 Paul Maddern
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

def populate_room_data(snapshot):
    snapshot[0xBAA5], snapshot[0xBAA6] =  0xAB, 0xBA
    de = 0xBCCB
    hl = 0xABD6

    while True:
        old_hl = hl
        hl = snapshot[0xBAA5] + (snapshot[0xBAA6] << 8)

        snapshot[hl], snapshot[hl + 1] = de & 0xFF, (de >> 8) & 0xFF
        hl += 0x02

        snapshot[0xBAA5], snapshot[0xBAA6] = hl & 0xFF, (hl >> 8) & 0xFF
        hl = old_hl

        if snapshot[hl] == 0xFF:
            snapshot[0x5BD3] = 0x01
            break

        b_values = [0x01, 0x03, 0x04, 0x02, 0x06, 0x03, 0x10, 0x07, 0x04, 0x10, 0x06]
        for b in b_values:
            old_b = b
            while True:
                a = snapshot[hl]
                if a == 0xFF:
                    snapshot[de] = a
                    de += 0x01
                    hl += 0x01
                    break
                else:
                    while b > 0x00:
                        snapshot[de] = a
                        de += 0x01
                        hl += 0x01
                        a = snapshot[hl]
                        b -= 0x01
                    b = old_b
