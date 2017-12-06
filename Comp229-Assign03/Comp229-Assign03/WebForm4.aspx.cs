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
    public partial class WebForm4 : System.Web.UI.Page
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

                SqlCommand cmd = new SqlCommand("ViewCourse7", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

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

            SqlCommand cmd = new SqlCommand("ViewCourse10", con);
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

            memo.EnrollmentDate = DateTime.Now;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[
                "Comp229Assign03"].ConnectionString;
            con.Open();


            SqlCommand cmd = new SqlCommand("WriteMemo11", con);


            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            
            cmd.Parameters.AddWithValue("@LastName", memo.LastName);
            cmd.Parameters.AddWithValue("@FirstMidName", memo.FirstMidName);
            cmd.Parameters.AddWithValue("@EnrollmentDate", memo.EnrollmentDate);

            cmd.ExecuteNonQuery();
            con.Close();
            label2.Text = "Saved";

            DisplayData();


        }
    }
}