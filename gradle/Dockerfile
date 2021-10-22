FROM nicholasdille/tools:helpers AS helper
# renovate: datasource=github-tags depName=gradle/gradle
ARG GRADLE_VERSION=6.9.1
RUN curl --silent --location --fail --remote-name  https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
 && mv /opt/gradle-${GRADLE_VERSION} /opt/gradle \
 && rm -f gradle-${GRADLE_VERSION}-bin.zip

FROM scratch AS base
COPY --from=helper /opt/gradle /opt/gradle

FROM base AS test
RUN ["gradle", "--version"]

FROM base