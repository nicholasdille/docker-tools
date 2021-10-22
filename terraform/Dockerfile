FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=hashicorp/terraform
ARG TERRAFORM_VERSION=v1.0.8
RUN curl -sLfO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION#v}/terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip -d /usr/local/bin/ \
 && rm terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM ubuntu:21.04 AS test
COPY --from=helper /usr/local/bin/* /usr/local/bin/
RUN ["terraform", "version"]

FROM base