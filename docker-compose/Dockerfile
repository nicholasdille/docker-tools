#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=docker/compose
ARG DOCKER_COMPOSE_VERSION=v2.5.1
RUN curl --silent --location --output /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 \
 && chmod +x /usr/local/bin/docker-compose

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM ubuntu:22.04@sha256:20fa2d7bb4de7723f542be5923b06c4d704370f0390e4ae9e1c833c8785644c1 AS test
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/
RUN ["docker-compose", "--version"]

FROM base