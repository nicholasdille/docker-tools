FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=golang/go
ARG GO_VERSION=1.17.1
RUN curl --silent https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | \
        tar -C /opt -xz

FROM scratch AS base
COPY --from=helper /opt/go /opt/go

FROM ubuntu:21.04@sha256:ba394fabd516b39ccf8597ec656a9ddd7d0a2688ed8cb373ca7ac9b6fe67848f AS test
COPY --from=helper /opt/go /opt/go
RUN ["/opt/go/bin/go", "version"]

FROM base