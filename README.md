# gawk 5.1.1. Docker image
This image based on Alpine Linux latest image.

## examples
```sh
docker run --rm atarumix/gawk5-alpine # == gawk --help
docker run --rm -v $(pwd):/src atarumix/gawk5-alpine -f [SOME_AWK_SCRIPT] # current directory in the container is set to "/src".
docker run --rm gawk5 '@load "time"; BEGIN{t1=gettimeofday();sleep(0.5);t2=gettimeofday();print t2-t1}' # import extension and call it.
```

## changes
* 10/29/2021
Change source tarball from gawk-5.1.0.tar.gz to gawk-5.1.1.tar.gz and change base image from alpine:3.6 to alpine:latest.
* 4/15/2020
Change source tarball from gawk-5.0.1.tar.gz to gawk-5.1.0.tar.gz.
* 7/17/2019
Change source tarball from gawk-5.0.0.tar.gz to gawk-5.0.1.tar.gz.
* 4/23/2019
add extension library to /usr/local/lib/gawk.  
(filefuncs.so, fnmatch.so, fork.so, inplace.so intdiv.so, ordchr.so, readdir.so, readfile,so, revoutput.so, revtwoway.so, rwarray.so, time.so)

