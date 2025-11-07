FROM alpine:3.22.2

RUN apk upgrade --no-cache
RUN apk add --no-cache ca-certificates openssl bash
RUN update-ca-certificates

RUN wget https://dl.k8s.io/release/v1.34.1/bin/linux/amd64/kubectl \
  -O /usr/bin/kubectl && chmod +x /usr/bin/kubectl

COPY bin/kd_linux_amd64 /bin/kd

RUN chmod +x /bin/kd

ENTRYPOINT ["/bin/kd"]
