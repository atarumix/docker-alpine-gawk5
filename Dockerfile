FROM alpine:3.8
MAINTAINER atarumix
WORKDIR /tmp
RUN apk add --no-cache gcc make musl-dev && wget http://ftp.gnu.org/gnu/gawk/gawk-5.0.1.tar.xz && tar xJvf gawk-5.0.1.tar.xz && rm gawk-5.0.1.tar.xz
WORKDIR /tmp/gawk-5.0.1
RUN if [ -f '/proc/cpuinfo' ]; then CPUNUM=`grep -c ^processor /proc/cpuinfo`;CPUNUM=`expr 1 + $CPUNUM` ;else CPUNUM=1; fi ;  ./configure && make -j$CPUNUM && strip gawk

FROM alpine:3.6
MAINTAINER atarumix
RUN mkdir /src && mkdir /usr/local/lib/gawk
COPY --from=0 /tmp/gawk-5.0.1/gawk /usr/local/bin/gawk5
COPY --from=0 /tmp/gawk-5.0.1/extension/.libs/*.so /usr/local/lib/gawk/
WORKDIR /src
ENTRYPOINT ["/usr/local/bin/gawk5"]
CMD ["--help"]
