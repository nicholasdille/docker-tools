FROM golang:1.17-alpine@sha256:5c2fcfeb58ad9d4948d94e7b2d0432a9bc38bee0f8dfb41d383f38a18b75c38d AS helper
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