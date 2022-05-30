#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
ARG NVM_VERSION=0.39.1
ENV NVM_DIR=/opt/nvm
RUN mkdir -p ${NVM_DIR} \
 && curl https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash \
 && . ${NVM_DIR}/nvm.sh \
 && nvm install --lts \
 && NODE_VERSION=$(nvm current) \
 && cp -r /opt/nvm/versions/node/${NODE_VERSION}/* /opt/node \
 && nvm deactivate \
 && nvm uninstall --lts

FROM scratch AS base
COPY --link --from=helper /opt/node /opt/node

FROM ubuntu:22.04@sha256:26c68657ccce2cb0a31b330cb0be2b5e108d467f641c62e13ab40cbec258c68d AS test
COPY --link --from=helper /opt/node /opt/node
RUN ["/opt/node/bin/node", "--version"]

FROM base