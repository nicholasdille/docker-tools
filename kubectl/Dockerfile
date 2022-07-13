#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=kubernetes/kubernetes
ARG KUBECTL_VERSION=1.24.3
RUN curl --location --output /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["kubectl", "version", "--client"]

FROM base