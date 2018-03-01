using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class WishList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if(!IsPostBack)
            {
                string[] str = Session["loginid"].ToString().Split(',');
                load_wishlist(str[0]);
            }
        }
        else
        {
            Server.Transfer("Login.aspx");
        }
    }

    private void load_wishlist(string userid)
    {

        try
        {
            obj = new DB();
            DataSet ds = obj.GetWishlistProd(userid);
            if(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                pnlMsg.Visible = false;
                rptWishList.DataSource = ds.Tables[0];
                rptWishList.DataBind();
            }
            else
            {
                pnlMsg.Visible = true;
                lblMessage.Text = "No items in the wishlist added.";
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

    protected void btnAddCart_Command(object sender, CommandEventArgs e)
    {
        try
        {
            obj = new DB();
            string wid = e.CommandArgument.ToString();
            string[] str = Session["loginid"].ToString().Split(',');
            DataSet ds = obj.GetWishlistInfo(wid);

            int i = obj.AddNewCartProdInfo(ds.Tables[0].Rows[0]["prodid"].ToString(), str[0], ds.Tables[0].Rows[0]["RId"].ToString(), ds.Tables[0].Rows[0]["amount"].ToString(), ds.Tables[0].Rows[0]["Size"].ToString());
            if (i > 0)
            {
                int j = obj.RemoveProdfromWishlist(wid);
                if (j > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Product moved to cart Successfully !');", true);
                    Response.Redirect("WishList.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Server Error occurred cannot remove product try later !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Server Error occurred cannot remove product try later !');", true);
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
    protected void btnRemove_Command(object sender, CommandEventArgs e)
    {
        try
        {
            obj = new DB();
            string wid = e.CommandArgument.ToString();
            string[] str = Session["loginid"].ToString().Split(',');
            int i = obj.RemoveProdfromWishlist(wid);
                if(i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Item Removed Successfully !');", true);
                    load_wishlist(str[0]);
                }
            else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Server Error occurred cannot remove item try later !');", true);
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
    protected void rptWishList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item ||
            e.Item.ItemType == ListItemType.AlternatingItem)
        {

            var image = (HtmlImage)e.Item.FindControl("imgprod");
            var pid = (Label)e.Item.FindControl("lblpid");
            //var cartid = (Label)e.Item.FindControl("lblwishlistId");
            //var qty = (TextBox)e.Item.FindControl("txtQuantity");
            DataSet ds = obj.GetProductImage(pid.Text);
            //DataSet dss = obj.GetCartProdQty(cartid.Text);
            //qty.Text = dss.Tables[0].Rows[0]["quantity"].ToString();

            image.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);

        }
    }
    protected void btnContinueShopping_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/ViewProducts.aspx?cid=1");
    }
}