FROM ubuntu:latest@sha256:c4a8d5503dfb2a3eb8ab5f807da5bc69a85730fb49b5cfca2330194ebcc41c7b # latest
ADD cairo.spec cairo-1.13.1.tar.xz cairo-multilib.patch  /rpmbuild/SOURCES
