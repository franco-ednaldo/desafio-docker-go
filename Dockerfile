# We need a golang build environment first
FROM golang:1.11.2-alpine
WORKDIR /go/src/app
ADD hello-world.go /go/src/app

# RUN go build hello-world.go
RUN go build hello-world.go

FROM scratch
COPY --from=0 "/go/src/app/hello-world" hello-world
CMD [ "./hello-world" ] 