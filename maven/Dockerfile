FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=apache/maven
ARG MAVEN_VERSION=3.8.4
RUN curl --silent --location https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
        tar -C /opt -xz \
 && mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven

FROM scratch AS base
COPY --from=helper /opt/maven /opt/maven

FROM alpine:3.14.3@sha256:635f0aa53d99017b38d1a0aa5b2082f7812b03e3cdb299103fe77b5c8a07f1d2 AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --from=helper /opt/maven /opt/maven
RUN ["/opt/maven/bin/mvn", "--version"]

FROM base