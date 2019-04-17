FROM frolvlad/alpine-gcc
MAINTAINER atarumix
WORKDIR /tmp
RUN apk add --no-cache make && wget http://ftp.gnu.org/gnu/gawk/gawk-5.0.0.tar.gz && tar xzvf gawk-5.0.0.tar.gz && rm gawk-5.0.0.tar.gz
WORKDIR /tmp/gawk-5.0.0
RUN ./configure && make && strip gawk

FROM alpine:3.9
MAINTAINER atarumix
COPY --from=0 /tmp/gawk-5.0.0/gawk /usr/local/bin/gawk5
ENTRYPOINT ["/usr/local/bin/gawk5"]
CMD ["--help"]
