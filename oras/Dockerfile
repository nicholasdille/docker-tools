FROM nicholasdille/tools:helpers AS oras
# renovate: datasource=github-releases depName=deislabs/oras
ARG ORAS_VERSION=0.12.0
RUN curl --location --fail https://github.com/deislabs/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin oras \
 && oras version

FROM scratch
COPY --from=oras /usr/local/bin/oras /usr/local/bin/oras