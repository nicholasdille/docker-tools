FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=docker/compose
ARG DOCKER_COMPOSE_VERSION=1.29.2
RUN curl --silent --location --output /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 \
 && chmod +x /usr/local/bin/docker-compose

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM ubuntu:22.04@sha256:9e2424d0755c1261102df7b2603f5f88146b5be2ee20fed99003ff2181971e12 AS test
COPY --from=helper /usr/local/bin/* /usr/local/bin/
RUN ["docker-compose", "--version"]

FROM base