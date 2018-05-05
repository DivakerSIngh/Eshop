using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logistic_LogisticPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            checkLogisticInfo(Session["loginid"].ToString());
        }

    }
    private void checkLogisticInfo(string userid)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con = new SqlConnection(DB.constr);
        cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandType = CommandType.StoredProcedure;

        cmd.CommandText = "select ls.Title from Logistic_LoginInfo ll inner join LogisticInfo ls on ls.UserId=ll.UserId where ls.UserId='"+userid+"'";
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        var logisticName = "";
        while (dr.Read())
        {
            logisticName = Convert.ToString(dr["Title"]);
        }
        if (string.IsNullOrEmpty(logisticName))
        {
            lnkAddLogistic.Visible = true;
        }
        else
        {
            lnkAddLogistic.Visible = false;
        }
        
    }
}
