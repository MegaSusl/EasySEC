using CommunityToolkit.Maui.Views;
using Microsoft.Extensions.Logging;
using System.Collections.ObjectModel;
using System.Xml.Linq;

namespace EasySEC;

public partial class SupervisorsPage : ContentPage
{
    public ObservableCollection<Supervisor> Supervisors { get; set; }
    private readonly DatabaseService _databaseService;
    private ILogger<MainPage> _logger;
    public SupervisorsPage(DatabaseService databaseService, ILogger<MainPage> logger)
	{
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        InitializeComponent();
        var dbPath = Path.Combine(FileSystem.AppDataDirectory, "mydatabase.db3");
        _databaseService = new DatabaseService(dbPath);
        Supervisors = new ObservableCollection<Supervisor>();
        BindingContext = this;
        LoadSupervisors();
    }
    //TODO fix messages for logging
    private async void LoadSupervisors()
    {
        try
        {
            var supervisors = await _databaseService.GetSupervisorsAsync();
            Supervisors.Clear();
            foreach (var supervisor in supervisors)
            {
                Supervisors.Add(supervisor);
            }
            _logger.LogInformation("Список преподавателей успешно загружен"); 
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при загрузке студентов");
            await DisplayAlert("Ошибка", "Не удалось загрузить студентов", "ОК");
        }
    }

    private void OnAddSupervisorClicked(object sender, EventArgs e)
    {
        var popup = new AddSupervisorPopup(_databaseService);
        this.ShowPopup(popup);
        popup.Closed += (s, args) => LoadSupervisors(); // Обновляем список после закрытия попапа
    }
    private async void OnEditSupervisorClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Supervisor supervisor)
        {
            _logger.LogInformation($"Редактирование преподавателя: {supervisor.name}");
            // Здесь можно открыть попап для редактирования
            await DisplayAlert("Редактирование", $"Редактирование преподавателя: {supervisor.name}", "ОК");
        }
    }

    private async void OnDeleteSupervisorClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Supervisor supervisor)
        {
            var confirm = await DisplayAlert("Подтверждение", $"Удалить преподавателя {supervisor.name}?", "Да", "Нет");
            if (confirm)
            {
                try
                {
                    await _databaseService.DeleteSupervisorAsync(supervisor);
                    Supervisors.Remove(supervisor);
                    _logger.LogInformation($"преподаватель {supervisor.name} удалён");
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Ошибка при удалении преподавателя");
                    await DisplayAlert("Ошибка", "Не удалось удалить преподавателя", "ОК");
                }
            }
        }
    }
}
public partial class Supervisor
{
    // Вычисляемое свойство для полного имени
    public string FullName => $"{middleName} {name} {surname}".Trim();
}