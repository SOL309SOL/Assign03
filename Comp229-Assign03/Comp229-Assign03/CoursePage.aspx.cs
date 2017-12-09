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
    public partial class CoursePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (String.IsNullOrEmpty(Request["CourseID"]))
            {
                Response.Write("Wrong request");
                Response.End();
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["Comp229Assign03"].ConnectionString;
                con.Open();

                SqlCommand cmd = new SqlCommand("ViewCourse11", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                cmd.Parameters.Add("CourseID", SqlDbType.Int);
                cmd.Parameters["CourseID"].Value = Convert.ToInt32(Request["CourseID"]);

                cmd.Parameters.Add("StudentID", SqlDbType.Int);
                cmd.Parameters["StudentID"].Value = Convert.ToInt32(Request["StudentID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                CourseGridView.DataSource = ds;
                CourseGridView.DataBind();

                con.Close();

            }
        }

       
        protected void btnWrite_Click(object sender, EventArgs e)
        {
            Memo memo = new Memo();
            memo.FirstMidName = txtfName.Text;
            memo.LastName = txtlName.Text;
            memo.CourseID = txtCourse.Text;
            memo.EnrollmentDate = DateTime.Now;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[
                "Comp229Assign03"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("WriteMemo14", con);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@LastName", memo.LastName);
            cmd.Parameters.AddWithValue("@FirstMidName", memo.FirstMidName);
            cmd.Parameters.AddWithValue("@CourseID", memo.CourseID);
            cmd.Parameters.AddWithValue("@EnrollmentDate", memo.EnrollmentDate);

            cmd.ExecuteReader();
            con.Close();
            Response.Redirect("CoursePage.aspx?CourseID=" + Request["CourseID"]);





        }

        protected void CourseGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
        }


        protected void Delete_Click(object sender, EventArgs e)
        {
            CourseGridView1.DeleteRow(CourseGridView1.SelectedIndex);
        }
    }
}