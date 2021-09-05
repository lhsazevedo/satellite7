# Satellite 7 Disassembly
[![CI](https://github.com/lhsazevedo/satellite7/actions/workflows/ci.yml/badge.svg)](https://github.com/lhsazevedo/satellite7/actions/workflows/ci.yml)

This project aims to understand and document the disasssembly of the game [Satellite 7](https://segaretro.org/Satellite_7) released in 1985 for the Sega Master System.

It builds the following roms:
- **Satellite 7 (Japan)**  
  SHA1: `88fc5596773ea31eda8ae5a8baf6f0ce5c3f7e5e`  
  CRC32: `16249e19`

## Requirements
To compile, both WLA DX assembler for z80 (wla-z80) and the WLA-LINK linker (wlalink) must be avaliable on your PATH.

## Compiling
Execute de compile script for your system:

**Linux:**
```
./compile.sh
```

The script will build and check if the result is identical to the origina one.

## Contact
Brazilian Telegram group: https://t.me/smsdasmbr

## Thanks
Thanks to everyone who researched the Master System hardware and this game, and made that work available for free. Without them I would have given up on the first day.

- [SMS Power!](https://www.smspower.org/) community
- [Emulicious](https://emulicious.net/) emulator by [Calindro](https://www.smspower.org/forums/member6944)
- [WLA DX](https://github.com/vhelin/wla-dx) assembler by [Ville Helin](https://github.com/vhelin)

## Disclaimer:
Any and all content presented in this repository is presented for informational and educational purposes only.
Commercial usage is expressly prohibited. The owner claims no ownership of any code in these repositories.
You assume any and all responsibility for using this content responsibly. The owner claims no responsibiliy or warranty.
You are not allowed to redistribute the patched ROM or bundle the patch with pirated copies of the game.
