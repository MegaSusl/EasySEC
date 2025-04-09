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
        public ObservableCollection<TemplateItem> Templates { get; set; }
        public ICommand SaveCommand { get; }

        public PreferencesPage()
        {
            InitializeComponent();
            Templates = new ObservableCollection<TemplateItem>();
            SaveCommand = new Command(SaveSettings);
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
    }
}