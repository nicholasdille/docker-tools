#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=mayflower/docker-ls
ARG DOCKER_LS_VERSION=0.5.1
RUN curl --location --remote-name https://github.com/mayflower/docker-ls/releases/download/v${DOCKER_LS_VERSION}/docker-ls-linux-amd64.zip \
 && unzip docker-ls-linux-amd64.zip \
 && mv docker-ls docker-rm /usr/local/bin/

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["docker-ls", "version"]

FROM base