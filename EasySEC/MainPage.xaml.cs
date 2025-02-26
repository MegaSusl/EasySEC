using Microsoft.Extensions.Logging;
using Xceed.Words.NET;

namespace EasySEC
{
    public partial class MainPage : ContentPage
    {
        readonly ILogger<MainPage> _logger;

        public MainPage(ILogger<MainPage> logger)
        {
            InitializeComponent();
            EnsureTemplatesFolderExists().GetAwaiter().GetResult();
            _logger = logger;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            _logger.LogInformation("Главная страница отображается");
        }
        private async void OnSubmitClicked(object sender, EventArgs e)
        {
            // Collect form data
            string name = nameEntry.Text ?? "";
            string age = ageEntry.Text ?? "";
            string address = addressEntry.Text ?? "";
            string email = emailEntry.Text ?? "";

            // Basic validation
            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(age))
            {
                await DisplayAlert("Error", "Name and Age are required.", "OK");
                return;
            }

            try
            {
                // Load the template from the Templates folder in AppDataDirectory
                string templatePath = Path.Combine(FileSystem.AppDataDirectory, "Templates", "template.docx");
                using var doc = DocX.Load(templatePath);

                // Replace placeholders
                doc.ReplaceText("[Name]", name);
                doc.ReplaceText("[Age]", age);
                doc.ReplaceText("[Address]", address);
                doc.ReplaceText("[Email]", email);

                // Generate a unique filename with timestamp
                string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                string newFilePath = Path.Combine(FileSystem.AppDataDirectory, $"filled_document_{timestamp}.docx");

                // Save the new document
                doc.SaveAs(newFilePath);

                // Show success message
                await DisplayAlert("Success", $"Document saved to: {newFilePath}", "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }
        private async Task EnsureTemplatesFolderExists()
        {
            string templatesDir = Path.Combine(FileSystem.AppDataDirectory, "templates");
            string defaultTemplatePath = Path.Combine(templatesDir, "template.docx");

            if (!Directory.Exists(templatesDir))
            {
                Directory.CreateDirectory(templatesDir);
            }

            if (!File.Exists(defaultTemplatePath))
            {
                // Copy default template from bundled asset to Templates folder
                using var stream = await FileSystem.OpenAppPackageFileAsync("templates/template.docx");
                using var fileStream = File.OpenWrite(defaultTemplatePath);
                await stream.CopyToAsync(fileStream);
            }
        }
    }
}
