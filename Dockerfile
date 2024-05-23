FROM alpine:3.20.0

RUN addgroup -g 65532 tasksyncer && \
    adduser -D -u 65532 -G tasksyncer tasksyncer

RUN apk add --no-cache bash task

ADD sync-script.sh /usr/local/bin/sync-script.sh

USER tasksyncer
RUN mkdir /home/tasksyncer/.task

CMD ["/usr/local/bin/sync-script.sh"]
