FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=hashicorp/terraform
ARG TERRAFORM_VERSION=v1.0.11
RUN curl -sLfO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION#v}/terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip -d /usr/local/bin/ \
 && rm terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM ubuntu:21.04@sha256:ba394fabd516b39ccf8597ec656a9ddd7d0a2688ed8cb373ca7ac9b6fe67848f AS test
COPY --from=helper /usr/local/bin/* /usr/local/bin/
RUN ["terraform", "version"]

FROM base