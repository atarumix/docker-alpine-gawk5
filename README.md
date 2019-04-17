# gawk 5.0.0 Docker image
This image based on Alpine Linux 3.9 image.

```sh
docker run --rm atarumix/gawk5-alpine # == gawk --help
du -m /usr|docker run --rm -i atarumix/gawk5-alpine 'BEGIN{FS="/"}NF<4{print}' # run one-liner with host OS's stdin.
```

Using [frolvlad/alpine-gcc](https://hub.docker.com/r/frolvlad/alpine-gcc) for multistage build.
