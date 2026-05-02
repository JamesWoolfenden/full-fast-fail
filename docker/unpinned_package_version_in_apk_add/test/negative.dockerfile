FROM alpine:3.4@sha256:b733d4a32c4da6a00a84df2ca32791bb03df95400243648d8c539e7b4cce329c # 3.4
RUN apk add --update py-pip=7.1.2-r0
RUN sudo pip install --upgrade pip
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
EXPOSE 5000
CMD ["python", "/usr/src/app/app.py"]

FROM alpine:3.1@sha256:4dfc68bc95af5c1beb5e307133ce91546874dcd0d880736b25ddbe6f483c65b4 # 3.1
RUN apk add py-pip=7.1.2-r0
RUN ["apk", "add", "py-pip=7.1.2-r0"]
RUN sudo pip install --upgrade pip
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
EXPOSE 5000
CMD ["python", "/usr/src/app/app.py"]
