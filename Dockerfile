# renovate: datasource=github-tags depName=docker/cli
ARG DOCKER_VERSION=20.10.6
FROM docker:${DOCKER_VERSION} AS base
# renovate: datasource=pypi depName=awscli
ARG AWSCLI_VERSION=1.19.52
# renovate: datasource=pypi depName=yamllint
ARG YAMLLINT_VERSION=1.26.1
RUN apk add --update-cache --no-cache \
        git \
        curl \
        ca-certificates \
        openssl \
        jq \
        gettext \
        apache2-utils \
        bash \
        py3-pip \
        bind-tools \
        coreutils \
        util-linux \
 && pip3 install --no-cache-dir \
        awscli==${AWSCLI_VERSION} \
        yamllint==${YAMLLINT_VERSION}

FROM base AS flarectl
# renovate: datasource=github-releases depName=cloudflare/cloudflare-go
ARG FLARECTL_VERSION=0.13.8
RUN curl --location "https://github.com/cloudflare/cloudflare-go/releases/download/v${FLARECTL_VERSION}/flarectl_${FLARECTL_VERSION}_linux_amd64.tar.xz" | \
        tar -xJC /usr/local/bin/ flarectl \
 && flarectl --version

FROM golang:1.15-alpine@sha256:33558d8dd63396c6c5f43375a817c3595ffa4890b751138c1a236fa1f741c6d3 AS yaml-patch
RUN apk add --update-cache --no-cache \
        git \
 && go get -u github.com/krishicks/yaml-patch \
 && cd /go/src/github.com/krishicks/yaml-patch/cmd/yaml-patch \
 && go get . \
 && go build . \
 && mv yaml-patch /usr/local/bin/ \
 && yaml-patch --help

FROM base AS kubectl
# renovate: datasource=github-releases depName=kubernetes/kubernetes
ARG KUBECTL_VERSION=1.20.5
RUN curl --location --output /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && kubectl version --client

FROM base AS helm
# renovate: datasource=github-releases depName=helm/helm
ARG HELM_VERSION=3.5.4
RUN curl --location "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | \
        tar -xzC /usr/local/bin/ --strip-components=1 linux-amd64/helm \
 && helm version --client

FROM base AS trivy
# renovate: datasource=github-releases depName=aquasecurity/trivy
ARG TRIVY_VERSION=0.16.0
RUN curl --location --fail https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz | \
        tar -xzC /usr/local/bin/ trivy \
 && trivy --version

FROM base AS oras
# renovate: datasource=github-releases depName=deislabs/oras
ARG ORAS_VERSION=0.11.1
RUN curl --location --fail https://github.com/deislabs/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin oras \
 && oras version

FROM base AS kustomize
# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize
ARG KUSTOMIZE_VERSION=3.10.0
RUN curl --location https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin kustomize \
 && kustomize version

FROM base AS yq
# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VERSION=3.4.1
RUN curl --location --output /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 \
 && chmod +x /usr/local/bin/yq \
 && yq --version

FROM base AS jfrog
# renovate: datasource=github-releases depName=jfrog/jfrog-cli
ARG JFROG_VERSION=1.45.2
RUN curl --location --output /usr/local/bin/jfrog "https://releases.jfrog.io/artifactory/jfrog-cli/v1/${JFROG_VERSION}/jfrog-cli-linux-amd64/jfrog" \
 && chmod +x /usr/local/bin/jfrog \
 && jfrog --version

FROM base AS docker-ls
# renovate: datasource=github-releases depName=mayflower/docker-ls
ARG DOCKER_LS_VERSION=0.5.1
RUN curl --location --remote-name https://github.com/mayflower/docker-ls/releases/download/v${DOCKER_LS_VERSION}/docker-ls-linux-amd64.zip \
 && unzip docker-ls-linux-amd64.zip \
 && mv docker-ls docker-rm /usr/local/bin/ \
 && docker-ls version

FROM base AS ksort
# renovate: datasource=github-releases depName=superbrothers/ksort
ARG KSORT_VERSION=0.4.1
WORKDIR /tmp
RUN curl --location --remote-name https://github.com/superbrothers/ksort/releases/download/v${KSORT_VERSION}/ksort-linux-amd64.zip \
 && unzip -d /usr/local/bin/ ksort-linux-amd64.zip ksort \
 && rm ksort-linux-amd64.zip \
 && ksort --version

FROM base AS kube-score
# renovate: datasource=github-releases depName=zegl/kube-score
ARG KUBE_SCORE_VERSION=1.10.1
RUN curl --location https://github.com/zegl/kube-score/releases/download/v${KUBE_SCORE_VERSION}/kube-score_${KUBE_SCORE_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin/ \
 && kube-score version

FROM base AS semver
# renovate: datasource=github-tags depName=fsaintjacques/semver-tool
ARG SEMVER_VERSION=3.2.0
RUN curl --location --output /usr/local/bin/semver https://github.com/fsaintjacques/semver-tool/raw/${SEMVER_VERSION}/src/semver \
 && chmod +x /usr/local/bin/semver \
 && semver --version

FROM base AS terraform
# renovate: datasource=github-tags depName=hashicorp/terraform
ARG TERRAFORM_VERSION=v0.14.10
RUN curl -sLfO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION#v}/terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip -d /usr/local/bin/ \
 && rm terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip

FROM base AS kubeone
# renovate: datasource=github-releases depName=kubermatic/kubeone
ARG KUBEONE_VERSION=v1.2.1
RUN curl -sLfO https://github.com/kubermatic/kubeone/releases/download/${KUBEONE_VERSION}/kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip \
 && unzip kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip \
 && mv kubeone /usr/local/bin/ \
 && rm kubeone_${KUBEONE_VERSION#v}_linux_amd64.zip

FROM base AS glab
# renovate: datasource=github-releases depName=profclems/glab
ARG GLAB_VERSION=1.16.0
RUN curl -sL https://github.com/profclems/glab/releases/download/v${GLAB_VERSION}/glab_${GLAB_VERSION}_Linux_x86_64.tar.gz | \
        tar -xzC /usr/local

FROM base AS final
COPY --from=flarectl /usr/local/bin/flarectl /usr/local/bin/
COPY --from=yaml-patch /usr/local/bin/yaml-patch /usr/local/bin/
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/
COPY --from=helm /usr/local/bin/helm /usr/local/bin/
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/
COPY --from=oras /usr/local/bin/oras /usr/local/bin/
COPY --from=kustomize /usr/local/bin/kustomize /usr/local/bin/
COPY --from=yq /usr/local/bin/yq /usr/local/bin/
COPY --from=jfrog /usr/local/bin/jfrog /usr/local/bin/
COPY --from=docker-ls /usr/local/bin/docker-* /usr/local/bin/
COPY --from=ksort /usr/local/bin/ksort /usr/local/bin/
COPY --from=kube-score /usr/local/bin/kube-score /usr/local/bin/
COPY --from=semver /usr/local/bin/semver /usr/local/bin/
COPY --from=terraform /usr/local/bin/terraform /usr/local/bin/
COPY --from=kubeone /usr/local/bin/kubeone /usr/local/bin/
