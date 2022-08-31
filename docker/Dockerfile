#syntax=docker/dockerfile:1.4.3

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=docker/cli
ARG DOCKER_VERSION=20.10.8
RUN curl --location https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | \
        tar -xzC /usr/local/bin --strip-components=1

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["docker", "--version"]

FROM base