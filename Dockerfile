# We need a golang build environment first
FROM golang:1.11.2-alpine as builder
WORKDIR /go/src/app
ADD hello-world.go /go/src/app

# RUN go build hello-world.go
RUN go build hello-world.go

FROM scratch
WORKDIR /go/src/app
COPY --from=builder "/go/src/app/hello-world" .
CMD [ "./hello-world" ] 