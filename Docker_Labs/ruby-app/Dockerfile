FROM ruby:3.3-slim

# Ставим зависимости для сборки нативных расширений
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копируем список библиотек и ставим их
COPY Gemfile ./
RUN bundle install

# Копируем код
COPY . .

CMD ["ruby", "app.rb"]