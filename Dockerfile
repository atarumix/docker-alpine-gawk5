FROM frolvlad/alpine-gcc
MAINTAINER atarumix
WORKDIR /tmp
RUN apk add --no-cache make && wget http://ftp.gnu.org/gnu/gawk/gawk-5.0.0.tar.xz && tar xJvf gawk-5.0.0.tar.xz && rm gawk-5.0.0.tar.xz
WORKDIR /tmp/gawk-5.0.0
RUN ./configure && make && strip gawk

FROM alpine:3.6
MAINTAINER atarumix
COPY --from=0 /tmp/gawk-5.0.0/gawk /usr/local/bin/gawk5
RUN mkdir /src
WORKDIR /src
ENTRYPOINT ["/usr/local/bin/gawk5"]
CMD ["--help"]
