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
            // Путь к папке с шаблонами
            string templatesDir = Path.Combine(FileSystem.AppDataDirectory, "Templates");
            if (!Directory.Exists(templatesDir))
            {
                Directory.CreateDirectory(templatesDir);
            }

            // Получаем все .docx файлы из папки
            var files = Directory.GetFiles(templatesDir, "*.docx");
            foreach (var file in files)
            {
                string fileName = Path.GetFileName(file);
                string filePath = file;

                // Загружаем состояние IsEnabled из Preferences (по умолчанию true)
                bool isEnabled = Preferences.Get($"Template_{fileName}", true);

                // Создаем TemplateItem и добавляем в коллекцию
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
                // Сохраняем состояние IsEnabled для каждого шаблона
                Preferences.Set($"Template_{template.Name}", template.IsEnabled);
            }
            DisplayAlert("Успех", "Настройки шаблонов сохранены", "ОК");
        }
    }
}