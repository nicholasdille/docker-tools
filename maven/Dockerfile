FROM nicholasdille/tools:helpers AS maven
# renovate: datasource=github-tags depName=apache/maven
ARG MAVEN_VERSION=3.8.3
RUN curl --silent --location https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | \
        tar -C /opt -xz \
 && mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven

FROM scratch
COPY --from=maven /opt/maven /opt/maven