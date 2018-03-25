FROM alpine:latest
RUN apk add --no-cache \
	gcc                  \
	g++                  \
	make                 \
	git                  \
	cvs                  \
	zlib-dev

RUN cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat \
	&& cd libowfat                                         \
	&& make

RUN git clone git://erdgeist.org/opentracker
COPY ./Makefile.new opentracker/Makefile

RUN cd opentracker                                     \
		&& make                                            \
	&& mv /tmp/opentracker/opentracker /opt/opentracker/ \
	&& apk del gcc g++ make git cvs zlib-dev             \
	&& rm -rf /var/cache/apk/* /tmp/*

COPY ./opentracker.conf /opt/opentracker/opentracker.conf
COPY ./whitelist.txt	/opt/opentracker/whitelist.txt
EXPOSE 6969
ENTRYPOINT [ "/opt/opentracker/opentracker", "-f", "/opt/opentracker/opentracker.conf" ]
