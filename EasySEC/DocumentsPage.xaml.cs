namespace EasySEC;

using CommunityToolkit.Maui.Views;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using Xceed.Words.NET;

public partial class DocumentsPage : ContentPage
{

    private DatabaseService _databaseService;
    readonly ILogger<DocumentsPage> _logger;
    readonly ILogger<PickGroupPopup> _popupLogger;
    private List<TemplateItem> templates;
    private ExcelParser _excelParser;

    public DocumentsPage(ILogger<DocumentsPage> logger, ILogger<PickGroupPopup> popupLogger, DatabaseService databaseService)
    {
        InitializeComponent();
        _logger = logger;
        _popupLogger = popupLogger;
        _databaseService = new DatabaseService(Path.Combine(FileSystem.AppDataDirectory, "mydatabase.db3"));
        _excelParser = new ExcelParser(_logger, _databaseService);
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        LoadTemplates();
        _logger.LogInformation("Опа");
    }

    private void LoadTemplates()
    {
        // Define the Templates folder path in the app's data directory
        string templatesDir = Path.Combine(FileSystem.AppDataDirectory, "Templates");

        // Create the folder if it doesn�t exist
        if (!Directory.Exists(templatesDir))
        {
            Directory.CreateDirectory(templatesDir);
        }

        // Load all .docx files from the Templates folder
        var templateFiles = Directory.GetFiles(templatesDir, "*.docx");
        templates = new List<TemplateItem>();
        foreach (var file in templateFiles)
        {
            templates.Add(new TemplateItem { Name = Path.GetFileName(file), Path = file });
        }

        // Set the CollectionView's ItemsSource
        templatesCollectionView.ItemsSource = templates;
    }

    private void OnOpenFolderClicked(object sender, EventArgs e)
    {
        string templatesDir = Path.Combine(FileSystem.AppDataDirectory, "Templates");

        #if WINDOWS
            if (Directory.Exists(templatesDir))
            {
                try
                {
                    Process.Start("explorer.exe", templatesDir);
                }
                catch (Exception ex)
                {
                    _logger.LogError($"Failed to open folder: {ex.Message}");
                    DisplayAlert("Error", "Could not open the folder.", "OK");
                }
            }
            else
            {
                _logger.LogWarning("Templates folder does not exist.");
                DisplayAlert("Warning", "Templates folder does not exist.", "OK");
            }
        #else
            _logger.LogInformation("Opening folder is not supported on this platform.");
            DisplayAlert("Info", "Opening folder is not supported on this platform.", "OK");
        #endif
    }

    private void OnNewTemplateClicked(object sender, EventArgs e)
    {
        _logger.LogInformation("Creating a new template");
        // Placeholder for creating a new template
        // You could navigate to a new page or create a default template file
    }

    private void OnEditClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is TemplateItem template)
        {
            _logger.LogInformation($"Editing template: {template.Name}");
            // Placeholder for editing logic
            // You could navigate to an edit page or open the file externally
        }
    }

    private void OnDeleteClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is TemplateItem template)
        {
            try
            {
                File.Delete(template.Path);
                _logger.LogInformation($"Deleted template: {template.Name}");
                LoadTemplates(); // Refresh the list after deletion
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error deleting template: {ex.Message}");
                DisplayAlert("Error", $"Failed to delete {template.Name}: {ex.Message}", "OK");
            }
        }
    }
    private void OnUseClicked(object sender, EventArgs e)
    {
        var popup = new PickGroupPopup(_databaseService, _popupLogger);
        this.ShowPopup(popup);
    }
    public async Task LoadStudentsFromExcelAsync(string excelFilePath)
    {
        var students = _excelParser.ReadStudentsFromExcel(excelFilePath, _databaseService);
        foreach (var student in await students)
        {
            await _databaseService.SaveStudentAsync(student);
        }
    }
    private async void OnLoadFromExcelClicked(object sender, EventArgs e)
    {
        try
        {
            var result = await FilePicker.PickAsync(new PickOptions
            {
                FileTypes = new FilePickerFileType(new Dictionary<DevicePlatform, IEnumerable<string>>
            {
                { DevicePlatform.WinUI, new[] { ".xlsx" } },
                { DevicePlatform.Android, new[] { "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" } },
                { DevicePlatform.iOS, new[] { "org.openxmlformats.spreadsheetml.sheet" } }
            }),
                PickerTitle = "Выберите файл Excel"
            });

            if (result != null)
            {
                await LoadStudentsFromExcelAsync(result.FullPath);
                await DisplayAlert("Успех", "Данные успешно загружены в базу!", "ОК");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", $"Произошла ошибка: {ex.Message}", "ОК");
        }
    }
}