#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=gradle/gradle
ARG GRADLE_VERSION=7.4.2
RUN curl --silent --location --fail --remote-name https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
 && mv /opt/gradle-${GRADLE_VERSION} /opt/gradle \
 && rm -f gradle-${GRADLE_VERSION}-bin.zip

FROM scratch AS base
COPY --link --from=helper /opt/gradle /opt/gradle

FROM alpine:3.16.1@sha256:7580ece7963bfa863801466c0a488f11c86f85d9988051a9f9c68cb27f6b7872 AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --link --from=helper /opt/gradle /opt/gradle
RUN ["/opt/gradle/bin/gradle", "--version"]

FROM base