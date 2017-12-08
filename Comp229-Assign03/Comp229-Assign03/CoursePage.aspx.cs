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
                //DisplayData();

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

        private void DisplayData()
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

            SqlDataReader dr = cmd.ExecuteReader();



            if (dr.Read())
            {
                /*this.lblCid.Text = dr["StudentID"].ToString();
                this.lblFname.Text = dr["FirstMidName"].ToString();
                this.lblLname.Text = dr["LastName"].ToString();
                this.lblCid.Text = Request["CourseID"];
                this.lblTitle.Text = dr["Title"].ToString();*/
            }
            else
            {
                Response.Write("Cannot Find Data");
                Response.End();
            }
            dr.Close();
            con.Close();
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
            /*SqlCommand cmd = new SqlCommand(
                String.Format("Insert into Students(LastName, FirstMidName, EnrollmentDate) Values({0}, {1}, {2}",
                memo.LastName, memo.FirstMidName, "2017-12-06 12:00:00 AM"), con);*/


            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@LastName", memo.LastName);
            cmd.Parameters.AddWithValue("@FirstMidName", memo.FirstMidName);
            cmd.Parameters.AddWithValue("@CourseID", memo.CourseID);
            //cmd.Parameters.AddWithValue("@StudentID", memo.StudentID);
            cmd.Parameters.AddWithValue("@EnrollmentDate", memo.EnrollmentDate);

            cmd.ExecuteReader();
            con.Close();
            Response.Redirect("CoursePage.aspx?CourseID=" + Request["CourseID"]);





        }

        protected void CourseGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

          /*  SqlConnection con = new SqlConnection(ConfigurationManager
                .ConnectionStrings["Comp229Assign03"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("DeleteMemo2", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("StudentID", SqlDbType.Int);
            cmd.Parameters["StudentID"].Value = Convert.ToInt32(Request["StudentID"]);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Default.aspx");*/
        }

        protected void RegisterStudentToCourse_Click(object sender, EventArgs e)
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


            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Insert into Students values('" +txtFname1.Text + "','" + txtLname1.Text + "','" + memo.EnrollmentDate + "')";
           // cmd.CommandText = "Insert into Enrollments values('" + memo.StudentID + "','" + memo.CourseID + "','" + 0 + "')";
            cmd.ExecuteNonQuery();

            con.Close();
            Response.Redirect("CoursePage.aspx?CourseID=" + Request["CourseID"]);

        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            CourseGridView1.DeleteRow(CourseGridView1.SelectedIndex);
        }
    }
}