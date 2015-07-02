#!/bin/bash
# echo "Compiling state" &&
# cd ./state/ && cargo clean && cargo build &&

cd ./libfoo/ && ./build.sh &&
cd ./../ &&
cd ./state/ && ./build.sh &&
cd ./../ &&
cd ./process/ && ./build.sh &&
cd ./../ &&
cd ./kernel/ && ./build.sh && ./run.sh

if [ $? -eq 0 ]
then
    echo "And...it works. The only difference is we're not using cargo for libfoo and state."
else
    echo "What, it didn't work for you? I'm confused."
fi