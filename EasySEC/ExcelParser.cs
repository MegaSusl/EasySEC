﻿using ExcelDataReader;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasySEC
{
    internal class ExcelParser
    {
        private ILogger<MainPage> _logger;

        public ExcelParser(ILogger<MainPage> logger)
        {
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public List<Student> ReadStudentsFromExcel(string filePath)
        {
            var students = new List<Student>();

            try
            {
                System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
                using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
                {
                    var config = new ExcelReaderConfiguration()
                    {
                        FallbackEncoding = Encoding.GetEncoding("windows-1251") // Кодировка для кириллицы
                    };
                    using (var reader = ExcelReaderFactory.CreateReader(stream, config))
                    {
                        // Пропускаем заголовок (первая строка)
                        reader.Read();
                        reader.Read();

                        while (reader.Read())
                        {
                            var fullName = reader.GetString(1); // ФИО
                            var nameParts = fullName.Split(' ');
                            double phoneVal = reader.GetDouble(3);

                            var student = new Student
                            {
                                //id = reader.GetDouble(0),         // №
                                name = nameParts.Length > 0 ? nameParts[1] : string.Empty,
                                middleName = nameParts.Length > 1 ? nameParts[0] : string.Empty,
                                surname = nameParts.Length > 2 ? nameParts[2] : string.Empty,
                                email = reader.GetString(2),                // Email
                                phone = phoneVal.ToString(),                // Телефон
                                                                            //Group = reader.GetString(4)                 // Группа
                            };
                            students.Add(student);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                _logger.LogInformation(ex, "Произошла ошибка: {Message}", ex.Message);
            }
            return students;
        }
    }
}
