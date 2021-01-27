FROM golang:1.15-alpine@sha256:07ec52ea1063aa6ca02034af5805aaae77d3d4144cced4e95f09d62a6d8ddf0a AS flarectl
# renovate: datasource=github-releases depName=cloudflare/cloudflare-go
ENV FLARECTL_VERSION=v0.13.8
RUN apk add --update-cache --no-cache \
        git \
 && go get -d github.com/cloudflare/cloudflare-go \
 && cd $GOPATH/src/github.com/cloudflare/cloudflare-go \
 && git checkout ${FLARECTL_VERSION} \
 && cd cmd/flarectl \
 && go build -v .  \
 && mv flarectl /

FROM golang:1.15-alpine@sha256:07ec52ea1063aa6ca02034af5805aaae77d3d4144cced4e95f09d62a6d8ddf0a AS yaml-patch
RUN apk add --update-cache --no-cache \
        git \
 && go get -u github.com/krishicks/yaml-patch \
 && cd /go/src/github.com/krishicks/yaml-patch/cmd/yaml-patch \
 && go get . \
 && go build . \
 && mv yaml-patch /

FROM docker:19.03.14@sha256:a1b2c824c6e736c5954a06dfb48978689746f56e7f46e801194aaa3ae31cf360 AS base
# renovate: datasource=pypi depName=awscli
ENV AWSCLI_VERSION=1.18.221
# renovate: datasource=pypi depName=yamllint
ENV YAMLLINT_VERSION=1.25.0
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
 && pip3 install --no-cache-dir \
        awscli==${AWSCLI_VERSION} \
        yamllint==${YAMLLINT_VERSION}

FROM base AS kubectl
RUN curl --silent https://storage.googleapis.com/kubernetes-release/release/stable.txt | \
        xargs -I{} curl -sLo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/{}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl

FROM base AS helm
# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION=v3.4.2
RUN curl --silent --location "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz" | \
        tar -xvzC /usr/local/bin/ --strip-components=1 linux-amd64/helm

FROM base AS trivy
# renovate: datasource=github-releases depName=aquasecurity/trivy
ENV TRIVY_VERSION=v0.12.0
RUN curl --silent --location --fail https://github.com/aquasecurity/trivy/releases/download/${TRIVY_VERSION}/trivy_${TRIVY_VERSION:1}_Linux-64bit.tar.gz | \
        tar -xvzC /usr/local/bin/ trivy

FROM base AS oras
# renovate: datasource=github-releases depName=deislabs/oras
ENV ORAS_VERSION=v0.8.1
RUN curl --silent --location --fail https://github.com/deislabs/oras/releases/download/${ORAS_VERSION}/oras_${ORAS_VERSION:1}_linux_amd64.tar.gz | \
        tar -xvzC /usr/local/bin oras

FROM base AS kustomize
# renovate: datasource=github-releases depName=kubernetes-sigs/kustomize versioning=regex:^kustomize\/v(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$
ENV KUSTOMIZE_VERSION=kustomize/v3.8.9
RUN bash -c 'curl --silent --location https://github.com/kubernetes-sigs/kustomize/releases/download/${KUSTOMIZE_VERSION/\//%2F}/kustomize_${KUSTOMIZE_VERSION#kustomize/}_linux_amd64.tar.gz | \
        tar -xvzC /usr/local/bin kustomize'

FROM base AS yq
# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION=3.4.1
RUN curl --silent --location --fail --output /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 \
 && chmod +x /usr/local/bin/yq

FROM base AS jfrog
RUN curl --silent --verbose https://bintray.com/jfrog/jfrog-cli-go/jfrog-cli-linux-amd64/_latestVersion 2>&1 | \
        grep -E '< Location: ' | \
        cut -d' ' -f3 | \
        cut -d'/' -f7 | \
        tr -d '\r' | \
        xargs -I{} curl --silent --location --fail --output /usr/local/bin/jfrog 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path={}%2Fjfrog-cli-linux-amd64%2Fjfrog' \
 && chmod +x /usr/local/bin/jfrog

FROM base AS docker-ls
# renovate: datasource=github-releases depName=mayflower/docker-ls
ENV DOCKER_LS_VERSION=v0.3.2
RUN curl --location --fail --remote-name https://github.com/mayflower/docker-ls/releases/download/${DOCKER_LS_VERSION}/docker-ls-linux-amd64.zip \
 && unzip docker-ls-linux-amd64.zip \
 && mv docker-ls docker-rm /usr/local/bin/

FROM base AS ksort
# renovate: datasource=github-releases depName=superbrothers/ksort
ENV KSORT_VERSION=v0.4.1
WORKDIR /tmp
RUN curl --location --fail --remote-name https://github.com/superbrothers/ksort/releases/download/${KSORT_VERSION}/ksort-linux-amd64.zip \
 && unzip -d /usr/local/bin/ ksort-linux-amd64.zip ksort \
 && rm ksort-linux-amd64.zip

FROM base AS kube-score
# renovate: datasource=github-releases depName=zegl/kube-score
ENV KUBE_SCORE_VERSION=v1.10.1
RUN curl --location --fail https://github.com/zegl/kube-score/releases/download/${KUBE_SCORE_VERSION}/kube-score_${KUBE_SCORE_VERSION:1}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin/

FROM base AS final
COPY --from=flarectl /flarectl /usr/local/bin/
COPY --from=yaml-patch /yaml-patch /usr/local/bin/
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
