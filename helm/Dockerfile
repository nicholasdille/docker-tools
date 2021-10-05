FROM helpers AS helm
# renovate: datasource=github-releases depName=helm/helm
ARG HELM_VERSION=3.7.0
RUN curl --location "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | \
        tar -xzC /usr/local/bin/ --strip-components=1 linux-amd64/helm \
 && helm version --client

FROM scratch
COPY --from=helm /usr/local/bin/helm /usr/local/bin/