FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=gradle/gradle
ARG GRADLE_VERSION=6.9.1
RUN curl --silent --location --fail --remote-name  https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
 && mv /opt/gradle-${GRADLE_VERSION} /opt/gradle \
 && rm -f gradle-${GRADLE_VERSION}-bin.zip

FROM scratch AS base
COPY --from=helper /opt/gradle /opt/gradle

FROM alpine:3.14.2@sha256:e1c082e3d3c45cccac829840a25941e679c25d438cc8412c2fa221cf1a824e6a AS test
RUN apk add --update-cache --no-cache \
        openjdk11-jre-headless
COPY --from=helper /opt/gradle /opt/gradle
RUN ["/opt/gradle/bin/gradle", "--version"]

FROM base