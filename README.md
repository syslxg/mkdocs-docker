With `produce` option, this docker image reads a MkDocs project from `/mkdocs_project` directory, and output a tar.gz file on STDOUT. A bind mount should be passed to `docker run` on that directory. 

With `serve` option, this docker image reads a tar.gz file from STDIN, and serve a website on http://localhost:8000. A tar.gz file should be redirected to the STDIN of `docker run` command. This `docker run` will be blocking. So, you may want to run it in backgroup with `&`. To kill it, use `docker kill <name>`

Run `./mkdockerize.sh` to try the full cycle, which includes build a docker image, run it with `produce` option, run it with `serve` option, access the website with `curl` and kill the container.

For more info, continue reading the rest of this doc.


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

## CI/CD

A `Jenkinsfile` is included at the root of this repo. 

## Versions
This repo is built and tested on the following environments and versions

- MacOS 12.5
- Docker Desktop for Mac 4.9.1
- Python 3.9
- MkDoc 1.3.0
- Jenkins for Mac 2.346.2
