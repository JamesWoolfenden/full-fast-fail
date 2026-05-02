FROM fedora:latest@sha256:498c452f32a739b61f0ef215bce9924ebc4866cbe44710f58157d77723b7a6d2 # latest
RUN dnf -y update && dnf -y install httpd-2.24.2 && dnf clean all
RUN ["dnf", "install", "httpd-2.24.2"]
COPY index.html /var/www/html/index.html
EXPOSE 80
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
