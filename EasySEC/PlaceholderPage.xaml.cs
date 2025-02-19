using Microsoft.Extensions.Logging;

namespace EasySEC;

public partial class PlaceholderPage : ContentPage
{
    readonly ILogger<PlaceholderPage> _logger;

    public PlaceholderPage(ILogger<PlaceholderPage> logger)
    {
        InitializeComponent();
        _logger = logger;
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        _logger.LogInformation("Заглушка отображается");
    }
}