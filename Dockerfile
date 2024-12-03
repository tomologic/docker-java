FROM debian:bullseye

# https://bell-sw.com/pages/downloads/?version=java
# Full version includes JFX
ENV JDK_VERSION=8u432+7
ENV JDK_URL=https://download.bell-sw.com/java/${JDK_VERSION}/bellsoft-jdk${JDK_VERSION}-linux-amd64-full.deb
ENV JDK_SHA1=868a47262f2f99c27e846fbe75a7fae17c0104bb

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install --no-install-recommends -y ca-certificates curl \
    && curl -fsSL ${JDK_URL} -o /opt/java.deb \
    && echo "${JDK_SHA1} /opt/java.deb" | sha1sum -c - \
    && apt -y install /opt/java.deb \
    && rm /opt/java.deb \
    && java -version \
    && apt-get remove -y ca-certificates curl \
    && rm -rf /var/lib/apt/lists/*
