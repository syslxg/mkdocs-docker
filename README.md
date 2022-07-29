 ## To Build the Dockerfile

```
docker build -t gary/mkdocs .
```

## To Produce the website tar.gz file

Note: Don't use `-t` or `--tty` flag on `docker run`. It will mix the STDOUT and STDERR.

``` 
docker run --name mkdocs-produce --rm -v "$PWD/test-project:/mkdocs_project"  gary/mkdocs produce > site.tar.gz
```

## To Serve the website

Note: Don't use `-t` or `--tty` flag on `docker run`. Otherwise, tar will have issue reading from STDIN.

```
docker run --name mkdocs-serve --rm -i -p 8000:8000 gary/mkdocs serve < site.tar.gz &
```

run `docker kill mkdoc-serve` to kill it.

## Versions
This repo is built and tested on the following environents and versions

- MacOS 12.5
- Docker Desktop for  Mac 4.9.1
- Jenkins for Mac  2.346.2
