FROM ubuntu:latest@sha256:c4a8d5503dfb2a3eb8ab5f807da5bc69a85730fb49b5cfca2330194ebcc41c7b # latest
COPY README.md ./one
COPY package.json ./two
COPY gulpfile.js ./three
COPY __BUILD_NUMBER ./four

FROM ubuntu:1.2
ADD README.md ./one
ADD package.json ./two
ADD gulpfile.js ./three
ADD __BUILD_NUMBER ./four
