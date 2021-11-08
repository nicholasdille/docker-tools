FROM golang:1.17-alpine@sha256:102bca942e79a30dd6e9060f780ec3bd224eba2cf6245eadf3411c4699253d50 AS helper
ENV GO111MODULE=auto
RUN apk add --update-cache --no-cache \
        git \
 && go get -u github.com/krishicks/yaml-patch \
 && cd /go/src/github.com/krishicks/yaml-patch/cmd/yaml-patch \
 && go get . \
 && go build . \
 && mv yaml-patch /usr/local/bin/

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM base AS test
RUN ["yaml-patch", "--help"]

FROM base