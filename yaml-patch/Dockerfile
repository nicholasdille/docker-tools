FROM golang:1.17-alpine@sha256:c2335038e2230960f81cb2f9f1fc5eca45e23b765de1848c7bbfaebcfd32d90d AS yaml-patch
ENV GO111MODULE=auto
RUN apk add --update-cache --no-cache \
        git \
 && go get -u github.com/krishicks/yaml-patch \
 && cd /go/src/github.com/krishicks/yaml-patch/cmd/yaml-patch \
 && go get . \
 && go build . \
 && mv yaml-patch /usr/local/bin/ \
 && yaml-patch --help

FROM scratch
COPY --from=yaml-patch /usr/local/bin/yaml-patch /usr/local/bin/