using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Retailor_ProductList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
        }
        if(!IsPostBack)
        {
            load_product_list();
        }
    }
    private void load_product_list()
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetProdListforRetailer(Session["loginid"].ToString());
            if(ds.Tables[0].Rows.Count > 0)
            {
                gv_ProductList.DataSource = ds.Tables[0];
                gv_ProductList.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "f()", true);
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
    protected void LinkButtonProd_Command(object sender, CommandEventArgs e)
    {
        string pid = e.CommandArgument.ToString();
        Response.Redirect("AddProduct.aspx?type=U&pid="+pid);
    }
}