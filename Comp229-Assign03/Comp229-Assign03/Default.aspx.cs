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

            SqlCommand cmd = new SqlCommand("ListMemo1", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);


            da.Fill(ds, "dbo.Students");

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();
        }
        
    }
}