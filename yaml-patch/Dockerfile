FROM golang:1.15-alpine@sha256:b58c367d52e46cdedc25ec9cd74cadb14ad65e8db75b25e5ec117cdb227aa264 AS yaml-patch
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