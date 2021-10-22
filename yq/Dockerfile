FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VERSION=3.4.1
RUN curl --location --output /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 \
 && chmod +x /usr/local/bin/yq

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["yq", "--version"]

FROM base