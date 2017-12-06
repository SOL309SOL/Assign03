using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Comp229_Assign03.Models
{
    public class Memo
    {
         public int StudentID { get; set; }
         public string LastName { get; set; }
         public string FirstMidName { get; set; }
            public string CourseID { get; set; }
        public DateTime EnrollmentDate { get; set; }
    }
}