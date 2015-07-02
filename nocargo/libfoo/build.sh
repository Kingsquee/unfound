#!/bin/bash
echo "Compiling libfoo"
rustc -C prefer-dynamic --crate-type=dylib foo.rs
