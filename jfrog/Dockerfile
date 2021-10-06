FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS jfrog
# renovate: datasource=github-releases depName=jfrog/jfrog-cli
ARG JFROG_VERSION=2.3.0
RUN curl --location --output /usr/local/bin/jfrog "https://releases.jfrog.io/artifactory/jfrog-cli/v2/${JFROG_VERSION}/jfrog-cli-linux-amd64/jfrog" \
 && chmod +x /usr/local/bin/jfrog \
 && jfrog --version

FROM scratch
COPY --from=jfrog /usr/local/bin/jfrog /usr/local/bin/