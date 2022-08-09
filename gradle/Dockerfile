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

FROM alpine:3.16.2@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --link --from=helper /opt/gradle /opt/gradle
RUN ["/opt/gradle/bin/gradle", "--version"]

FROM base