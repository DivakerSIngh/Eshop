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
        var db = new  DB();
        db.cancelOrder(Convert.ToInt32(e.CommandArgument.ToString().Split('~')[0]),7,1);
        string[] usersid = Session["loginid"].ToString().Split(',');

       var logisticDetails= db.GetLogisticEmailndMobileInfo(e.CommandArgument.ToString().Split('~')[1]);
        var retailerDetails = db.GetReatilerEmailndMobileInfo(e.CommandArgument.ToString().Split('~')[0]);
        var userId = usersid[0];
        var productId = e.CommandArgument.ToString().Split('~')[3];
        var productName = e.CommandArgument.ToString().Split('~')[2];
        var msg = "Product has beeen canceled by the user: description userId:" + userId + ", productId:" + productId + ", productName:" + productName + "";
        
        if (logisticDetails.Tables.Count > 0)
        {
           
            var logistcicMobile = logisticDetails.Tables[0].Rows[0]["mobile"].ToString();
            var logisticEmail = logisticDetails.Tables[0].Rows[0]["LEmailAddress1"].ToString();
             db.SendMessage(logistcicMobile, msg);
        }


        if (retailerDetails.Tables.Count > 0)
        {
            var ratailerMobile = retailerDetails.Tables[0].Rows[0]["mobile"].ToString();
            var email = retailerDetails.Tables[0].Rows[0]["org_email"].ToString();
            db.SendMessage(ratailerMobile, msg);
        }

        load_myorderList(usersid[0]);

    }

  

    protected void btnReturn_Command(object sender, CommandEventArgs e)
    {
        var db = new DB();
        db.cancelOrder(Convert.ToInt32(e.CommandArgument.ToString().Split('~')[0]), 1,2);
        string[] usersid = Session["loginid"].ToString().Split(',');

        var logisticDetails = db.GetLogisticEmailndMobileInfo(e.CommandArgument.ToString().Split('~')[1]);
        var retailerDetails = db.GetReatilerEmailndMobileInfo(e.CommandArgument.ToString().Split('~')[0]);
        var userId = usersid[0];
        var productId = e.CommandArgument.ToString().Split('~')[3];
        var productName = e.CommandArgument.ToString().Split('~')[2];
        var msg = "User has requested to returend the product against the user: description userId:" + userId + ", productId:" + productId + ", productName:" + productName + "";
        if (logisticDetails.Tables.Count > 0)
        {

            var logistcicMobile = logisticDetails.Tables[0].Rows[0]["mobile"].ToString();
            var logisticEmail = logisticDetails.Tables[0].Rows[0]["LEmailAddress1"].ToString();
            db.SendMessage(logistcicMobile, msg);
        }


        if (retailerDetails.Tables.Count > 0)
        {
            var ratailerMobile = retailerDetails.Tables[0].Rows[0]["mobile"].ToString();
            var email = retailerDetails.Tables[0].Rows[0]["org_email"].ToString();
            db.SendMessage(ratailerMobile, msg);
        }
        load_myorderList(usersid[0]);
    }
}