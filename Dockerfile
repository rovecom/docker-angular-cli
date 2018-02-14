FROM node:9.5.0-alpine

LABEL authors="Arjan Speiard <aspeiard@rovecom.nl>"

RUN apk update \
  && apk add --update alpine-sdk python \
  && yarn global add @angular/cli@1.6.8 \
  && ng set --global packageManager=yarn \
  && apk del alpine-sdk python \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clean --force \
  && yarn cache clean \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd