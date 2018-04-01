using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Logistic_ViewLogisticList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            get_logistic_List();
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=L");
        }
    }

    private void get_logistic_List()
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetLogisticList(Session["loginid"].ToString());
            if(ds.Tables[0].Rows.Count > 0)
            {
                gv_LogisticList.DataSource = ds.Tables[0];
                gv_LogisticList.DataBind();
            }
        }
        catch(Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        string lid = e.CommandArgument.ToString();
        Response.Redirect("AddLogisticInfo.aspx?type=U&lid="+lid);
    }

    protected void lnkBlock_Command(object sender, CommandEventArgs e)
    {

    }
}