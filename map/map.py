import json
import sys

rom = open('build/satellite-7-japan.sms', 'rb')

def chunk_list(lst, n):
    r = []
    for i in range(0, len(lst), n):
        r.append(lst[i:i + n])
    
    return r


mapblocks = []
metatiles = []

def rw (addr):
    rom.seek(addr)
    return int.from_bytes(rom.read(2), byteorder='little')

def rb (addr):
    rom.seek(addr)
    return int.from_bytes(rom.read(1), byteorder="little")

for i in range(0, 492, 2):
    pos = 0x6469 + i
    word = rw(pos)
    
    chunk = []
    chunk_count = 0
    chunk_ptr = word
    while (chunk_count < 44):

        command = rb(chunk_ptr)
        
        if command & 0x80:
            block_count = command & 0x7F
            chunk_count += block_count

            print("RAW " + hex(block_count))

            for j in range(block_count):
                chunk_ptr += 1
                chunk.append(rb(chunk_ptr) + 1)
            
            chunk_ptr += 1

        else:
            print("RUN " + hex(command))

            chunk_count += command
            value = rb(chunk_ptr + 1)
            for j in range(command):
                chunk.append(value + 1)

            chunk_ptr += 2

        print('chunk count', chunk_count)

    print('Chunk done')

    print('Partsing Attrs')
    attr_chunk_count = 0
    attr_chunk_ptr = rw(0x6655 + i)
    while (attr_chunk_count < 44):

        command = rb(attr_chunk_ptr)
        
        if command & 0x80:
            block_count = command & 0x7F

            print("RAW " + hex(block_count))

            for j in range(block_count):
                attr_chunk_ptr += 1

                value = rb(attr_chunk_ptr)
                print("Value", bin(value))
                if value & 0b100:
                    chunk[attr_chunk_count] = chunk[attr_chunk_count] | (1 << 30)
                if value & 0b10:
                    chunk[attr_chunk_count] = chunk[attr_chunk_count] | (1 << 31)
            
                attr_chunk_count += 1

            attr_chunk_ptr += 1

        else:
            print("RUN " + hex(command))

            value = rb(attr_chunk_ptr + 1)
            print("Value", hex(value))
            for j in range(command):
                if value & 0b100:
                    chunk[attr_chunk_count] = chunk[attr_chunk_count] | (1 << 30)
                if value & 0b10:
                    chunk[attr_chunk_count] = chunk[attr_chunk_count] | (1 << 31)
                
                attr_chunk_count += 1

            attr_chunk_ptr += 2

        print('attr_chunk count', attr_chunk_count)

    chunked_chunk = chunk_list(chunk, 22)

    mapblocks.append(chunked_chunk[0] + chunked_chunk[1])

    metatiles = metatiles + chunked_chunk[0] + chunked_chunk[1]

    print()
    print()

# Build terrain
terrain = []
bindexes = []
bindexes_ptr = 0x40C9
while (True):

    command = rb(bindexes_ptr)
    
    if command & 0x80:
        block_count = command & 0x7F

        print("RAW " + hex(block_count))

        for j in range(block_count):
            bindexes_ptr += 1
            value = rb(bindexes_ptr)
            bindexes.append(value)

            print(hex(bindexes_ptr), hex(value))

            if value != 0xFF:
                terrain = mapblocks[value] + terrain
        
        if value == 0xFF: break
        
        bindexes_ptr += 1

    else:
        print("RUN " + hex(command))

        value = rb(bindexes_ptr + 1)
        for j in range(command):
            bindexes.append(value)

            if value == 0xFF: break

            terrain = mapblocks[value] + terrain

        bindexes_ptr += 2

print('Bindexes', len(bindexes))
bindexes.pop()
bindexes.reverse()
bindexes = list(map(lambda x: x+1, bindexes))

with open('bindexes_raw.json', 'w') as f2:
    json.dump(bindexes, f2)


print('Terrain', len(terrain), len(terrain) / 22)
with open('r.json', 'w') as f2:
    json.dump(terrain, f2)

print('Metatiles', len(metatiles), len(metatiles) / 22)
with open('metatiles_raw.json', 'w') as f2:
    json.dump(metatiles, f2)
