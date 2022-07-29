docker build -t gary/mkdocs .
docker run --name mkdocs-build --rm -i -v $PWD/test-project:/mkdocs_project  gary/mkdocs build > site.tar.gz
docker run --name mkdocs-serve --rm -p 8000:8000 -v $PWD/site.tar.gz:/mkdocs_tarball/site.tar.gz gary/mkdocs serve &
sleep 3
curl http://localhost:8000
sleep 3
echo "==================================="
echo "Press Enter to kill the web server"
read
docker kill mkdocs-serve
rm site.tar.gz
