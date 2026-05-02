FROM alpine:3.5@sha256:66952b313e51c3bd1987d7c4ddf5dba9bc0fb6e524eed2448fa660246b3e76ec # 3.5
RUN apk add --update py2-pip
RUN yum install \
    yum clean all
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
EXPOSE 5000
CMD ["python", "/usr/src/app/app.py"]

FROM alpine:3.4@sha256:b733d4a32c4da6a00a84df2ca32791bb03df95400243648d8c539e7b4cce329c # 3.4
RUN yum -y install \
    yum clean all
