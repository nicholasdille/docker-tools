FROM alpine:3.14.2

FROM base AS final
RUN apk add --update-cache --no-cache \
        git \
        curl \
        ca-certificates \
        jq \
        bash

COPY --from=nicholasdille/tools:docker / /
COPY --from=nicholasdille/tools:docker-ls / /
COPY --from=nicholasdille/tools:glab / /
COPY --from=nicholasdille/tools:helm / /
COPY --from=nicholasdille/tools:jfrog / /
COPY --from=nicholasdille/tools:ksort / /
COPY --from=nicholasdille/tools:kube-score / /
COPY --from=nicholasdille/tools:kubectl / /
COPY --from=nicholasdille/tools:kubeone / /
COPY --from=nicholasdille/tools:kustomize / /
COPY --from=nicholasdille/tools:oras / /
COPY --from=nicholasdille/tools:terraform / /
COPY --from=nicholasdille/tools:trivy / /
COPY --from=nicholasdille/tools:yaml-patch / /
COPY --from=nicholasdille/tools:yq / /
