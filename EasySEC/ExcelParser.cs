using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasySEC
{
    class ExcelParser
    {
        public List<Student> ReadStudentsFromExcel(string filePath)
        {
            var students = new List<Student>();

            using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
            {
                using (var reader = ExcelReaderFactory.CreateReader(stream))
                {
                    // Пропускаем заголовок (первая строка)
                    reader.Read();

                    while (reader.Read())
                    {
                        var fullName = reader.GetString(1); // ФИО
                        var nameParts = fullName.Split(' ');

                        var student = new Student
                        {
                            id = int.Parse(reader.GetString(0)),         // №
                            name = nameParts.Length > 0 ? nameParts[1] : string.Empty,
                            middleName = nameParts.Length > 1 ? nameParts[0] : string.Empty,
                            surname = nameParts.Length > 2 ? nameParts[2] : string.Empty,
                            email = reader.GetString(2),                // Email
                            phone = reader.GetString(3),                // Телефон
                            //Group = reader.GetString(4)                 // Группа
                        };
                        students.Add(student);
                    }
                }
            }

            return students;
        }
    }
}
