docker build -t gary/mkdocs .
docker run --rm -i -v $PWD/test-project:/mkdocs_project  gary/mkdocs build > site.tar.gz
docker run --rm -p 8000:8000 -i -v $PWD/site.tar.gz:/mkdocs_tarball/site.tar.gz gary/mkdocs serve
#rm site.tar.gz
