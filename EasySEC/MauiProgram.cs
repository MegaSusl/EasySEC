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
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

#if DEBUG
        builder.Logging.AddDebug();
#endif

        // Регистрация страниц в DI-контейнере
        builder.Services.AddTransient<EasySEC.MainPage>();
        builder.Services.AddTransient<EasySEC.DocumentsPage>();
        builder.Services.AddTransient<EasySEC.PlaceholderPage>();

        // Регистрация сервиса базы данных
        builder.Services.AddSingleton<DatabaseService>(sp =>
            new DatabaseService(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "easysec.db3")));

        var dbPath = Path.Combine(FileSystem.AppDataDirectory, "mydatabase.db3");
        var dbService = new DatabaseService(dbPath);

        return builder.Build();
    }
}