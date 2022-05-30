#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=mozilla/sops
ARG SOPS_VERSION=3.7.2
RUN curl --silent --location --output /usr/local/bin/sops "https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux" \
 && chmod +x /usr/local/bin/sops

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["sops", "--version"]

FROM base