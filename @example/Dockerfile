FROM alpine:3.14.3@sha256:635f0aa53d99017b38d1a0aa5b2082f7812b03e3cdb299103fe77b5c8a07f1d2
RUN apk add --update-cache --no-cache \
        git \
        curl \
        ca-certificates \
        jq \
        bash

COPY --from=nicholasdille/tools:docker / /
COPY --from=nicholasdille/tools:docker-compose / /
COPY --from=nicholasdille/tools:docker-ls / /
COPY --from=nicholasdille/tools:docker-machine / /
COPY --from=nicholasdille/tools:glab / /
COPY --from=nicholasdille/tools:go / /
COPY --from=nicholasdille/tools:gradle / /
COPY --from=nicholasdille/tools:helm / /
COPY --from=nicholasdille/tools:jfrog / /
COPY --from=nicholasdille/tools:ksort / /
COPY --from=nicholasdille/tools:kube-score / /
COPY --from=nicholasdille/tools:kubectl / /
COPY --from=nicholasdille/tools:kubeone / /
COPY --from=nicholasdille/tools:kustomize / /
COPY --from=nicholasdille/tools:maven / /
COPY --from=nicholasdille/tools:node / /
COPY --from=nicholasdille/tools:oras / /
COPY --from=nicholasdille/tools:python3.8 / /
COPY --from=nicholasdille/tools:sops / /
COPY --from=nicholasdille/tools:terraform / /
COPY --from=nicholasdille/tools:trivy / /
COPY --from=nicholasdille/tools:yaml-patch / /
COPY --from=nicholasdille/tools:yq / /
