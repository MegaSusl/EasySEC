using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasySEC
{
    public partial class Group
    {
        [PrimaryKey, AutoIncrement]
        public long id { get; set; }
        public string name { get; set; }
    }
}
