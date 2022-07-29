#!/bin/bash -e

if [ "$1" = produce ]; then
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
    rm -rf /mkdocs_web || true
    mkdir -p /mkdocs_web/docs
    tar -xz -C /mkdocs_web/docs
    cd /mkdocs_web
    echo "site_name: Gary's Take-home" > mkdocs.yml
    mkdocs serve -a 0.0.0.0:8000

else
    echo "Usage: $0 [ build | serve ]"  > /dev/stderr
    # for interactive debug
    bash
fi
