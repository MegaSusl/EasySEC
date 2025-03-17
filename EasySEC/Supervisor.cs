using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasySEC
{
    class Supervisor
    {
        [PrimaryKey, AutoIncrement]
        public long id { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string middleName { get; set; }
        public string position { get; set; }
    }
}
