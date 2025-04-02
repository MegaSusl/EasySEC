using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasySEC
{
    public class DatabaseService
    {
        private readonly SQLiteAsyncConnection _database;

        public DatabaseService(string dbPath)
        {
            _database = new SQLiteAsyncConnection(dbPath);
            _database.CreateTableAsync<Student>().Wait();
            _database.CreateTableAsync<Supervisor>().Wait();
            //_database.CreateTableAsync<FinalQualifyingWork>().Wait();
            System.Diagnostics.Debug.WriteLine(dbPath);
        }

        // Получение всех Student
        public Task<List<Student>> GetStudentsAsync()
        {
            try
            {
                var students = _database.Table<Student>().ToListAsync();
                System.Diagnostics.Debug.WriteLine($"Number of students loaded: {students.Result.Count}");
                return students;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error fetching students: {ex.Message}");
                throw;
            }
        }
        public Task<List<Supervisor>> GetSupervisorsAsync()
        {
            try
            {
                var supervisor = _database.Table<Supervisor>().ToListAsync();
                System.Diagnostics.Debug.WriteLine($"Number of students loaded: {supervisor.Result.Count}");
                return supervisor;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error fetching students: {ex.Message}");
                throw;
            }
        }

        // Сохранение пользователя (добавление или обновление)
        public Task<int> SaveStudentAsync(Student user)
        {
            if (user.id != 0)
            {
                return _database.UpdateAsync(user); // Обновление существующей записи
            }
            else
            {
                return _database.InsertAsync(user); // Добавление новой записи
            }
        }
        public Task<int> SaveSupervisorAsync(Supervisor user)
        {
            if (user.id != 0)
            {
                return _database.UpdateAsync(user); // Обновление существующей записи
            }
            else
            {
                return _database.InsertAsync(user); // Добавление новой записи
            }
        }

        // Удаление пользователя
        public Task<int> DeleteStudentAsync(Student user)
        {
            return _database.DeleteAsync(user);
        }        
        public Task<int> DeleteSupervisorAsync(Supervisor user)
        {
            return _database.DeleteAsync(user);
        }        
    }
}
