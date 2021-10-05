FROM helpers AS ksort
# renovate: datasource=github-releases depName=superbrothers/ksort
ARG KSORT_VERSION=0.4.2
WORKDIR /tmp
RUN curl --location --remote-name https://github.com/superbrothers/ksort/releases/download/v${KSORT_VERSION}/ksort-linux-amd64.zip \
 && unzip -d /usr/local/bin/ ksort-linux-amd64.zip ksort \
 && rm ksort-linux-amd64.zip \
 && ksort --version

FROM scratch
COPY --from=ksort /usr/local/bin/ksort /usr/local/bin/