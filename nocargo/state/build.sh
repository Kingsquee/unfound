#!/bin/bash
echo "Compiling state"
rustc -C prefer-dynamic --crate-type=dylib -L ./../libfoo/ state.rs
