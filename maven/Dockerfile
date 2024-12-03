ARG BASE_IMAGE
FROM ${BASE_IMAGE}

# https://maven.apache.org/download.cgi
ENV MAVEN_VERSION=3.9.9
ENV MAVEN_URL=https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV MAVEN_SHA512=a555254d6b53d267965a3404ecb14e53c3827c09c3b94b5678835887ab404556bfaf78dcfe03ba76fa2508649dca8531c74bca4d5846513522404d48e8c4ac8b

ENV PATH=/usr/local/apache-maven-${MAVEN_VERSION}/bin:$PATH
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Extra tools kept besides maven: curl, unzip
RUN apt-get update \
    && apt-get install --no-install-recommends -y ca-certificates curl unzip\
    && curl -fsSL ${MAVEN_URL} -o /opt/maven.tar.gz \
    && echo "${MAVEN_SHA512} /opt/maven.tar.gz" | sha512sum -c - \
    && tar xzvf /opt/maven.tar.gz -C /usr/local \
    && rm /opt/maven.tar.gz \
    && mvn -version \
    && rm -rf /var/lib/apt/lists/*
