FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-releases depName=kubermatic/kubeone
ARG KUBEONE_VERSION=v1.4.2
RUN curl -sLfO https://github.com/kubermatic/kubeone/releases/download/${KUBEONE_VERSION}/kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip \
 && unzip kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip \
 && mv kubeone /usr/local/bin/ \
 && rm kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["kubeone", "version"]

FROM base