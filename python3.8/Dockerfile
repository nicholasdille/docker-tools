# syntax=docker/dockerfile:1.3-labs

FROM ubuntu:22.04@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d as helper
ENV DEBIAN_FRONTEND=noninteractive
RUN <<EOF
ln -snf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
apt-get update
apt-get -y install --no-install-recommends \
       build-essential \
       libreadline-dev \
       libncursesw5-dev \
       libssl-dev \
       libsqlite3-dev \
       tk-dev \
       libgdbm-dev \
       libc6-dev \
       libbz2-dev \
       curl \
       ca-certificates
EOF
# renovate: datasource=github-tags depName=python/cpython versioning=regex:^v(?<major>3?)\.(?<minor>8?)\.(?<patch>\d+?)$
ARG PYTHON38_VERSION=3.8.10
WORKDIR /tmp
RUN <<EOF
curl --silent --location "https://www.python.org/ftp/python/${PYTHON38_VERSION}/Python-${PYTHON38_VERSION}.tgz" | \
       tar -xz
cd Python-${PYTHON38_VERSION}
./configure --prefix=/opt/python3.8
make -j 2
make -j 2 test
make install
/opt/python3.8/bin/pip3 install --upgrade pip
/opt/python3.8/bin/pip3 install --upgrade pipenv
EOF

FROM scratch AS base
COPY --link --from=helper /opt/python3.8 /opt/python3.8

FROM ubuntu:22.04@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d AS test
COPY --link --from=helper /opt/python3.8 /opt/python3.8
RUN ["/opt/python3.8/bin/python3", "--version"]
RUN ["/opt/python3.8/bin/pip3", "--version"]

FROM base
