## CloudBeaver

**CloudBeaver** — это веб-версия популярного desktop-инструмента **DBeaver**.

1. Создайте отдельный каталог для **DBeaver**
```shell
mkdir DBeaver && cd DBeaver
```

2. Создайте в каталоге `DBeaver` файл `compose.yaml`

```yaml
services:
  cloudbeaver:
    image: dbeaver/cloudbeaver:latest
    container_name: cloudbeaver
    restart: unless-stopped
    ports:
      - "8978:8978"
    volumes:
      - ./workspace:/opt/cloudbeaver/workspace
```
3. Создайте проект (скачать нужные образы, создать контейнеры, запустить сервисы) командой:
```shell
docker compose up -d
```

[После этого откройте http://localhost:8978](http://localhost:8978) и начните работу. Все ваши подключения и настройки сохранятся в папке `./workspace`

Создайте новый сервер с именем администратора `cbadmin` и своим паролем > 8 символов, включая хотя бы одну прописную и строчную букву

4. Управление проектом

### Состояние проекта как сервиса

Показать запущенные проекты
```shell
docker compose ps
```
![alt text](image.png)

или все (в т.ч. остановленные)
```shell
docker compose ps -a
```

![alt text](image-1.png)

### Логи

```shell
docker compose logs cloudbeaver
```

![alt text](image-2.png)

или в режиме ожидания (лучше запускать в отдедльном терминале)
```shell
docker compose logs -f cloudbeaver
```

![alt text](image-3.png)

### Остановка, запуск, вход и выход

Остановить сервис:
```shell
docker compose stop
```

![alt text](image-4.png)

Запустить остановленный сервис:
```shell
docker compose start
```

![alt text](image-5.png)

Перезапустить
```shell
docker compose restart
```

![alt text](image-6.png)

Показать конфигурацию текущего проекта:
```shell
docker compose config
```

![alt text](image-7.png)

Вход в сервис (имя контейнера можно узнать командой `docker compose ps`)
```shell
docker compose exec mysql bash
```

![alt text](image-8.png)

Выйти из сервиса
```shell
exit
```

### Удаление проекта

1. Остановка контейнеров этого проекта (нужно находится в папке проекта):
```shell
docker compose down
```

![alt text](image-9.png)

2. Остановка с полным удалением всех данных (тома, базы данных и файлы) - опционально:
```shell
docker compose down -v
```

![alt text](image-10.png)

(**Будьте осторожны:** эта команда удалит всё, что вы создали в проекте!).
3. Удалить образ проекта
```shell
docker image rm dbeaver/cloudbeaver:latest
```

![alt text](image-11.png)

4. Удалить каталог проекта
Выходим из каталога проекта
```shell
cd ..
```
и удаляем
```shell
rm -rf DBeaver
```

![alt text](image-12.png)

если вы в Linux, то возможно придётся использовать `sudo` или `su -`

### Полезные ссылки

- []()
