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
            _logger?.LogInformation($"��������� �����: {Groups.Count}");
        }
        catch (Exception ex)
        {
            _logger?.LogError(ex, "������ ��� �������� �����");
            await Application.Current.MainPage.DisplayAlert("������", "�� ������� ��������� ������", "��");
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
        // ���������, ������� �� ������ � ������
        if (SelectedTemplate == null || SelectedGroup == null)
        {
            await Application.Current.MainPage.DisplayAlert("������", "�������� ������ � ������", "��");
            return;
        }

        try
        {
            // �������� ������ ��������� ��� ��������� ������
            var students = await _databaseService.GetStudentsByGroupAsync(SelectedGroup.id);
            if (students == null || students.Count == 0)
            {
                await Application.Current.MainPage.DisplayAlert("������", "� ��������� ������ ��� ���������", "��");
                return;
            }

            // ���� � �������
            string templatePath = SelectedTemplate.Path;

            // ���� ��� ���������� ������ ���������
            string outputDir = Path.Combine(FileSystem.AppDataDirectory, "Output");
            if (!Directory.Exists(outputDir))
                Directory.CreateDirectory(outputDir);
            string outputPath = Path.Combine(outputDir, $"list_oznakomleniya_{SelectedGroup.name}_{DateTime.Now:yyyyMMddHHmmss}.docx");

            // ��������� ������
            using (var doc = DocX.Load(templatePath))
            {
                // �������� placeholders
                doc.ReplaceText("[GROUP]", SelectedGroup.name);
                doc.ReplaceText("[DATE]", DateTime.Now.ToString("dd.MM.yyyy")); // ������� ����, ����� �������� �� ���� ������������

                // ������� ������ ������� � ���������
                if (doc.Tables.Count == 0)
                {
                    await Application.Current.MainPage.DisplayAlert("������", "� ������� ��� �������", "��");
                    return;
                }
                var table = doc.Tables[0];

                // ������� ��� ������ ����� ��������� (������ ������ � ���������)
                while (table.RowCount > 1)
                {
                    table.RemoveRow(1);
                }
                const float rowHeight = 20f;
                // ��������� ������ ��� ������� ��������
                for (int i = 0; i < students.Count; i++)
                {
                    var student = students[i];
                    var row = table.InsertRow();
                    row.Height = rowHeight; // ������������� ������ ������
                    row.Cells[0].Paragraphs[0].Append((i + 1).ToString()); // � �/�
                    row.Cells[1].Paragraphs[0].Append($"{student.surname} {student.name} {student.middleName}"); // ���
                    row.Cells[2].Paragraphs[0].Append(""); // �������, ���� (��������� ������)
                }

                // ��������� ��������
                doc.SaveAs(outputPath);
            }

            // ���������� ������������
            await Application.Current.MainPage.DisplayAlert("�����", $"�������� ��������: {outputPath}", "��");
            Close(); // ��������� �����
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("������", $"�� ������� ������������� ��������: {ex.Message}", "��");
        }
    }
}
