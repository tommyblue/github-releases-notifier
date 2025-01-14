FROM golang:1.20 as builder

ADD . /go/src/github.com/justwatchcom/github-releases-notifier
WORKDIR /go/src/github.com/justwatchcom/github-releases-notifier

RUN make build

FROM alpine:3.18
RUN apk --no-cache add ca-certificates

COPY --from=builder /go/src/github.com/justwatchcom/github-releases-notifier /bin/
ENTRYPOINT [ "/bin/github-releases-notifier" ]
