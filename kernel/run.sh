#!/bin/bash
echo "Running kernel"
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./../process/:./../state/target/debug/:./../state/target/debug/deps/ ./kernel