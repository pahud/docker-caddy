FROM abiosoft/caddy:php

ENV ROOT_DIR /srv

RUN rm -rf $ROOT_DIR/*
ADD src $ROOT_DIR

RUN apk add --no-cache bash

ADD startup.sh /startup.sh
RUN chmod a+x /startup.sh

WORKDIR /srv

EXPOSE 2015

ENTRYPOINT []

CMD ["/startup.sh"]
