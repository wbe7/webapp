FROM golang:latest as build
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY . /go/src/app
RUN go build -o WebApp

FROM scratch
RUN mkdir -p /app
COPY --from=build /go/src/app/WebApp /usr/local/bin/WebApp
ENTRYPOINT [ "/usr/local/bin/WebApp" ]