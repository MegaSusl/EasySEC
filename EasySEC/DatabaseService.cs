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
            //_database.CreateTableAsync<Student>().Wait();
            //_database.CreateTableAsync<Supervisor>().Wait();
            //_database.CreateTableAsync<FinalQualifyingWork>().Wait();
        }

        // Получение всех Student
        public Task<List<Student>> GetStudentsAsync()
        {
            return _database.Table<Student>().ToListAsync();
        }

        // Сохранение пользователя (добавление или обновление)
        public Task<int> SaveUserAsync(Student user)
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
        public Task<int> DeleteUserAsync(Student user)
        {
            return _database.DeleteAsync(user);
        }
    }
}
