# Отчет по работе с Docker: Welcome to Docker

## 1. Запуск контейнера
Контейнер был запущен командой:
`docker run -d -p 8088:80 --name welcome-to-docker docker/welcome-to-docker`

![Скриншот работающей страницы](image.png)

## 2. Работа внутри контейнера
Был выполнен вход в контейнер и установлена утилита `fastfetch`.

### Информация о системе (uname):
![Uname screen](image-1.png)

### Диспетчер процессов (top):
![Top screen](image-2.png)

### Результат работы fastfetch:
![Fastfetch screen](image-5.png)