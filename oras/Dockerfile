FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=deislabs/oras
ARG ORAS_VERSION=0.12.0
RUN curl --location --fail https://github.com/deislabs/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin oras

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["oras", "version"]

FROM base