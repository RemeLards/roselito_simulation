#!/bin/bash

# Build the workspace.
#
# Author: Helio Perroni Filho

colcon \
  --log-base     "make/log"     \
  build \
  --build-base   "make/build"   \
  --install-base "make/install" \
  "${@:1}"
