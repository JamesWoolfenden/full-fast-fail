FROM golang:1.12.0-stretch@sha256:25cadebaee179273407abe188337b857d850521f750cf29dfbc89d02441aab08 # 1.12.0-stretch
WORKDIR /go
COPY . /go
RUN top
RUN ["ps", "-d"]
CMD ["go", "run", "main.go"]
