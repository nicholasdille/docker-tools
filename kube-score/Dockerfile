FROM helpers AS kube-score
# renovate: datasource=github-releases depName=zegl/kube-score
ARG KUBE_SCORE_VERSION=1.12.0
RUN curl --location https://github.com/zegl/kube-score/releases/download/v${KUBE_SCORE_VERSION}/kube-score_${KUBE_SCORE_VERSION}_linux_amd64.tar.gz | \
        tar -xzC /usr/local/bin/ \
 && kube-score version

FROM scratch
COPY --from=kube-score /usr/local/bin/kube-score /usr/local/bin/