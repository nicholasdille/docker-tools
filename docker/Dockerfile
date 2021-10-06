FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS docker
# renovate: datasource=github-releases depName=docker/cli
ARG DOCKER_VERSION=20.10.8
RUN curl --location https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | \
        tar -xzC /usr/local/bin --strip-components=1 \
 && docker --version

FROM scratch
COPY --from=docker /usr/local/bin/* /usr/local/bin/