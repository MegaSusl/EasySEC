using CommunityToolkit.Maui.Views;
using Microsoft.Extensions.Logging;
using System.Collections.ObjectModel;
using System.Xml.Linq;

namespace EasySEC;

public partial class StudentsPage : ContentPage
{
    public ObservableCollection<Student> Students { get; set; }
    private readonly DatabaseService _databaseService;
    private ILogger<MainPage> _logger;

    public StudentsPage(DatabaseService databaseService, ILogger<MainPage> logger)
    {
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        InitializeComponent();
        var dbPath = Path.Combine(FileSystem.AppDataDirectory, "mydatabase.db3");
        _databaseService = new DatabaseService(dbPath);
        Students = new ObservableCollection<Student>();
        BindingContext = this;
        LoadStudents();
    }

    private async void LoadStudents()
    {
        try
        {
            var students = await _databaseService.GetStudentsAsync();
            Students.Clear();
            foreach (var student in students)
            {
                Students.Add(student);
            }
            _logger.LogInformation("������ ��������� ������� ��������");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "������ ��� �������� ���������");
            await DisplayAlert("������", "�� ������� ��������� ���������", "��");
        }
    }

    private void OnAddStudentClicked(object sender, EventArgs e)
    {
        var popup = new AddStudentPopup(_databaseService);
        this.ShowPopup(popup);
        popup.Closed += (s, args) => LoadStudents(); // ��������� ������ ����� �������� ������
    }
    private async void OnEditStudentClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Student student)
        {
            _logger.LogInformation($"�������������� ��������: {student.FullName}");
            // ����� ����� ������� ����� ��� ��������������
            await DisplayAlert("��������������", $"�������������� ��������: {student.FullName}", "��");
        }
    }

    private async void OnDeleteStudentClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Student student)
        {
            var confirm = await DisplayAlert("�������������", $"������� �������� {student.FullName}?", "��", "���");
            if (confirm)
            {
                try
                {
                    await _databaseService.DeleteStudentAsync(student);
                    Students.Remove(student);
                    _logger.LogInformation($"������� {student.FullName} �����");
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "������ ��� �������� ��������");
                    await DisplayAlert("������", "�� ������� ������� ��������", "��");
                }
            }
        }
    }
}
public partial class Student
{
    // ����������� �������� ��� ������� �����
    public string FullName => $"{middleName} {name} {surname}".Trim();
}
