FROM golang:1.23 AS builder
WORKDIR /src
COPY . .

FROM debian:11

RUN apt-get update && apt-get install -y \
      curl \
      wget \
      git \
      openssl \
      python3 \
    && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/git/git/master/README.md /app/README.md

ENV API_TOKEN="AKIAIOSFODNN7EXAMPLE"

EXPOSE 22

COPY --from=builder /src /app
ENTRYPOINT ["/app/run"]
