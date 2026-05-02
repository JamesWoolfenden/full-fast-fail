FROM gliderlabs/alpine:3.3@sha256:02543032e5431a50bb4c519c4974359c529d3473f844b26c297b890912f02093 # 3.3
RUN apk add --update-cache python
WORKDIR /app
ONBUILD COPY . /app
ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/requirements.txt
EXPOSE 8080
CMD ["/env/bin/python", "main.py"]
