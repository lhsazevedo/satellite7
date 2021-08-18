mkdir -p tmp build

rm -f tmp/* 

echo Compiling
wla-z80 -I src -o tmp/baserom.o src/baserom.asm

rm -f build/*

echo Linking
wlalink -d -S -b linkfile build/satellite-7-japan.sms


if sha1sum --status -c <<<"88FC5596773EA31EDA8AE5A8BAF6F0CE5C3F7E5E *build/satellite-7-japan.sms"; then
    echo "Ok!"
else
    echo "Diff :/"
fi
