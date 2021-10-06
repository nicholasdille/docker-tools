FROM nicholasdille/tools:helpers AS docker
# renovate: datasource=github-releases depName=docker/cli
ARG DOCKER_VERSION=20.10.8
RUN curl --location https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | \
        tar -xzC /usr/local/bin --strip-components=1 \
 && docker --version

FROM scratch
COPY --from=docker /usr/local/bin/* /usr/local/bin/