#!/bin/bash
echo "Compiling process"
rustc -C prefer-dynamic --crate-type=dylib -L ./../state/ -L ./../libfoo/ process.rs
