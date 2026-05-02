FROM opensuse/leap:15.2@sha256:dfa464ed7bc25fb77ad652d4e722cb0e78fc230425846be10e51dda1f43aa5c9 # 15.2
RUN yum install -y httpd && yum clean all
RUN ["yum", "install", "httpd"]
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
