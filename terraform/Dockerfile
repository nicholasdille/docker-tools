#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=hashicorp/terraform
ARG TERRAFORM_VERSION=v1.2.1
RUN curl -sLfO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION#v}/terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip -d /usr/local/bin/ \
 && rm terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip

FROM scratch AS base
COPY --link --from=helper /usr/local/bin/* /usr/local/bin/

FROM ubuntu:22.04@sha256:20fa2d7bb4de7723f542be5923b06c4d704370f0390e4ae9e1c833c8785644c1 AS test
COPY --from=helper /usr/local/bin/* /usr/local/bin/
RUN ["terraform", "version"]

FROM base