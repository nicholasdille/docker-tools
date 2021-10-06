FROM docker:20.10.9@sha256:e7c9c600322345ad23160a0cafde129426270f50ae83133f5354c3fe347a36c2 AS base

FROM base AS final
RUN apk add --update-cache --no-cache \
        git \
        curl \
        ca-certificates \
        jq \
        bash

COPY --from=nicholasdille/tools:trivy / /
COPY --from=nicholasdille/tools:oras / /
COPY --from=nicholasdille/tools:docker-ls / /
COPY --from=nicholasdille/tools:glab / /
COPY --from=nicholasdille/tools:helm / /
COPY --from=nicholasdille/tools:jfrog / /
COPY --from=nicholasdille/tools:ksort / /
COPY --from=nicholasdille/tools:kube-score / /
COPY --from=nicholasdille/tools:kubectl / /
COPY --from=nicholasdille/tools:kubeone / /
COPY --from=nicholasdille/tools:kustomize / /
COPY --from=nicholasdille/tools:terraform / /
COPY --from=nicholasdille/tools:yaml-patch / /
COPY --from=nicholasdille/tools:yq / /
