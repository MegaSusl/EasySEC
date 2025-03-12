using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasySEC
{
    class FinalQualifyingWork
    {
        [PrimaryKey, AutoIncrement]
        public long id { get; set; }
        public string topic { get; set; }
        public long studentId { get; set; }
        public long supervisorId { get; set; }
        public string mark { get; set; }
    }
}
