#!/bin/bash -e

docker build -t gary/mkdocs .
docker run --name mkdocs-produce --rm -v $PWD/test-project:/mkdocs_project  gary/mkdocs produce > site.tar.gz
docker run --name mkdocs-serve --rm -i -p 8000:8000 gary/mkdocs serve < site.tar.gz &
sleep 3
curl --fail http://localhost:8000
sleep 3
echo "==================================="
echo "Press Enter to kill the web server"
read
docker kill mkdocs-serve
rm site.tar.gz
