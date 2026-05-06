FROM python:3.11-slim
WORKDIR /app

# Сначала зависимости (используем кэш слоев)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Потом всё остальное
COPY . .

EXPOSE 5000
CMD ["python", "app.py"]