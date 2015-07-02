#!/bin/bash
echo "Compiling kernel"
rustc -C prefer-dynamic --crate-type=bin -L ./../state/target/debug/ -L ./../state/target/debug/deps/ -L ./../process/ kernel.rs
