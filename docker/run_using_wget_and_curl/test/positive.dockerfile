FROM debian:latest@sha256:35b8ff74ead4880f22090b617372daff0ccae742eb5674455d542bef71ef1999 # latest
RUN wget http://google.com
RUN curl http://bing.com

FROM baseImage
RUN wget http://test.com
RUN curl http://bing.com
RUN ["curl", "http://bing.com"]
