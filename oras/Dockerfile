FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS oras
# renovate: datasource=github-releases depName=deislabs/oras
ARG ORAS_VERSION=0.12.0
RUN curl --location --fail https://github.com/deislabs/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin oras \
 && oras version

FROM scratch
COPY --from=oras /usr/local/bin/oras /usr/local/bin/oras