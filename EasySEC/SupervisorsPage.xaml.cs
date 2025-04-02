using CommunityToolkit.Maui.Views;
using Microsoft.Extensions.Logging;
using System.Collections.ObjectModel;

namespace EasySEC;

public partial class SupervisorsPage : ContentPage
{
    public ObservableCollection<Supervisor> Supervisors { get; set; }
    private readonly DatabaseService _databaseService;
    private ILogger<MainPage> _logger;
    public SupervisorsPage()
	{
		InitializeComponent();
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
            _logger.LogInformation("Список студентов успешно загружен"); 
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Ошибка при загрузке студентов");
            await DisplayAlert("Ошибка", "Не удалось загрузить студентов", "ОК");
        }
    }

    private void OnAddSupervisorClicked(object sender, EventArgs e)
    {
        var popup = new AddStudentPopup(_databaseService);
        this.ShowPopup(popup);
        popup.Closed += (s, args) => LoadSupervisors(); // Обновляем список после закрытия попапа
    }
    private async void OnEditSupervisorClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Supervisor supervisor)
        {
            _logger.LogInformation($"Редактирование студента: {supervisor.name}");
            // Здесь можно открыть попап для редактирования
            await DisplayAlert("Редактирование", $"Редактирование студента: {supervisor.name}", "ОК");
        }
    }

    private async void OnDeleteSupervisorClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.BindingContext is Supervisor supervisor)
        {
            var confirm = await DisplayAlert("Подтверждение", $"Удалить студента {supervisor.name}?", "Да", "Нет");
            if (confirm)
            {
                try
                {
                    await _databaseService.DeleteSupervisorAsync(supervisor);
                    Supervisors.Remove(supervisor);
                    _logger.LogInformation($"Студент {supervisor.name} удалён");
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