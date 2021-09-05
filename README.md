# Satellite 7 Disassembly
[![CI](https://github.com/lhsazevedo/satellite7/actions/workflows/ci.yml/badge.svg)](https://github.com/lhsazevedo/satellite7/actions/workflows/ci.yml)

This is  a labelled and commented disassembly of the game [Satellite 7](https://segaretro.org/Satellite_7) released in 1985 for the Sega Master System.

It builds the following rom:
- **Satellite 7 (Japan)**  
  SHA1: `88fc5596773ea31eda8ae5a8baf6f0ce5c3f7e5e`  
  CRC32: `16249e19`

## Compiling
To compile the game you'll need:

- An UNIX-like system.
- [WLA-DX](https://github.com/vhelin/wla-dx) Z80 assembler (wla-z80) and linker (wlalink).

Just execute the `compile.sh` script, it will build and check if the result is identical to the original one:
```
$ ./compile.sh
Compiling
Linking
Ok!
```

## Contact
Telegram group: https://t.me/smsdasm

## Thanks
Thanks to everyone who researched the Master System hardware and made that work available for free. Without them I would have given up on the first day.

- [SMS Power!](https://www.smspower.org/) community
- [Emulicious](https://emulicious.net/) emulator by [Calindro](https://www.smspower.org/forums/member6944)
- [WLA DX](https://github.com/vhelin/wla-dx) assembler by [Ville Helin](https://github.com/vhelin)

## Disclaimer:
Any and all content presented in this repository is presented for informational and educational purposes only.
Commercial usage is expressly prohibited.
