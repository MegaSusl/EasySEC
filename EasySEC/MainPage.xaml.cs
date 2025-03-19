using Microsoft.Extensions.Logging;
using System.Diagnostics;
using Xceed.Words.NET;

namespace EasySEC
{
    public partial class MainPage : ContentPage
    {
        readonly ILogger<MainPage> _logger;

        public MainPage(ILogger<MainPage> logger)
        {
            InitializeComponent();
            EnsureFoldersExist().GetAwaiter().GetResult();
            _logger = logger;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            _logger.LogInformation("Главная страница отображается");
        }
        private async void OnSubmitClicked(object sender, EventArgs e)
        {
            // Collect form data (e.g., from Entry controls)
            string name = nameEntry.Text ?? "";
            string age = ageEntry.Text ?? "";
            string address = addressEntry.Text ?? "";
            string email = emailEntry.Text ?? "";
            string group = groupEntry.Text ?? "";

            // Basic validation
            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(age))
            {
                await DisplayAlert("Error", "Name and Age are required.", "OK");
                return;
            }

            try
            {
                // Load template from Templates folder
                string templatePath = Path.Combine(FileSystem.AppDataDirectory, "Templates", "template.docx");
                using var doc = DocX.Load(templatePath);

                // Replace placeholders in the template
                doc.ReplaceText("[Name]", name);
                doc.ReplaceText("[GROUP]", group);
                //doc.ReplaceText("[Age]", age);
                doc.ReplaceText("[Address]", address);
                //doc.ReplaceText("[Email]", email);

                // Create a unique filename with a timestamp
                string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                string outputFileName = $"filled_document_{timestamp}.docx";
                string outputPath = Path.Combine(FileSystem.AppDataDirectory, "Output", outputFileName);

                // Save the filled document to Output folder
                doc.SaveAs(outputPath);

                // Notify the user
                await DisplayAlert("Success", $"Document saved to: {outputPath}", "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }
        private async Task EnsureFoldersExist()
        {
            // Define paths for Templates and Output folders
            string templatesDir = Path.Combine(FileSystem.AppDataDirectory, "Templates");
            string outputDir = Path.Combine(FileSystem.AppDataDirectory, "Output");

            // Create Templates folder and copy templates if it doesn’t exist
            if (!Directory.Exists(templatesDir))
            {
                Directory.CreateDirectory(templatesDir);
            }

            // Create Output folder if it doesn’t exist
            if (!Directory.Exists(outputDir))
            {
                Directory.CreateDirectory(outputDir);
            }
        }
    }
}
