## Docker compose проект c drawDB

**DrawDB** — бесплатный, простой и интуитивно понятный редактор схем баз данных и генератор SQL прямо в браузере

[Ссылка на drawDB в Github](https://github.com/drawdb-io/drawdb)

Перед началом работы над этим проектом, проверье другие запущенные у вас **docker-compose** приложения:
```shell
docker compose ls
```
их лучше остановить, чтобы снизить риск возникновения конфликтов использования портов!

![alt text](image.png)

### 1. Получение drawDB из аппстрима

> appstream (аппсмтрим) - автор-разработчик, предоставляющий единую инфраструктуру для описания своего программного обеспечения

Клонируем репозиторий (клонируйте в корень домашней папки текущего пользователя `cd ~`):
```shell
git clone https://github.com/drawdb-io/drawdb
```

![alt text](image-1.png)

Переходим в локальную папку склонированного репозитория
```shell
cd drawdb/
```

### 2. Установка и запуск drawDB локально

Запускаем проект
```shell
docker compose up -d
```

![alt text](image-2.png)

Убедиться, что проект запущен
```shell
docker compose ls
```
> Внимание! Проекту нужно несколько минут для запуска контейнера, подождите немного, прежде чем открыть его в браузере

![alt text](image-3.png)

[Открыть **drawDB** локально в браузере](http://localhost:5173/)

![alt text](image-4.png)

### 3. Удалить проект

1. Остановить контейнер с удалением данных
```shell
docker compose down -v
```

![alt text](image-5.png)

2. Проверить, не запущен ли удаляемый контейнер
```shell
docker ps -a
```

![alt text](image-6.png)

и

```shell
docker compose ps -a
```

![alt text](image-7.png)

3. Получить id образа
```shell
docker images
```

![alt text](image-8.png)

4. Удалить образ
```shell
docker rmi id-образа
```

![alt text](image-9.png)

5. Удалить каталог проекта
```shell
rm -rf drawdb
```

![alt text](image-10.png)

Упрощённый вариант способ удаления этого проекта:

1. Остановить и удалить контейнер с данными
```shell
docker compose down --rmi all -v
```

![alt text](image-11.png)

2. Выйти из каталога
```shell
cd ..
```
3. Удалить каталог проекта
```shell
rm -rf drawdb
```

![alt text](image-12.png)

---

Пример экспортированной ER-диаграммы
```mermaid
erDiagram
	books }o--|| authors : references
	reservations ||--|| books : references
	reservations ||--|| patrons : references
	books }o--|| genres : references

	books {
		INT id
		VARCHAR(255) title
		VARCHAR(255) isbn
		INT author_id
		INT genre_id
	}

	genres {
		INT id
		VARCHAR(255) name
	}

	authors {
		INT id
		VARCHAR(255) name
		DATE birthday
		VARCHAR(255) nationality
	}

	reservations {
		INT id
		INT book_id
		INT patron_id
		DATE date
		VARCHAR(255) email
	}

	patrons {
		INT id
		VARCHAR(255) name
		VARCHAR(255) email
		VARCHAR(255) phone
	}
```

> Если вы обнаружили ошибку в этом тексте - сообщите пожалуйста автору!