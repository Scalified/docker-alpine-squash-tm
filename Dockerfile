FROM alpine:3.4

MAINTAINER Vladyslav Baidak

ENV SQUASH_TM_DIST_URL=http://www.squashtest.org/telechargements/send/13-version-stable/245-sqaushtm-1142-targz
ENV OPT_DIR=/opt
ENV SQUASH_TM_DIR=$OPT_DIR/squash-tm

RUN apk add --no-cache \
	curl \
	openjdk7

RUN mkdir -p $OPT_DIR

RUN cd $OPT_DIR && curl -L $SQUASH_TM_DIST_URL | gunzip -c | tar x

WORKDIR $SQUASH_TM_DIR/bin

RUN chmod u+x startup.sh

RUN sed -i -e 's/HTTP_PORT=8080/HTTP_PORT=80/g' startup.sh

EXPOSE 80

ENTRYPOINT ./startup.sh
