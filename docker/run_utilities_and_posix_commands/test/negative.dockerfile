FROM ubuntu:latest@sha256:c4a8d5503dfb2a3eb8ab5f807da5bc69a85730fb49b5cfca2330194ebcc41c7b # latest
RUN apt-get update && apt-get install -y x11vnc xvfb firefox
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN bash -c 'echo "firefox" >> /.bashrc'
RUN apt-get install nano vim
EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]
