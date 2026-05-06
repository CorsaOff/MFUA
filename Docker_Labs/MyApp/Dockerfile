# 1 ЭТАП: Сборка (используем тяжелый SDK)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Копируем файл проекта и скачиваем зависимости (NuGet пакеты)
COPY ["MyApp.csproj", "."]
RUN dotnet restore "MyApp.csproj"

# Копируем остальной код и компилируем в папку /app/publish
COPY . .
RUN dotnet publish "MyApp.csproj" -c Release -o /app/publish

# 2 ЭТАП: Запуск (используем легкий Runtime)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Забираем только скомпилированные файлы из первого этапа
COPY --from=build /app/publish .

EXPOSE 80
ENTRYPOINT ["dotnet", "MyApp.dll"]