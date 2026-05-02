FROM fedora:27@sha256:d9697056b7add7d075b02d1920ec6b587063ac93fe21d83a354b3220ba18bc02 # 27
RUN set -uex && \
    dnf config-manager --set-enabled docker-ce-test && \
    dnf install -y docker-ce && \
    dnf clean all
