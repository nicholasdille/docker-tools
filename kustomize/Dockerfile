#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
ARG KUSTOMIZE_VERSION=4.5.4
RUN curl --location https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin kustomize

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["kustomize", "version"]

FROM base