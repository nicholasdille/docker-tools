FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS yq
# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VERSION=3.4.1
RUN curl --location --output /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 \
 && chmod +x /usr/local/bin/yq \
 && yq --version

FROM scratch
COPY --from=yq /usr/local/bin/yq /usr/local/bin/