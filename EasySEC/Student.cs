using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasySEC
{
    public class Student
    {
        [PrimaryKey, AutoIncrement]
        public long id { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string middleName { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public long groupId { get; set; }
        public long fqwId { get; set; }
    }
}
