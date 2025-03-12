using Microsoft.Extensions.Logging;

namespace EasySEC;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
            });

        // Добавление логирования
        builder.Logging.AddDebug();

        // Регистрация страниц в DI-контейнере
        builder.Services.AddTransient<EasySEC.MainPage>();
        builder.Services.AddTransient<EasySEC.DocumentsPage>();
        builder.Services.AddTransient<EasySEC.PlaceholderPage>();

        var dbPath = Path.Combine(FileSystem.AppDataDirectory, "mydatabase.db3");
        var dbService = new DatabaseService(dbPath);

        return builder.Build();
    }
}
