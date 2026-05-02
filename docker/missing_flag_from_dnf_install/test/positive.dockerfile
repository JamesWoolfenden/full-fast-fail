FROM fedora:27@sha256:d9697056b7add7d075b02d1920ec6b587063ac93fe21d83a354b3220ba18bc02 # 27
RUN set -uex && \
    dnf config-manager --set-enabled docker-ce-test && \
    dnf install docker-ce && \
    dnf clean all

FROM fedora:28@sha256:5593a1e2fe65db0e199faca916b5ce7494a9f0e29b7be9f529fb69d1e8ef42d1 # 28
RUN set -uex
RUN dnf config-manager --set-enabled docker-ce-test
RUN dnf in docker-ce
RUN dnf clean all
