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
        //        // Входные данные (можно получать из UI)
        //        long groupId = 1; // Замените на реальный идентификатор группы
        //        string groupName = "ЗПИуд-121"; // Название группы
        //        string orderDate = DateTime.Now.ToString("dd.MM.yyyy"); // Дата приказа

        //        // Пути к файлам
        //        string templatePath = Path.Combine(FileSystem.AppDataDirectory, "Templates", "list_oznakomleniya.docx");
        //        string outputPath = Path.Combine(FileSystem.AppDataDirectory, "Output",
        //            $"list_oznakomleniya_{groupName}_{DateTime.Now:yyyyMMddHHmmss}.docx");

        //        // Получение списка студентов из базы данных
        //        var students = await _databaseService.GetStudentsByGroupAsync(groupId);

        //        // Загрузка шаблона
        //        using (var doc = DocX.Load(templatePath))
        //        {
        //            // Замена placeholders
        //            doc.ReplaceText("[GROUP]", groupName);
        //            doc.ReplaceText("[DATE]", orderDate);

        //            // Находим первую таблицу в документе
        //            var table = doc.Tables[0];

        //            // Удаляем все строки кроме заголовка (если есть примерные данные)
        //            while (table.RowCount > 1)
        //            {
        //                table.RemoveRow(1);
        //            }

        //            // Заполняем таблицу данными студентов
        //            for (int i = 0; i < students.Count; i++)
        //            {
        //                var student = students[i];
        //                var row = table.InsertRow(); // Добавляем новую строку
        //                row.Cells[0].Paragraphs[0].Append((i + 1).ToString()); // Номер по порядку
        //                row.Cells[1].Paragraphs[0].Append($"{student.surname} {student.name} {student.middleName}"); // ФИО
        //                row.Cells[2].Paragraphs[0].Append(""); // Подпись и дата остаются пустыми
        //            }

        //            // Сохраняем заполненный документ
        //            doc.SaveAs(outputPath);
        //        }

        //        // Уведомление об успехе
        //        await DisplayAlert("Успех", $"Документ сохранен: {outputPath}", "ОК");
        //    }
        //    catch (Exception ex)
        //    {
        //        // Обработка ошибок
        //        await DisplayAlert("Ошибка", "Не удалось сгенерировать документ", "ОК");
        //    }
        //}
    }
}
