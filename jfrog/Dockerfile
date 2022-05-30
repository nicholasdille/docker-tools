#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=jfrog/jfrog-cli
ARG JFROG_VERSION=2.18.2
RUN curl --location --output /usr/local/bin/jfrog "https://releases.jfrog.io/artifactory/jfrog-cli/v2/${JFROG_VERSION}/jfrog-cli-linux-amd64/jfrog" \
 && chmod +x /usr/local/bin/jfrog \
 && jfrog --version

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["jfrog", "--version"]

FROM base