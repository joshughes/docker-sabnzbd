FROM alpine:3.5
MAINTAINER Joe Hughes

COPY scripts/ /scripts/
ENV SAB_VERSION=1.2.2
COPY src/SABnzbd-${SAB_VERSION}-src.tar.gz /src/
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init

RUN apk --no-cache add\
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
    chmod +x /usr/local/bin/dumb-init &&\
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
