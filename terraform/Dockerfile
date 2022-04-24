FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=hashicorp/terraform
ARG TERRAFORM_VERSION=v1.1.9
RUN curl -sLfO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION#v}/terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip -d /usr/local/bin/ \
 && rm terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip

FROM scratch AS base
COPY --from=helper /usr/local/bin/* /usr/local/bin/

FROM ubuntu:21.04@sha256:26cd4ff32a9c031eaca3d6f589a7799f28b34a539e1bd81acbf1a6efeec4b1ce AS test
COPY --from=helper /usr/local/bin/* /usr/local/bin/
RUN ["terraform", "version"]

FROM base