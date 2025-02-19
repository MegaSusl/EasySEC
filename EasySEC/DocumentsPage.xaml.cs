using Microsoft.Extensions.Logging;

namespace EasySEC;

public partial class DocumentsPage : ContentPage
{
    readonly ILogger<DocumentsPage> _logger;

    public DocumentsPage(ILogger<DocumentsPage> logger)
    {
        InitializeComponent();
        _logger = logger;
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        _logger.LogInformation("Страница документов отображается");
    }
}