#if WINDOWS
using Microsoft.UI;
using Microsoft.UI.Windowing;
using WinRT.Interop;
using Microsoft.UI.Xaml.Media;
using Windows.UI;
using WinUI = Microsoft.UI; // Алиас для ясности
using UiColors = Microsoft.UI.Colors;
using Microsoft.Maui.Controls.Platform;
#endif

namespace EasySEC;

public partial class App : Application
{
    public App()
    {
        InitializeComponent();
        MainPage = new AppShell();

#if WINDOWS
        // Регистрируем обработчик при создании окна
        this.HandlerChanged += OnAppHandlerChanged;
#endif
    }

#if WINDOWS
    private void OnAppHandlerChanged(object sender, EventArgs e)
    {
        if (this.Handler?.PlatformView is not null)
        {
            // Используем таймер для отложенного выполнения после полной инициализации окна
            Dispatcher.DispatchDelayed(TimeSpan.FromMilliseconds(100), () =>
            {
                SetTitleBarColor("#4B4B4B");
            });
        }
    }

    private void SetTitleBarColor(string hexColor)
    {
        try
        {
            // Получаем окно через Application.Current
            var window = Application.Current?.Windows.FirstOrDefault();
            if (window?.Handler?.PlatformView is Microsoft.UI.Xaml.Window nativeWindow)
            {
                var handle = WindowNative.GetWindowHandle(nativeWindow);
                var windowId = Microsoft.UI.Win32Interop.GetWindowIdFromWindow(handle);
                var appWindow = AppWindow.GetFromWindowId(windowId);

                var color = HexToColor(hexColor);
                appWindow.TitleBar.BackgroundColor = color;
                appWindow.TitleBar.ForegroundColor = UiColors.White;
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Ошибка изменения цвета заголовка: {ex.Message}");
        }
    }

    private static Windows.UI.Color HexToColor(string hex)
    {
    hex = hex.Trim().Replace("#", "");
    
    if (hex.Length != 6)
    {
            // Возвращаем цвет по умолчанию (#4B4B4B)
            return ColorHelper.FromArgb(255, 75, 75, 75);
        }

        return ColorHelper.FromArgb(
        255,
        Convert.ToByte(hex.Substring(0, 2), 16),
        Convert.ToByte(hex.Substring(2, 2), 16),
        Convert.ToByte(hex.Substring(4, 2), 16)
    );
    }
#endif
}