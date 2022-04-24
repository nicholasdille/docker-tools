FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=hashicorp/terraform
ARG TERRAFORM_VERSION=v1.0.11
RUN curl -sLfO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION#v}/terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip -d /usr/local/bin/ \
 && rm terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM ubuntu:22.04@sha256:2a7dffab37165e8b4f206f61cfd984f8bb279843b070217f6ad310c9c31c9c7c AS test
COPY --from=helper /usr/local/bin/* /usr/local/bin/
RUN ["terraform", "version"]

FROM base