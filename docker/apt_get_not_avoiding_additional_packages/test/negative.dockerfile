FROM node:12@sha256:01627afeb110b3054ba4a1405541ca095c8bfca1cb6f2be9479c767a2711879e # 12
RUN apt-get --no-install-recommends install apt-utils
RUN ["apt-get", "apt::install-recommends=false", "install", "apt-utils"]
