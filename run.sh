if [ $1 == "clean" ]; then
    rm -rf ./build/*
else
    if [ $1 == "z80" ]; then
        tilem2 --rom ./build/z80/ti/AIROS.rom
    elif [ $1 == "intel" ]; then
        qemu-system-i386 \
            -cdrom build/intel/AIROS.iso \
            -m 128M \
            -boot d \
            -serial stdio
    else
        echo "Unknow target arch";
        exit 1;
    fi
fi


