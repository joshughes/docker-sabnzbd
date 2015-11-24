FROM alpine:3.2
MAINTAINER Joe Hughes

COPY scripts/ /scripts/
ADD src/SABnzbd-0.7.20-src.tar.gz /src/

RUN apk update &&\
    apk add\
      openssl\
      python\
      g++\
      autoconf\
      automake\
      unzip\
      unrar\
      make\
      g++\
      python-dev\
      musl-dev\
      libffi-dev\
      openssl-dev\
      git &&\
    /scripts/install_depend.sh &&\
    apk del\
      autoconf\
      automake\
      make\
      g++\
      python-dev\
      musl-dev\
      libffi-dev\
      openssl-dev\
      git

EXPOSE 8080 9090

ENTRYPOINT ["/scripts/start.sh"]
