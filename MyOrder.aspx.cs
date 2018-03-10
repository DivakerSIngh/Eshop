using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class MyOrder : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                string[] usersid = Session["loginid"].ToString().Split(',');
                load_myorderList(usersid[0]);
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    private void load_myorderList(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetAllMyOrderList(userid);
            rptMyOrder.DataSource = ds.Tables[0];
            rptMyOrder.DataBind();
            if(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                pnlMsg.Visible=false;
            }
            else
            {
                pnlMsg.Visible=true;
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

    protected void rptMyOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item ||
     e.Item.ItemType == ListItemType.AlternatingItem)
        {

            var image = (HtmlImage)e.Item.FindControl("imgprod");
            var pid = (Label)e.Item.FindControl("lblpid");
            var cartid = (Label)e.Item.FindControl("lblCartId");
            
            DataSet ds = obj.GetProductImage(pid.Text);
            
            image.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);

        }
    }

    protected void btnCancelOrder_Command(object sender, CommandEventArgs e)
    {
        new DB().cancelOrder(Convert.ToInt32(e.CommandArgument));
        string[] usersid = Session["loginid"].ToString().Split(',');
        load_myorderList(usersid[0]);

    }

  

    protected void btnReturn_Command(object sender, CommandEventArgs e)
    {
        new DB().cancelOrder(Convert.ToInt32(e.CommandArgument),6);
        string[] usersid = Session["loginid"].ToString().Split(',');
        load_myorderList(usersid[0]);
    }
}