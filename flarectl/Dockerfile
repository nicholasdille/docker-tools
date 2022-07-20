#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=cloudflare/cloudflare-go
ARG FLARECTL_VERSION=0.45.0
RUN curl --location "https://github.com/cloudflare/cloudflare-go/releases/download/v${FLARECTL_VERSION}/flarectl_${FLARECTL_VERSION}_linux_amd64.tar.xz" | \
        tar -xJC /usr/local/bin/ flarectl

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["flarectl", "--version"]

FROM base