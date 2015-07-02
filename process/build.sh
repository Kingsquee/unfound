#!/bin/bash
echo "Compiling process"
rustc -C prefer-dynamic --crate-type=dylib -L ./../state/target/debug/deps/ -L ./../state/target/debug/ process.rs
