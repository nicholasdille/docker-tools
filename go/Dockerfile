FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=golang/go
ARG GO_VERSION=1.17.1
RUN curl --silent https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | \
        tar -C /opt -xz

FROM scratch AS base
COPY --from=helper /opt/go /opt/go

FROM ubuntu:21.04@sha256:26cd4ff32a9c031eaca3d6f589a7799f28b34a539e1bd81acbf1a6efeec4b1ce AS test
COPY --from=helper /opt/go /opt/go
RUN ["/opt/go/bin/go", "version"]

FROM base