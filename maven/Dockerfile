#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=apache/maven
ARG MAVEN_VERSION=3.8.5
RUN curl --silent --location https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
        tar -C /opt -xz \
 && mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven

FROM scratch AS base
COPY --link --from=helper /opt/maven /opt/maven

FROM alpine:3.16.1@sha256:7580ece7963bfa863801466c0a488f11c86f85d9988051a9f9c68cb27f6b7872 AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --link --from=helper /opt/maven /opt/maven
RUN ["/opt/maven/bin/mvn", "--version"]

FROM base