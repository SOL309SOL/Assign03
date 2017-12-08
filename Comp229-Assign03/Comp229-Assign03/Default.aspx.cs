using Comp229_Assign03.Models;
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
    public partial class _Default : Page
    {
        DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Comp229Assign03"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("ListMemo9", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);


            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();
        }
        protected void btnWrite_Click(object sender, EventArgs e)
        {
            Memo memo = new Memo();
            memo.FirstMidName = txtfName.Text;
            memo.LastName = txtlName.Text;
           // memo.CourseID = txtCourse.Text;
            memo.EnrollmentDate = DateTime.Now;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[
                "Comp229Assign03"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("WriteMemo15", con);
            /*SqlCommand cmd = new SqlCommand(
                String.Format("Insert into Students(LastName, FirstMidName, EnrollmentDate) Values({0}, {1}, {2}",
                memo.LastName, memo.FirstMidName, "2017-12-06 12:00:00 AM"), con);*/


            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            
            cmd.Parameters.AddWithValue("@LastName", memo.LastName);
            cmd.Parameters.AddWithValue("@FirstMidName", memo.FirstMidName);
            //cmd.Parameters.AddWithValue("@CourseID", memo.CourseID);
            //cmd.Parameters.AddWithValue("@StudentID", memo.StudentID);
            cmd.Parameters.AddWithValue("@EnrollmentDate", memo.EnrollmentDate);

            cmd.ExecuteReader();
            con.Close();
            label2.Text = "Saved";




        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}