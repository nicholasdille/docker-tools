FROM nicholasdille/tools:helpers AS kustomize
# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
ARG KUSTOMIZE_VERSION=3.10.0
RUN curl --location https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin kustomize \
 && kustomize version

FROM scratch
COPY --from=kustomize /usr/local/bin/kustomize /usr/local/bin/