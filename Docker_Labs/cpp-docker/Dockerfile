# ---- Этап 1: сборка (Compiler) ----
FROM gcc:latest AS build
WORKDIR /app
COPY hello.cpp .
# Компилируем статически (-static), чтобы бинарник работал в чистом Alpine
RUN g++ -static -o hello hello.cpp

# ---- Этап 2: финальный образ (Runtime) ----
FROM alpine:latest
# Копируем только готовый файл из этапа build
COPY --from=build /app/hello /usr/local/bin/hello
CMD ["hello"]