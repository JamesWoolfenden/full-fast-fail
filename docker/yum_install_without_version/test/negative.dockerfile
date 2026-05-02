FROM opensuse/leap:15.2@sha256:dfa464ed7bc25fb77ad652d4e722cb0e78fc230425846be10e51dda1f43aa5c9 # 15.2
RUN yum install -y httpd-2.24.2 && yum clean all
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1


FROM opensuse/leap:15.3@sha256:ce397977a1a7735cdaf662dcc98039c5083e69054788b24e7d6a92c19f190fcd # 15.3
ENV RETHINKDB_PACKAGE_VERSION 2.4.0~0trusty
RUN yum install -y rethinkdb-$RETHINKDB_PACKAGE_VERSION && yum clean all
