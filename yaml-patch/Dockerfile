FROM golang:1.17-alpine@sha256:c23027af83ff27f663d7983750a9a08f442adb2e7563250787b23ab3b6750d9e AS helper
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