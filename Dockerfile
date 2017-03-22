FROM mhart/alpine-node

RUN apk add -U git

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
