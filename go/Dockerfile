#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=golang/go
ARG GO_VERSION=1.17.10
RUN curl --silent https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | \
        tar -C /opt -xz

FROM scratch AS base
COPY --link --from=helper /opt/go /opt/go

FROM ubuntu:22.04@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d AS test
COPY --link --from=helper /opt/go /opt/go
RUN ["/opt/go/bin/go", "version"]

FROM base