FROM quay.io/projectquay/golang:1.20 as builder

WORKDIR /go/src/app

COPY . .

RUN make build

FROM scratch
WORKDIR /
COPY --from=builder /demo/app .
ENTRYPOINT [ "./ascii-artify-demo" ]

