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

FROM ubuntu:21.04@sha256:ba394fabd516b39ccf8597ec656a9ddd7d0a2688ed8cb373ca7ac9b6fe67848f AS test
COPY --from=helper /opt/node /opt/node
RUN ["/opt/node/bin/node", "--version"]

FROM base