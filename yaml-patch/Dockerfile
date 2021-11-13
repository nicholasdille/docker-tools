FROM golang:1.17-alpine@sha256:41ca88189004aa8c949735b1ba522d6c66c244a4c50ead7f83f8e3c1e6165f0b AS helper
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