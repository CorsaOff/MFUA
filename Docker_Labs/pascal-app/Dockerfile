# Используем готовый образ с Free Pascal
FROM primeimages/freepascal:3.2.2

WORKDIR /app

# Копируем исходный код
COPY hello.pas .

# Компилируем Pascal-код в исполняемый файл
RUN fpc hello.pas

# Запускаем скомпилированное приложение
CMD ["./hello"]