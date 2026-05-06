# ---- Этап 1: сборка ----
FROM ubuntu:22.04 AS build

# Ставим зависимости для сборки
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY main.cpp CMakeLists.txt ./

# Собираем проект
RUN mkdir build && cd build && \
    cmake .. && \
    make

# ---- Этап 2: финальный образ ----
FROM ubuntu:22.04

# Только нужные либы для работы
RUN apt-get update && apt-get install -y \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/build/ftxui_demo /usr/local/bin/ftxui_demo

CMD ["ftxui_demo"]