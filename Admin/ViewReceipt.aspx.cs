using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewReceipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadLogistic();
           // loadGrid(ddlLogistic.SelectedItem.Value,txttranId.Text);
        }
    }

    protected void lstView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {

    }
    private void loadGrid(string lid,string tranId)
    {
       var ds= new DB().loadReciept(lid, tranId);
        lstView.DataSource = ds.Tables[0];
        lstView.DataBind();
    }

    private void loadLogistic()
    {
        var ds= new DB().GetAllLogistic();
        ddlLogistic.DataSource = ds.Tables[0];
        ddlLogistic.DataTextField = "Title";
        ddlLogistic.DataValueField = "UserId";
        ddlLogistic.DataBind();
    }

    protected void ddlLogistic_SelectedIndexChanged(object sender, EventArgs e)
    {
        //var id = ddlLogistic.SelectedItem.Value;
        //loadGrid(id, txttranId.Text);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        var id = ddlLogistic.SelectedItem.Value;
        loadGrid(id, txttranId.Text);
    }
}