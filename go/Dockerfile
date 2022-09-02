#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=golang/go
ARG GO_VERSION=1.18.2
RUN curl --silent https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | \
        tar -C /opt -xz

FROM scratch AS base
COPY --link --from=helper /opt/go /opt/go

FROM ubuntu:22.04@sha256:20fa2d7bb4de7723f542be5923b06c4d704370f0390e4ae9e1c833c8785644c1 AS test
COPY --link --from=helper /opt/go /opt/go
RUN ["/opt/go/bin/go", "version"]

FROM base