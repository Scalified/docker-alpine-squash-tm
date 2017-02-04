FROM scalified/alpine-cron:latest

MAINTAINER Vladyslav Baidak

ENV OPT_DIR=/opt

ENV SQUASH_TM_DIST_URL=http://www.squashtest.org/telechargements/send/13-version-stable/254-sqaushtm-1151-targz
ENV SQUASH_TM_DIR=$OPT_DIR/squash-tm
ENV SQUASH_TM_BACKUP_DIR=$OPT_DIR/backup/squash-tm
ENV SQUASH_TM_STDOUT_FILE=/var/log/squash-tm-stdout.log
ENV SQUASH_TM_STDERR_FILE=/var/log/squash-tm-stderr.log
ENV SQUASH_TM_CRON_BACKUP_SCRIPT_FILE=/etc/periodic/daily/squash-tm-backup

RUN apk add --update --no-cache \
	curl \
	openjdk7

COPY config/supervisor-squash-tm.ini $SUPERVISOR_CONF_DIR

RUN mkdir -p $OPT_DIR

RUN cd $OPT_DIR && curl -L $SQUASH_TM_DIST_URL | gunzip -c | tar x

WORKDIR $SQUASH_TM_DIR/bin

RUN chmod u+x startup.sh

RUN sed -i -e 's/HTTP_PORT=8080/HTTP_PORT=80/g' startup.sh

COPY scripts/backup.sh $SQUASH_TM_CRON_BACKUP_SCRIPT_FILE

RUN chmod u+x $SQUASH_TM_CRON_BACKUP_SCRIPT_FILE

VOLUME $SQUASH_TM_DIR/data

VOLUME $SQUASH_TM_BACKUP_DIR

EXPOSE 80

RUN touch $SQUASH_TM_STDOUT_FILE $SQUASH_TM_STDERR_FILE

ENTRYPOINT supervisord -c /etc/supervisord.conf && tail -f $SQUASH_TM_STDOUT_FILE $SQUASH_TM_STDERR_FILE

