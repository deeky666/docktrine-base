FROM debian:jessie

MAINTAINER Steve Müller "deeky666@googlemail.com"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        libxml2-dev \
        libmysqlclient-dev \
        libpq-dev \
        && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*
