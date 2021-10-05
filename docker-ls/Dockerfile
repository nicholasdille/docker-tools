FROM helpers AS docker-ls
# renovate: datasource=github-releases depName=mayflower/docker-ls
ARG DOCKER_LS_VERSION=0.5.1
RUN curl --location --remote-name https://github.com/mayflower/docker-ls/releases/download/v${DOCKER_LS_VERSION}/docker-ls-linux-amd64.zip \
 && unzip docker-ls-linux-amd64.zip \
 && mv docker-ls docker-rm /usr/local/bin/ \
 && docker-ls version

FROM scratch
COPY --from=docker-ls /usr/local/bin/docker-* /usr/local/bin/