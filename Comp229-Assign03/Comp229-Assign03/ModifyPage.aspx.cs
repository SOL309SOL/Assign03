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
    public partial class ModifyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request["StudentID"]))
            {
                Response.Write("Wrong Request");
                Response.End();
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    DisplayData();
                }
            }
        }
        private void DisplayData()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["Comp229Assign03"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("ViewMemo", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("StudentID", SqlDbType.Int);
            cmd.Parameters["StudentID"].Value = Convert.ToInt32(Request["StudentID"]);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                this.lblId.Text = Request["StudentID"];
                this.txtFName.Text = dr["FirstMidName"].ToString();
                this.txtLName.Text = dr["LastName"].ToString();
                //this.txtDate.Text = dr["EnrollmentDate"].ToString();

            }
            else
            {
                Response.Write("No Data");
                Response.End();
            }
            dr.Close();
            con.Close();
        }
        protected void btnModify_Click(object sender, EventArgs e)
        {
            Memo memo = new Memo();
            memo.StudentID = Convert.ToInt32(Request["StudentID"]);
            memo.FirstMidName = txtFName.Text;
            memo.LastName = txtLName.Text;
            //memo.EnrollmentDate = txtDate;

            SqlConnection con = new SqlConnection(ConfigurationManager
                .ConnectionStrings["Comp229Assign03"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("ModifyMemo1", con);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FirstMidName", memo.FirstMidName);
            cmd.Parameters.AddWithValue("@LastName", memo.LastName);
            //cmd.Parameters.AddWithValue("@EnrollmentDate", memo.EnrollmentDate);
            cmd.Parameters.AddWithValue("@StudentID", memo.StudentID);

            cmd.ExecuteNonQuery();

            con.Close();
            Response.Redirect("StudentPage.aspx?StudentID=" + Request["StudentID"]);


        }
        protected void btnList_Click(Object sender, EventArgs e)
        {
            Response.RedirectPermanent("Default.aspx");
        }
    }
}