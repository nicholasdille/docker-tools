FROM nicholasdille/tools:helpers AS kubeone
# renovate: datasource=github-releases depName=kubermatic/kubeone
ARG KUBEONE_VERSION=v1.3.0
RUN curl -sLfO https://github.com/kubermatic/kubeone/releases/download/${KUBEONE_VERSION}/kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip \
 && unzip kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip \
 && mv kubeone /usr/local/bin/ \
 && rm kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip

FROM scratch
COPY --from=kubeone /usr/local/bin/kubeone /usr/local/bin/