using CommunityToolkit.Maui.Views;
using Microsoft.Extensions.Logging;
using System.Windows.Input;
using System.Collections.ObjectModel;
using Xceed.Words.NET;
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
        // Проверяем, выбраны ли шаблон и группа
        if (SelectedTemplate == null || SelectedGroup == null)
        {
            await Application.Current.MainPage.DisplayAlert("Ошибка", "Выберите шаблон и группу", "ОК");
            return;
        }

        try
        {
            // Получаем список студентов для выбранной группы
            var students = await _databaseService.GetStudentsByGroupAsync(SelectedGroup.id);
            if (students == null || students.Count == 0)
            {
                await Application.Current.MainPage.DisplayAlert("Ошибка", "В выбранной группе нет студентов", "ОК");
                return;
            }

            // Путь к шаблону
            string templatePath = SelectedTemplate.Path;

            // Путь для сохранения нового документа
            string outputDir = Path.Combine(FileSystem.AppDataDirectory, "Output");
            if (!Directory.Exists(outputDir))
                Directory.CreateDirectory(outputDir);
            string outputPath = Path.Combine(outputDir, $"list_oznakomleniya_{SelectedGroup.name}_{DateTime.Now:yyyyMMddHHmmss}.docx");

            // Загружаем шаблон
            using (var doc = DocX.Load(templatePath))
            {
                // Заменяем placeholders
                doc.ReplaceText("[GROUP]", SelectedGroup.name);
                doc.ReplaceText("[DATE]", DateTime.Now.ToString("dd.MM.yyyy")); // Текущая дата, можно заменить на ввод пользователя

                // Находим первую таблицу в документе
                if (doc.Tables.Count == 0)
                {
                    await Application.Current.MainPage.DisplayAlert("Ошибка", "В шаблоне нет таблицы", "ОК");
                    return;
                }
                var table = doc.Tables[0];

                // Удаляем все строки кроме заголовка (первая строка — заголовок)
                while (table.RowCount > 1)
                {
                    table.RemoveRow(1);
                }
                const float rowHeight = 20f;
                // Добавляем строки для каждого студента
                for (int i = 0; i < students.Count; i++)
                {
                    var student = students[i];
                    var row = table.InsertRow();
                    row.Height = rowHeight; // Устанавливаем высоту строки
                    row.Cells[0].Paragraphs[0].Append((i + 1).ToString()); // № п/п
                    row.Cells[1].Paragraphs[0].Append($"{student.surname} {student.name} {student.middleName}"); // ФИО
                    row.Cells[2].Paragraphs[0].Append(""); // Подпись, дата (оставляем пустым)
                }

                // Сохраняем документ
                doc.SaveAs(outputPath);
            }

            // Уведомляем пользователя
            await Application.Current.MainPage.DisplayAlert("Успех", $"Документ сохранен: {outputPath}", "ОК");
            Close(); // Закрываем попап
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Ошибка", $"Не удалось сгенерировать документ: {ex.Message}", "ОК");
        }
    }
}
