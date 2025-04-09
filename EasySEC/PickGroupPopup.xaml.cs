using CommunityToolkit.Maui.Views;
using Microsoft.Extensions.Logging;
using System.Windows.Input;
using System.Collections.ObjectModel;
namespace EasySEC;

public partial class PickGroupPopup : Popup
{
    private readonly DatabaseService _databaseService;
    private readonly ILogger<PickGroupPopup> _logger;
    public ObservableCollection<Group> Groups { get; set; }
    public Group SelectedGroup { get; set; }
    public ObservableCollection<TemplateItem> Templates { get; set; }
    public TemplateItem SelectedTemplate { get; set; }
    public ICommand Generate { get; }

    public PickGroupPopup(DatabaseService databaseService, ILogger<PickGroupPopup> logger)
    {
        InitializeComponent();
        _databaseService = databaseService;
        _logger = logger;
        Groups = new ObservableCollection<Group>();
        Templates = new ObservableCollection<TemplateItem>();
        Generate = new Command(OnGenerateClicked);
        BindingContext = this;
        LoadGroupsAsync();
        LoadTemplatesAsync();
    }

    private async void LoadGroupsAsync()
    {
        try
        {
            var groups = await _databaseService.GetAllGroupsAsync();
            foreach (var group in groups)
            {
                Groups.Add(group);
            }
            _logger?.LogInformation($"Загружено групп: {Groups.Count}");
        }
        catch (Exception ex)
        {
            _logger?.LogError(ex, "Ошибка при загрузке групп");
            await Application.Current.MainPage.DisplayAlert("Ошибка", "Не удалось загрузить группы", "ОК");
        }
    }

    private async void LoadTemplatesAsync()
    {
        string templatesDir = Path.Combine(FileSystem.AppDataDirectory, "Templates");
        var files = Directory.GetFiles(templatesDir, "*.docx");
        foreach (var file in files)
        {
            string fileName = Path.GetFileName(file);
            bool isEnabled = Preferences.Get($"Template_{fileName}", true);
            if (isEnabled)
            {
                Templates.Add(new TemplateItem
                {
                    Name = fileName,
                    Path = file,
                    IsEnabled = true
                });
            }
        }
    }

    private async void OnGenerateClicked()
    {
        if (SelectedGroup == null || SelectedTemplate == null)
        {
            await Application.Current.MainPage.DisplayAlert("Ошибка", "Выберите группу и шаблон", "ОК");
            return;
        }

        _logger?.LogInformation($"Генерация документа для группы {SelectedGroup.name} с шаблоном {SelectedTemplate.Name}");
        // Логика генерации документа
        Close();
    }
}
