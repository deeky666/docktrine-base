FROM debian:jessie

MAINTAINER Steve Müller "deeky666@googlemail.com"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        libaio1 \
        libmysqlclient-dev \
        libpq-dev \
        libxml2-dev \
        && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*
