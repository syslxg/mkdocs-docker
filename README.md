 ## To Build the Dockerfile

```
docker build -t gary/mkdocs .
```

## To Product the website tar.gz file

Note: Don't use `-t` or `--tty` flag on `docker run`. It will mix the STDOUT and STDERR.

``` 
docker run --rm -i -v $PWD/test-project:/mkdocs_project  gary/mkdocs build
```
