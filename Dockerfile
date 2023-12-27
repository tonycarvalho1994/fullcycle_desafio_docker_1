FROM golang:latest as builder

WORKDIR app

COPY . .

RUN go build -o /app/main .


FROM scratch

COPY --from=builder /app/main /bin/main

ENTRYPOINT [ "/bin/main" ]
