FROM alpine:3.5@sha256:66952b313e51c3bd1987d7c4ddf5dba9bc0fb6e524eed2448fa660246b3e76ec # 3.5
RUN apk add --update py2-pip
RUN pip install --upgrade pip
LABEL maintainer="SvenDowideit@home.org.au"
COPY requirements.txt /usr/src/app/
FROM --platform=arm64 baseimage
