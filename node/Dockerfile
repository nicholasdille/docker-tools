FROM nicholasdille/tools:helpers AS node
ENV NVM_DIR=/opt/nvm
RUN mkdir -p ${NVM_DIR} \
 && curl --silent --location --fail https://api.github.com/repos/nvm-sh/nvm/releases/latest | \
        jq --raw-output '.tag_name' | \
        xargs -I{} curl https://raw.githubusercontent.com/nvm-sh/nvm/{}/install.sh | bash \
 && . ${NVM_DIR}/nvm.sh \
 && nvm install --lts \
 && NODE_VERSION=$(nvm current) \
 && cp -r /opt/nvm/versions/node/${NODE_VERSION} /opt/node \
 && nvm deactivate \
 && nvm uninstall --lts

FROM scratch
COPY --from=node /opt/node /opt/node