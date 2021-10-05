FROM helpers AS trivy
# renovate: datasource=github-releases depName=aquasecurity/trivy
ARG TRIVY_VERSION=0.19.2
RUN curl --location --fail https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz | \
        tar -xzC /usr/local/bin/ trivy \
 && trivy --version

FROM scratch
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy