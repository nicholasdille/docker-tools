FROM nicholasdille/tools:helpers AS sops
# renovate: datasource=github-releases depName=mozilla/sops
ARG SOPS_VERSION=3.7.1
RUN curl --silent --location --output /usr/local/bin/sops "https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux" \
 && chmod +x /usr/local/bin/sops

FROM scratch
COPY --from=sops /usr/local/bin/sops /usr/local/bin/