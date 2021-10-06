FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS helm
# renovate: datasource=github-releases depName=helm/helm
ARG HELM_VERSION=3.7.0
RUN curl --location "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | \
        tar -xzC /usr/local/bin/ --strip-components=1 linux-amd64/helm \
 && helm version --client

FROM scratch
COPY --from=helm /usr/local/bin/helm /usr/local/bin/