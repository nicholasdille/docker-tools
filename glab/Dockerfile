FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS glab
# renovate: datasource=github-releases depName=profclems/glab
ARG GLAB_VERSION=1.20.0
RUN curl -sL https://github.com/profclems/glab/releases/download/v${GLAB_VERSION}/glab_${GLAB_VERSION}_Linux_x86_64.tar.gz | \
        tar -xzC /usr/local

FROM scratch
COPY --from=glab /usr/local/bin/glab /usr/local/bin/