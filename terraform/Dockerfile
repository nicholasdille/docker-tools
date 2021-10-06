FROM nicholasdille/tools:helpers@sha256:43a00bf5aa5ecb25d6c25ea80758842a9eba7dd0535546556ff73975bb154420 AS terraform
# renovate: datasource=github-tags depName=hashicorp/terraform
ARG TERRAFORM_VERSION=v1.0.8
RUN curl -sLfO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION#v}/terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip -d /usr/local/bin/ \
 && rm terraform_${TERRAFORM_VERSION#v}_linux_amd64.zip

FROM scratch
COPY --from=terraform /usr/local/bin/terraform /usr/local/bin/