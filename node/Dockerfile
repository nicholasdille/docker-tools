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

FROM ubuntu:21.04@sha256:26cd4ff32a9c031eaca3d6f589a7799f28b34a539e1bd81acbf1a6efeec4b1ce AS test
COPY --from=helper /opt/node /opt/node
RUN ["/opt/node/bin/node", "--version"]

FROM base