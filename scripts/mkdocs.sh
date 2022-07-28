#!/bin/bash -e

if [ "$1" = build ]; then
    if ! [ -r /mkdocs_project/mkdocs.yml ] ; then
        echo "No mkdocs.yml found in /mkdocs_project. Please mount a MkDocs project in that diretory." > /dev/stderr
        exit 1
    fi
    echo "building from /mkdocs_project ..." > /dev/stderr
    cd /mkdocs_project
    mkdocs build > /dev/stderr
    cd site
    tar -cz .

elif [ "$1" = serve ]; then
    echo "serving site "  > /dev/stderr
else
    echo "Usage: $0 [ build | serve ]"  > /dev/stderr
    bash
fi
