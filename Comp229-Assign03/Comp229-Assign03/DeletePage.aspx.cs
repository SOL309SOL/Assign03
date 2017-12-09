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
    public partial class DeletePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request["StudentID"]))
            {
                Response.Write("Wrong request");
                Response.End();
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    lblNum.Text = Request["StudentID"];
                }
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Button for Deleting Selected Student Data

            SqlConnection con = new SqlConnection(ConfigurationManager
                .ConnectionStrings["Comp229Assign03"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("DeleteMemo2", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("StudentID", SqlDbType.Int);
            cmd.Parameters["StudentID"].Value = Convert.ToInt32(Request["StudentID"]);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Default.aspx");
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            //Button for Going Back to List
            Response.Redirect("Default.aspx");
        }
    }
}