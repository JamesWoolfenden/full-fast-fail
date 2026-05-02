FROM golang:1.7.3@sha256:340212e9c5d062f3bfe58ff02768da70234ea734bd022a357ee6be2a6d963505 # 1.7.3
WORKDIR /go/src/github.com/alexellis/href-counter/
RUN go get -d -v golang.org/x/net/html
COPY app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11 # latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/alexellis/href-counter/app .
ENTRYPOINT [ "/opt/app/run.sh", "--port", "8080" ]
ENTRYPOINT [ "/opt/app/run.sh", "--port", "8000" ]
