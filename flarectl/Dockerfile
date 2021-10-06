FROM nicholasdille/tools:helpers AS flarectl
# renovate: datasource=github-releases depName=cloudflare/cloudflare-go
ARG FLARECTL_VERSION=0.24.0
RUN curl --location "https://github.com/cloudflare/cloudflare-go/releases/download/v${FLARECTL_VERSION}/flarectl_${FLARECTL_VERSION}_linux_amd64.tar.xz" | \
        tar -xJC /usr/local/bin/ flarectl \
 && flarectl --version

FROM scratch
COPY --from=helper /usr/local/bin/flarectl /usr/local/bin/