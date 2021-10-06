FROM golang:1.17-alpine@sha256:13919fb9091f6667cb375d5fdf016ecd6d3a5d5995603000d422b04583de4ef9 AS yaml-patch
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