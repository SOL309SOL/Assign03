using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
             if (String.IsNullOrEmpty(Request["Num"]))
             {
                 Response.Write("Wrong request");
                 Response.End();
             }
             else
             {
                 DisplayData();
                 lnkMemoModify.NavigateUrl =
                     $"FrmMemoModify.aspx?StudentID={Request["StudentID"]}";
                 lnkMemoDelete.NavigateUrl =
                     $"FrmMemoDelete.aspx?StudentID={Request["StudentID"]}";
             }

        }
        private void DisplayData()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Comp229Assign03"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("ViewMemo1", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("StudentID", SqlDbType.Int);
            cmd.Parameters["StudentID"].Value = Convert.ToInt32(Request["StudentID"]);
            
              SqlDataReader dr = cmd.ExecuteReader();
             if (dr.Read())
             {
               Response.Write("Test");

               this.lblId.Text = Request["StudentID"];
                 this.lblFname.Text = dr["FirstMidName"].ToString();
               this.lblLname.Text = dr["LastName"].ToString();
                 this.lblDate.Text = dr["EnrollmentDate"].ToString();
               //this.lblCourse.Text = dr.GetString(3);
             }
             else
             {
                 Response.Write("Cannot Find Data");
                 Response.End();
             }
             dr.Close();
             con.Close();
        }
    }
}