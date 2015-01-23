FROM debian:jessie
RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		wget \
	&& rm -rf /var/lib/apt/lists/*

# FROM buildpack-deps:jessie-curl
RUN apt-get update && apt-get install -y --no-install-recommends \
		bzr \
		git \
		mercurial \
		openssh-client \
		subversion \
	&& rm -rf /var/lib/apt/lists/*

#FROM buildpack-deps:jessie-scm
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

ENV JAVA_VERSION 7u71
ENV JAVA_DEBIAN_VERSION 7u71-2.5.3-2

RUN apt-get update && apt-get install -y openjdk-7-jdk="$JAVA_DEBIAN_VERSION" && rm -rf /var/lib/apt/lists/*

