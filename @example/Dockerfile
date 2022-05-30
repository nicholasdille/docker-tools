#syntax=docker/dockerfile:1.4.1

FROM alpine:3.15.4@sha256:4edbd2beb5f78b1014028f4fbb99f3237d9561100b6881aabbf5acce2c4f9454
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
