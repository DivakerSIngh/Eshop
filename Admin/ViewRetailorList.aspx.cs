using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class Retailor_ViewRetailorList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            load_retailer_list();
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
        }
    }

    private void load_retailer_list()
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetRetailerList(Session["loginid"].ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                gv_RetailerList.DataSource = ds.Tables[0];
                gv_RetailerList.DataBind();
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }


    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        string[] commandArgs = ((LinkButton)sender).CommandArgument.ToString().Split(new char[] { ',' });
        string rid = commandArgs[0];
        string userid= commandArgs[1];
        Response.Redirect("AddRetailorInfo.aspx?type=U&rid=" + rid + "&userid" + userid);
    }

    protected void lnkBlock_Command(object sender, CommandEventArgs e)
    {
        new DB().Update_RLE_Status(1, "Y", e.CommandArgument.ToString());
        load_retailer_list();
    }

    protected void lnkActive_Command(object sender, CommandEventArgs e)
    {
        new DB().Update_RLE_Status(1, "N", e.CommandArgument.ToString());
        load_retailer_list();
    }
}