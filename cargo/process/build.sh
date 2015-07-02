#!/bin/bash
echo "Compiling process"
rustc -C prefer-dynamic --crate-type=dylib -L ./../state/target/debug/ -L ./../state/target/debug/deps/ process.rs
