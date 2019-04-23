# gawk 5.0.0 Docker image
This image based on Alpine Linux 3.6 image.

## examples
```sh
docker run --rm atarumix/gawk5-alpine # == gawk --help
du -m /usr|docker run --rm -i atarumix/gawk5-alpine 'BEGIN{FS="/"}NF<4{print}' # run one-liner with host OS's stdin.
docker run --rm -v $(pwd):/src atarumix/gawk5-alpine -f [SOME_AWK_SCRIPT] # current directory in the container is set to "/src".
docker run --rm gawk5 '@load "time"; BEGIN{t1=gettimeofday();sleep(0.5);t2=gettimeofday();print t2-t1}' # import extension and call it.
```

## changes
*4/23/2019
add extension library to /usr/local/lib/gawk.
(filefuncs.so, fnmatch.so, fork.so, inplace.so intdiv.so, ordchr.so, readdir.so, readfile,so, revoutput.so, revtwoway.so, rwarray.so, time.so)

