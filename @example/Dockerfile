#syntax=docker/dockerfile:1.4.1

FROM alpine:3.16.2@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad
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
