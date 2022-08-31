#syntax=docker/dockerfile:1.4.3

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=apache/maven
ARG MAVEN_VERSION=3.8.5
RUN curl --silent --location https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
        tar -C /opt -xz \
 && mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven

FROM scratch AS base
COPY --link --from=helper /opt/maven /opt/maven

FROM alpine:3.16.0@sha256:686d8c9dfa6f3ccfc8230bc3178d23f84eeaf7e457f36f271ab1acc53015037c AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --link --from=helper /opt/maven /opt/maven
RUN ["/opt/maven/bin/mvn", "--version"]

FROM base