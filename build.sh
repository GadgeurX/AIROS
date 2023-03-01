if [ $1 == "clean" ]; then
    rm -rf ./build/*
else
    mkdir build
    cd build
    if [ $1 == "z80" ]; then
        cmake -DCMAKE_SYSTEM_NAME=Generic -DCMAKE_C_COMPILER=sdcc -DTARGET_ARCH="$1" ..
    elif [ $1 == "intel" ]; then
        cmake -DTARGET_ARCH="$1" ..
    else
        echo "Unknow target arch";
        exit 1;
    fi
    make
fi