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
            _logger.LogInformation("Список студентов успешно загружен");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при загрузке студентов");
            await DisplayAlert("Ошибка", "Не удалось загрузить студентов", "ОК");
        }
    }

    private void OnAddStudentClicked(object sender, EventArgs e)
    {
        var popup = new AddStudentPopup(_databaseService);
        this.ShowPopup(popup);
        popup.Closed += (s, args) => LoadStudents(); // Обновляем список после закрытия попапа
    }
    private async void OnEditStudentClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Student student)
        {
            _logger.LogInformation($"Редактирование студента: {student.FullName}");
            // Здесь можно открыть попап для редактирования
            await DisplayAlert("Редактирование", $"Редактирование студента: {student.FullName}", "ОК");
        }
    }

    private async void OnDeleteStudentClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Student student)
        {
            var confirm = await DisplayAlert("Подтверждение", $"Удалить студента {student.FullName}?", "Да", "Нет");
            if (confirm)
            {
                try
                {
                    await _databaseService.DeleteStudentAsync(student);
                    Students.Remove(student);
                    _logger.LogInformation($"Студент {student.FullName} удалён");
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Ошибка при удалении студента");
                    await DisplayAlert("Ошибка", "Не удалось удалить студента", "ОК");
                }
            }
        }
    }
}
public partial class Student
{
    // Вычисляемое свойство для полного имени
    public string FullName => $"{middleName} {name} {surname}".Trim();
}
