FROM lsiobase/ubuntu.armhf:bionic

# this image is primarily for XXXsonic downstream apps
# with the inclusion of ffmpeg it may be to heavy for some java apps that do not require it.

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV LANG="C.UTF-8"

RUN \
 echo "**** install runtime packages ****" && \
 apt-get update && \
 apt-get install -y \
	--no-install-recommends \
	ca-certificates \
	ffmpeg \
	flac \
	fontconfig \
	lame \
	openjdk-8-jre-headless \
	ttf-dejavu && \
 echo "**** fix XXXsonic status page ****" && \
 find / -name "accessibility.properties" -exec rm -f '{}' + && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*
