using Microsoft.Extensions.Logging;

namespace EasySEC
{
    public partial class MainPage : ContentPage
    {
        readonly ILogger<MainPage> _logger;

        public MainPage(ILogger<MainPage> logger)
        {
            InitializeComponent();
            _logger = logger;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            _logger.LogInformation("Главная страница отображается");
        }
    }
}
