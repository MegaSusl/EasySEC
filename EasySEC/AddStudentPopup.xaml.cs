using CommunityToolkit.Maui.Views;
using System.Windows.Input;

namespace EasySEC;

public partial class AddStudentPopup : Popup
{
    public string name { get; set; }
    public string surname { get; set; }
    public string middleName { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string Group { get; set; }
    private readonly DatabaseService _databaseService;
    public ICommand SaveCommand { get; }
    public AddStudentPopup(DatabaseService databaseService)
    {
        InitializeComponent();
        _databaseService = databaseService;
        SaveCommand = new Command(SaveStudent);
        BindingContext = this;
    }

    private async void SaveStudent()
    {
        var nameParts = FullName.Text.Split(' ');
        var student = new Student
        {
            name = nameParts.Length > 0 ? nameParts[1] : string.Empty,
            middleName = nameParts.Length > 0 ? nameParts[0] : string.Empty,
            surname = nameParts.Length > 0 ? nameParts[2] : string.Empty,
            email = email.Text,
            phone = phone.Text,
            groupId = Int64.Parse(groupId.Text)
        };
        await _databaseService.SaveStudentAsync(student);
        Close();
    }
}