# gawk 5.0.0 Docker image
This image based on Alpine Linux 3.6 image.

## examples
```sh
docker run --rm atarumix/gawk5-alpine # == gawk --help
du -m /usr|docker run --rm -i atarumix/gawk5-alpine 'BEGIN{FS="/"}NF<4{print}' # run one-liner with host OS's stdin.
docker run --rm -v $(pwd):/src atarumix/gawk5-alpine -f [SOME_AWK_SCRIPT] # current directory in the container is set to "/src".
```

Using [frolvlad/alpine-gcc](https://hub.docker.com/r/frolvlad/alpine-gcc) for multistage build.
