#!/bin/bash
echo "Compiling kernel"
rustc -C prefer-dynamic --crate-type=bin -L ./../state/ -L ./../libfoo/ -L ./../process/ kernel.rs
