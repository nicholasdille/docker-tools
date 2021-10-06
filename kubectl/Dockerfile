FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS kubectl
# renovate: datasource=github-releases depName=kubernetes/kubernetes
ARG KUBECTL_VERSION=1.22.2
RUN curl --location --output /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && kubectl version --client

FROM scratch
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/