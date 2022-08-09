#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=apache/maven
ARG MAVEN_VERSION=3.8.5
RUN curl --silent --location https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
        tar -C /opt -xz \
 && mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven

FROM scratch AS base
COPY --link --from=helper /opt/maven /opt/maven

FROM alpine:3.16.2@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --link --from=helper /opt/maven /opt/maven
RUN ["/opt/maven/bin/mvn", "--version"]

FROM base