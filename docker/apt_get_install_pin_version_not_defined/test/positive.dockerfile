FROM busybox:latest@sha256:1487d0af5f52b4ba31c7e465126ee2123fe3f2305d638e7827681e7cf6c83d5e # latest
RUN apt-get install python
RUN ["apt-get", "install", "python"]

FROM busybox2
RUN apt-get install -y -t python

FROM busybox3
RUN apt-get update && apt-get install -y \
    python-qt4 \
    python-pyside \
    python-pip \
    python3-pip \
    python3-pyqt5
