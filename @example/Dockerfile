#syntax=docker/dockerfile:1.4.1

FROM alpine:3.16.1@sha256:7580ece7963bfa863801466c0a488f11c86f85d9988051a9f9c68cb27f6b7872
RUN apk add --update-cache --no-cache \
        git \
        curl \
        ca-certificates \
        jq \
        bash

COPY --link --from=nicholasdille/tools:docker / /
COPY --link --from=nicholasdille/tools:docker-compose / /
COPY --link --from=nicholasdille/tools:docker-ls / /
COPY --link --from=nicholasdille/tools:docker-machine / /
COPY --link --from=nicholasdille/tools:glab / /
COPY --link --from=nicholasdille/tools:go / /
COPY --link --from=nicholasdille/tools:gradle / /
COPY --link --from=nicholasdille/tools:helm / /
COPY --link --from=nicholasdille/tools:jfrog / /
COPY --link --from=nicholasdille/tools:ksort / /
COPY --link --from=nicholasdille/tools:kube-score / /
COPY --link --from=nicholasdille/tools:kubectl / /
COPY --link --from=nicholasdille/tools:kubeone / /
COPY --link --from=nicholasdille/tools:kustomize / /
COPY --link --from=nicholasdille/tools:maven / /
COPY --link --from=nicholasdille/tools:node / /
COPY --link --from=nicholasdille/tools:oras / /
COPY --link --from=nicholasdille/tools:sops / /
COPY --link --from=nicholasdille/tools:terraform / /
COPY --link --from=nicholasdille/tools:trivy / /
COPY --link --from=nicholasdille/tools:yq / /
