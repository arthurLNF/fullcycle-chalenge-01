FROM golang:1.16-alpine AS primary

WORKDIR /app

COPY src/go.mod ./

RUN go mod download

COPY ./src/*.go ./

RUN go build -o /hello

CMD ["/hello"]

FROM scratch

WORKDIR /

COPY --from=primary /hello /hello

ENTRYPOINT ["/hello"]