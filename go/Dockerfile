FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=golang/go
ARG GO_VERSION=1.17.1
RUN curl --silent https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | \
        tar -C /opt -xz

FROM scratch AS base
COPY --from=helper /opt/go /opt/go

FROM ubuntu:22.04@sha256:2a7dffab37165e8b4f206f61cfd984f8bb279843b070217f6ad310c9c31c9c7c AS test
COPY --from=helper /opt/go /opt/go
RUN ["/opt/go/bin/go", "version"]

FROM base