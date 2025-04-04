using CommunityToolkit.Maui.Views;
using System.Windows.Input;

namespace EasySEC;

public partial class AddSupervisorPopup : Popup
{
    public string name { get; set; }
    public string surname { get; set; }
    public string middleName { get; set; }
    public string Email { get; set; }
    public string Position { get; set; }
    private readonly DatabaseService _databaseService;
    public ICommand SaveCommand { get; }
    public AddSupervisorPopup(DatabaseService databaseService)
    {
        InitializeComponent();
        _databaseService = databaseService;
        SaveCommand = new Command(SaveSupervisor);
        BindingContext = this;
    }

    private async void SaveSupervisor()
    {
        var nameParts = FullName.Text.Split(' ');
        var supervisor = new Supervisor
        {
            name = nameParts.Length > 1 ? nameParts[1] : string.Empty,
            middleName = nameParts.Length > 0 ? nameParts[0] : string.Empty,
            surname = nameParts.Length > 2 ? nameParts[2] : string.Empty,
            position = position.Text
        };
        await _databaseService.SaveSupervisorAsync(supervisor);
        Close();
    }
}