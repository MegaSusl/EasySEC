#if WINDOWS
using Microsoft.UI;
using Microsoft.UI.Windowing;
using WinRT.Interop;
using Microsoft.UI.Xaml.Media;
using Windows.UI;
using WinUI = Microsoft.UI; // Алиас для ясности
using UiColors = Microsoft.UI.Colors;
using Microsoft.Maui.Controls.Platform;
using Windows.Graphics;
using System.Collections.Specialized;
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
        if (Application.Current.Windows is INotifyCollectionChanged windows)
        {
            windows.CollectionChanged += OnWindowsCollectionChanged;
        }
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

    private void OnWindowsCollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
    {
        if (e.NewItems != null)
        {
            foreach (var newWindow in e.NewItems)
            {
                if (newWindow is Window window)
                {
                    window.Created += (s, args) => CustomizeTitleBar(window);
                }
            }
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

    private void CustomizeTitleBar(Window window)
    {
        if (window.Handler?.PlatformView is Microsoft.UI.Xaml.Window nativeWindow)
        {
            var handle = WindowNative.GetWindowHandle(nativeWindow);
            var windowId = Microsoft.UI.Win32Interop.GetWindowIdFromWindow(handle);
            var appWindow = AppWindow.GetFromWindowId(windowId);

            appWindow.TitleBar.ExtendsContentIntoTitleBar = true;
            appWindow.TitleBar.ButtonBackgroundColor = Microsoft.UI.Colors.Transparent;
            appWindow.TitleBar.ButtonInactiveBackgroundColor = Microsoft.UI.Colors.Transparent;
        }
    }
#endif
}
