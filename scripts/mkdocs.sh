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
    if ! [ -r /mkdocs_tarball/*.tar.gz ] ; then
        echo "No tarball found in /mkdocs_tarball. Please mount a tarball in that directory." > /dev/stderr
        exit 2
    fi
    echo "serving site on http://localhost:8000 "  > /dev/stderr
    cd /mkdocs_tarball
    mkdir -p docs
    tar xf *.tar.gz -C docs
    echo "site_name: My Docs" > mkdocs.yml
    mkdocs serve -a 0.0.0.0:8000

else
    echo "Usage: $0 [ build | serve ]"  > /dev/stderr
    # for interactive debug
    bash
fi
