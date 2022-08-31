#syntax=docker/dockerfile:1.4.3

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=zegl/kube-score
ARG KUBE_SCORE_VERSION=1.14.0
RUN curl --location https://github.com/zegl/kube-score/releases/download/v${KUBE_SCORE_VERSION}/kube-score_${KUBE_SCORE_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin/

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["kube-score", "version"]

FROM base