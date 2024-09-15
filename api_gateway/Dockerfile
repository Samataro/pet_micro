FROM golang:1.23.1 AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем весь исходный код
COPY src/* ./

# Загружаем зависимости
RUN go mod download

# Компилируем бинарник
RUN CGO_ENABLED=0 GOOS=linux go build -o api_gateway .

# Используем минимальный образ для выполнения
FROM debian:bullseye-slim

# Копируем бинарник из предыдущего образа
COPY --from=builder /app/api_gateway /usr/local/bin/

# Открываем порт
EXPOSE 8080

# Запускаем бинарник
ENTRYPOINT ["/usr/local/bin/api_gateway"]