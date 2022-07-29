 ## To Build the Dockerfile

```
docker build -t gary/mkdocs .
```

## To Produce the website tar.gz file

Note: Don't use `-t` or `--tty` flag on `docker run`. It will mix the STDOUT and STDERR.

``` 
docker run --rm -v "$PWD/test-project:/mkdocs_project"  gary/mkdocs produce > site.tar.gz
```

## To Serve the website

The blocking way:

```
docker run --rm -p 8000:8000 -it -v "$PWD/site.tar.gz:/mkdocs_tarball/site.tar.gz" gary/mkdocs serve
```
Press Ctrl-C to kill it.


The non-blocking way:

```
docker run --name mkdoc-serve --rm -p 8000:8000 -v "$PWD/site.tar.gz:/mkdocs_tarball/site.tar.gz" gary/mkdocs serve &
```

run `docker kill mkdoc-serve` to kill it.

## Versions
This repo is built and tested on the following environents and versions

- MacOS 12.5
- Docker Desktop for  Mac 4.9.1
- Jenkins for Mac  2.346.2