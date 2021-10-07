FROM nicholasdille/tools:helpers AS docker-machine
# renovate: datasource=github-releases depName=docker/machine
ARG DOCKER_MACHINE_VERSION=v0.16.2
RUN curl --silent --location --output /usr/local/bin/docker-machine https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION}/docker-machine-Linux-x86_64 \
 && chmod +x /usr/local/bin/docker-machine

FROM scratch
COPY --from=docker-machine /usr/local/bin/docker-machine /usr/local/bin/