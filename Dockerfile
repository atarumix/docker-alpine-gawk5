FROM alpine:3.8
MAINTAINER atarumix
WORKDIR /tmp
RUN apk add --no-cache gcc make musl-dev && wget http://ftp.gnu.org/gnu/gawk/gawk-5.0.0.tar.xz && tar xJvf gawk-5.0.0.tar.xz && rm gawk-5.0.0.tar.xz
WORKDIR /tmp/gawk-5.0.0
RUN if [ -f '/proc/cpuinfo' ]; then CPUNUM=`grep -c ^processor /proc/cpuinfo`;CPUNUM=`expr 1 + $CPUNUM` ;else CPUNUM=1; fi ;  ./configure && make -j$CPUNUM && strip gawk

FROM alpine:3.6
MAINTAINER atarumix
COPY --from=0 /tmp/gawk-5.0.0/gawk /usr/local/bin/gawk5
RUN mkdir /src
WORKDIR /src
ENTRYPOINT ["/usr/local/bin/gawk5"]
CMD ["--help"]
