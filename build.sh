#!/bin/bash
echo "Compiling state" &&
cd ./state/ && cargo clean && cargo build &&
cd ./../ &&
cd ./process/ && ./build.sh &&
cd ./../ &&
cd ./kernel/ && ./build.sh && ./run.sh

if [ $? -eq 0 ]
then
    echo "And...it works. If you didn't change anything in the code, I'm confused and jealous."
else
    echo "That should have printed 66049..."
fi