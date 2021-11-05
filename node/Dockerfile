FROM nicholasdille/tools:helpers AS helper
ENV NVM_DIR=/opt/nvm
RUN mkdir -p ${NVM_DIR} \
 && curl --silent --location --fail https://api.github.com/repos/nvm-sh/nvm/releases/latest | \
        jq --raw-output '.tag_name' | \
        xargs -I{} curl https://raw.githubusercontent.com/nvm-sh/nvm/{}/install.sh | bash \
 && . ${NVM_DIR}/nvm.sh \
 && nvm install --lts \
 && NODE_VERSION=$(nvm current) \
 && cp -r /opt/nvm/versions/node/${NODE_VERSION}/* /opt/node \
 && nvm deactivate \
 && nvm uninstall --lts

FROM scratch AS base
COPY --from=helper /opt/node /opt/node

FROM ubuntu:22.04@sha256:9e2424d0755c1261102df7b2603f5f88146b5be2ee20fed99003ff2181971e12 AS test
COPY --from=helper /opt/node /opt/node
RUN ["/opt/node/bin/node", "--version"]

FROM base