FROM nicholasdille/tools:helpers AS gradle
# renovate: datasource=github-tags depName=gradle/gradle
ARG GRADLE_VERSION=6.9.1
RUN curl --silent --location --fail --remote-name  https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
 && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
 && mv /opt/gradle-${GRADLE_VERSION} /opt/gradle \
 && rm -f gradle-${GRADLE_VERSION}-bin.zip

FROM scratch
COPY --from=gradle /opt/gradle /opt/gradle