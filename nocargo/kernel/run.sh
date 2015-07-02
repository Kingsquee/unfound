#!/bin/bash
echo "Running kernel"
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./../process/:./../libfoo/:./../state/ ./kernel