FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=gradle/gradle
ARG GRADLE_VERSION=v6.9.2
RUN curl --silent --location --fail --remote-name  https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
 && mv /opt/gradle-${GRADLE_VERSION} /opt/gradle \
 && rm -f gradle-${GRADLE_VERSION}-bin.zip

FROM scratch AS base
COPY --from=helper /opt/gradle /opt/gradle

FROM alpine:3.14.6@sha256:06b5d462c92fc39303e6363c65e074559f8d6b1363250027ed5053557e3398c5 AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --from=helper /opt/gradle /opt/gradle
RUN ["/opt/gradle/bin/gradle", "--version"]

FROM base