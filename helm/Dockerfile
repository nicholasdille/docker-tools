#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=helm/helm
ARG HELM_VERSION=3.8.2
RUN curl --location "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | \
        tar -xzC /usr/local/bin/ --strip-components=1 linux-amd64/helm \
 && helm version --client

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["helm", "version"]

FROM base