FROM fedora:27@sha256:d9697056b7add7d075b02d1920ec6b587063ac93fe21d83a354b3220ba18bc02 # 27
RUN set -uex && \
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo && \
    sed -i 's/\$releasever/26/g' /etc/yum.repos.d/docker-ce.repo && \
    dnf install -vy docker-ce
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1
