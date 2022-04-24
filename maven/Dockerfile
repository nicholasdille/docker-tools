FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=apache/maven
ARG MAVEN_VERSION=3.8.4
RUN curl --silent --location https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
        tar -C /opt -xz \
 && mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven

FROM scratch AS base
COPY --from=helper /opt/maven /opt/maven

FROM alpine:3.14.6@sha256:06b5d462c92fc39303e6363c65e074559f8d6b1363250027ed5053557e3398c5 AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --from=helper /opt/maven /opt/maven
RUN ["/opt/maven/bin/mvn", "--version"]

FROM base