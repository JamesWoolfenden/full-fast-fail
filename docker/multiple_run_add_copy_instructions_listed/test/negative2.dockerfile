FROM ubuntu:latest@sha256:c4a8d5503dfb2a3eb8ab5f807da5bc69a85730fb49b5cfca2330194ebcc41c7b # latest
COPY README.md package.json gulpfile.js __BUILD_NUMBER ./
