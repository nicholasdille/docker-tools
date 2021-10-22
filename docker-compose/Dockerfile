FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=docker/compose
ARG DOCKER_COMPOSE_VERSION=1.29.2
RUN curl --silent --location --output /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 \
 && chmod +x /usr/local/bin/docker-compose

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["docker-compose", "version"]

FROM base