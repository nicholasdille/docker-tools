FROM helpers AS kubectl
# renovate: datasource=github-releases depName=kubernetes/kubernetes
ARG KUBECTL_VERSION=1.22.2
RUN curl --location --output /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && kubectl version --client

FROM scratch
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/