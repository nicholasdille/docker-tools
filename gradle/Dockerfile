#syntax=docker/dockerfile:1.4.1

FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=gradle/gradle
ARG GRADLE_VERSION=7.5.0
RUN curl --silent --location --fail --remote-name https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
 && mv /opt/gradle-${GRADLE_VERSION} /opt/gradle \
 && rm -f gradle-${GRADLE_VERSION}-bin.zip

FROM scratch AS base
COPY --link --from=helper /opt/gradle /opt/gradle

FROM alpine:3.16.0@sha256:686d8c9dfa6f3ccfc8230bc3178d23f84eeaf7e457f36f271ab1acc53015037c AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --link --from=helper /opt/gradle /opt/gradle
RUN ["/opt/gradle/bin/gradle", "--version"]

FROM base