#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=superbrothers/ksort
ARG KSORT_VERSION=0.4.3
WORKDIR /tmp
RUN curl --location --remote-name https://github.com/superbrothers/ksort/releases/download/v${KSORT_VERSION}/ksort-linux-amd64.zip \
 && unzip -d /usr/local/bin/ ksort-linux-amd64.zip ksort \
 && rm ksort-linux-amd64.zip

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["ksort", "--version"]

FROM base