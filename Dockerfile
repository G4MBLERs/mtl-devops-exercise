# Build stage
FROM golang:1.16 AS build
WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o main

# Final stage
FROM alpine:latest
WORKDIR /app

RUN adduser \
    --disabled-password \
    --no-create-home \
    appuser

USER appuser
COPY --from=build --chown=appuser:appuser /app/main .
EXPOSE 8080
ENTRYPOINT []
#CMD ["./main"]