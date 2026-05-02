FROM nginx:latest@sha256:6e23479198b998e5e25921dff8455837c7636a67111a04a635cf1bb363d199dc # latest
ENV AUTHOR=Docker
WORKDIR /usr/share/nginx/html
COPY Hello_docker.html /usr/share/nginx/html
CMD cd /usr/share/nginx/html && sed -e s/Docker/"$AUTHOR"/ Hello_docker.html > index.html ; nginx -g 'daemon off;'
