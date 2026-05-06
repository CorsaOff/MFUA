var app = WebApplication.Create(args);
// Определяем маршрут для корневого URL
app.MapGet("/", () => "Hello from Docker! Привет из Docker!");
// Запускаем приложение на порту 80
app.Run("http://*:80");