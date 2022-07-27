#!/bin/bash

if [ "$1" = build ]; then
    echo "building site from /mkdocs_project" > /dev/stderr
elif [ "$1" = serve ]; then
    echo "serving site "  > /dev/stderr
else
    echo "Usage: $0 [build|serve]"  > /dev/stderr
fi
