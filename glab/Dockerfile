#syntax=docker/dockerfile:1.4.3

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=profclems/glab
ARG GLAB_VERSION=1.22.0
RUN curl -sL https://github.com/profclems/glab/releases/download/v${GLAB_VERSION}/glab_${GLAB_VERSION}_Linux_x86_64.tar.gz | \
        tar -xzC /usr/local

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["glab", "--version"]

FROM base