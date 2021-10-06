FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS ksort
# renovate: datasource=github-releases depName=superbrothers/ksort
ARG KSORT_VERSION=0.4.2
WORKDIR /tmp
RUN curl --location --remote-name https://github.com/superbrothers/ksort/releases/download/v${KSORT_VERSION}/ksort-linux-amd64.zip \
 && unzip -d /usr/local/bin/ ksort-linux-amd64.zip ksort \
 && rm ksort-linux-amd64.zip \
 && ksort --version

FROM scratch
COPY --from=ksort /usr/local/bin/ksort /usr/local/bin/