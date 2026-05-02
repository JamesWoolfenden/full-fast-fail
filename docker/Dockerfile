FROM python:3.8-alpine@sha256:3d93b1f77efce339aa77db726656872517b0d67837989aa7c4b35bd5ae7e81ba # 3.8-alpine

RUN apk update && apk add git

RUN pip install -U checkov
ENTRYPOINT ["checkov"]
