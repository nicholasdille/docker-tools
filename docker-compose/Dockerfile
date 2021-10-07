FROM nicholasdille/tools:helpers AS docker-compose
# renovate: datasource=github-releases depName=docker/compose
ARG DOCKER_COMPOSE_VERSION=1.29.2
RUN curl --silent --location --output /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 \
 && chmod +x /usr/local/bin/docker-compose

FROM scratch
COPY --from=docker-compose /usr/local/bin/docker-compose /usr/local/bin/