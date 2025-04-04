using CommunityToolkit.Maui.Views;
using Microsoft.Maui.ApplicationModel.Communication;
using static Microsoft.Maui.ApplicationModel.Permissions;
using System.Windows.Input;
using Microsoft.WindowsAppSDK.Runtime.Packages;
using Xceed.Words.NET;
namespace EasySEC;

public partial class PickGroupPopup : Popup
{
    private readonly DatabaseService _databaseService;
    public ICommand SaveCommand { get; }
    public PickGroupPopup(DatabaseService databaseService)
	{
		InitializeComponent();
        _databaseService = databaseService;
        SaveCommand = new Command(generateWithGroup);
        BindingContext = this;
    }
    private async void generateWithGroup()
    {
        //if (sender is Button button && button.BindingContext is TemplateItem template)
        //{
        //    try
        //    {
        //        // ������� ������ (����� �������� �� UI)
        //        long groupId = 1; // �������� �� �������� ������������� ������
        //        string groupName = "�����-121"; // �������� ������
        //        string orderDate = DateTime.Now.ToString("dd.MM.yyyy"); // ���� �������

        //        // ���� � ������
        //        string templatePath = Path.Combine(FileSystem.AppDataDirectory, "Templates", "list_oznakomleniya.docx");
        //        string outputPath = Path.Combine(FileSystem.AppDataDirectory, "Output",
        //            $"list_oznakomleniya_{groupName}_{DateTime.Now:yyyyMMddHHmmss}.docx");

        //        // ��������� ������ ��������� �� ���� ������
        //        var students = await _databaseService.GetStudentsByGroupAsync(groupId);

        //        // �������� �������
        //        using (var doc = DocX.Load(templatePath))
        //        {
        //            // ������ placeholders
        //            doc.ReplaceText("[GROUP]", groupName);
        //            doc.ReplaceText("[DATE]", orderDate);

        //            // ������� ������ ������� � ���������
        //            var table = doc.Tables[0];

        //            // ������� ��� ������ ����� ��������� (���� ���� ��������� ������)
        //            while (table.RowCount > 1)
        //            {
        //                table.RemoveRow(1);
        //            }

        //            // ��������� ������� ������� ���������
        //            for (int i = 0; i < students.Count; i++)
        //            {
        //                var student = students[i];
        //                var row = table.InsertRow(); // ��������� ����� ������
        //                row.Cells[0].Paragraphs[0].Append((i + 1).ToString()); // ����� �� �������
        //                row.Cells[1].Paragraphs[0].Append($"{student.surname} {student.name} {student.middleName}"); // ���
        //                row.Cells[2].Paragraphs[0].Append(""); // ������� � ���� �������� �������
        //            }

        //            // ��������� ����������� ��������
        //            doc.SaveAs(outputPath);
        //        }

        //        // ����������� �� ������
        //        await DisplayAlert("�����", $"�������� ��������: {outputPath}", "��");
        //    }
        //    catch (Exception ex)
        //    {
        //        // ��������� ������
        //        await DisplayAlert("������", "�� ������� ������������� ��������", "��");
        //    }
        //}
    }
}
