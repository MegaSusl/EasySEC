using System;
using System.Collections.ObjectModel;
using System.IO;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;

namespace EasySEC
{
    public partial class PreferencesPage : ContentPage
    {
        private readonly DatabaseService _databaseService;
        public ObservableCollection<TemplateItem> Templates { get; set; }
        public ICommand SaveCommand { get; }
        public ICommand DeleteAllStudentsCommand { get; }
        public ICommand DeleteAllGroupsCommand { get; }
        public ICommand DeleteAllSupervisorsCommand { get; }
        public PreferencesPage(DatabaseService databaseService)
        {
            InitializeComponent();
            _databaseService = new DatabaseService(Path.Combine(FileSystem.AppDataDirectory, "mydatabase.db3"));
            Templates = new ObservableCollection<TemplateItem>();
            SaveCommand = new Command(SaveSettings);
            DeleteAllStudentsCommand = new Command(async () => await DeleteAllStudentsAsync());
            DeleteAllGroupsCommand = new Command(async () => await DeleteAllGroupsAsync());
            DeleteAllSupervisorsCommand = new Command(async () => await DeleteAllSupervisorsAsync());

            BindingContext = this;
            LoadTemplates();
        }

        private void LoadTemplates()
        {
            // ���� � ����� � ���������
            string templatesDir = Path.Combine(FileSystem.AppDataDirectory, "Templates");
            if (!Directory.Exists(templatesDir))
            {
                Directory.CreateDirectory(templatesDir);
            }

            // �������� ��� .docx ����� �� �����
            var files = Directory.GetFiles(templatesDir, "*.docx");
            foreach (var file in files)
            {
                string fileName = Path.GetFileName(file);
                string filePath = file;

                // ��������� ��������� IsEnabled �� Preferences (�� ��������� true)
                bool isEnabled = Preferences.Get($"Template_{fileName}", true);

                // ������� TemplateItem � ��������� � ���������
                Templates.Add(new TemplateItem
                {
                    Name = fileName,
                    Path = filePath,
                    IsEnabled = isEnabled
                });
            }
        }

        private void SaveSettings()
        {
            foreach (var template in Templates)
            {
                // ��������� ��������� IsEnabled ��� ������� �������
                Preferences.Set($"Template_{template.Name}", template.IsEnabled);
            }
            DisplayAlert("�����", "��������� �������� ���������", "��");
        }
        private async Task DeleteAllStudentsAsync()
        {
            bool confirm = await DisplayAlert("�������������", "�� �������, ��� ������ ������� ���� ���������?", "��", "���");
            if (confirm)
            {
                await _databaseService.DeleteAllStudentsAsync();
                await DisplayAlert("�����", "��� �������� �������", "��");
            }
        }

        private async Task DeleteAllGroupsAsync()
        {
            bool confirm = await DisplayAlert("�������������", "�� �������, ��� ������ ������� ��� ������?", "��", "���");
            if (confirm)
            {
                await _databaseService.DeleteAllGroupsAsync();
                await DisplayAlert("�����", "��� ������ �������", "��");
            }
        }

        private async Task DeleteAllSupervisorsAsync()
        {
            bool confirm = await DisplayAlert("�������������", "�� �������, ��� ������ ������� ���� ��������������?", "��", "���");
            if (confirm)
            {
                await _databaseService.DeleteAllSupervisorsAsync();
                await DisplayAlert("�����", "��� ������������� �������", "��");
            }
        }
    }
}