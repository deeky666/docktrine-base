FROM ubuntu:16.04

MAINTAINER Steve Müller "deeky666@googlemail.com"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends wget && \
    wget -O - http://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    echo "deb [arch=amd64] http://packages.microsoft.com/ubuntu/16.04/prod xenial main" > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update -y && \
    # Microsoft SQL Server client libraries
    ACCEPT_EULA=Y apt-get install -y --no-install-recommends msodbcsql && \
    apt-get install -y --no-install-recommends \
        # Microsoft SQL Server client libraries
        locales \
        unixodbc-dev-utf16\

        # MariaDB server libraries
        libwrap0-dev \
        libjemalloc-dev \

        # Workaround for: https://bugs.php.net/bug.php?id=48614
        libsqlite3-dev \

        libaio1 \
        libmysqlclient-dev \
        libpq-dev \
        libxml2-dev \
        && \
    locale-gen en_US.UTF-8 && \

    apt-get purge -y --auto-remove wget && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /etc/mysql

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
