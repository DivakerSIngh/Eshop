using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class homeMasterPage : System.Web.UI.MasterPage
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            obj = new DB();
            string[] str = Session["loginid"].ToString().Split(',');
            int count = obj.GetCartCount(str[0]);
            lblcountcart.Text = count.ToString();
            lnkbtnLogin.Text = "Logout";
            
            btnUserName.Visible = true;
            DataSet ds = obj.GetUserTypeAndBalance(str[0]);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                btnUserName.Text = "Welcome, " + ds.Tables[0].Rows[0]["Name"].ToString();
            btnUserName.Enabled = false;
        }
        else
        {
            
            btnUserName.Visible = false;
            btnUserName.Enabled = false;
        }

    }
    protected void lnkbtnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (lnkbtnLogin.Text == "Logout")
            {
                // obj = new DB();

                //obj.LogoutSession(Session["sessionid"].ToString());
                ////((Label)Master.FindControl("lblcountcart")).Text = "0";
                Session["loginid"] = null;

                lblcountcart.Text = "0";
                btnSignUp.Visible = true;
                btnMyOrder.Visible = false;
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
                btnSignUp.Visible = true;
                btnMyOrder.Visible = false;
            }
        }
        catch (Exception ex)
        { }
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if (txtSearch.Value.Trim() != "")
            Response.Redirect("ViewProducts.aspx?search=" + txtSearch.Value);
    }
    protected void btnCart_Click(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            Server.Transfer("CartInfo.aspx");
        }
        else
        {
            Server.Transfer("Login.aspx");
        }
        //if ((Session["uid"] != null && Session["uid"].ToString() != "") && (Session["sessionid"] != null && Session["sessionid"].ToString() != ""))
        //{
        //    Response.Redirect("CartProducts.aspx");
        //}
        //else
        //{
        //    Response.Redirect("Login.aspx?cartlist=213");
        //    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect user name or password !')", true);
        //}
    }
    protected void btnSearch_Click1(object sender, EventArgs e)
    {
        if (txtSearch.Value.Trim() != "")
            Response.Redirect("ViewProducts.aspx?search=" + txtSearch.Value);
    }
    protected void btnsubscribe_Click(object sender, EventArgs e)
    {

    }
    protected void lbtnWallet_Click(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            Response.Redirect("UserWallet.aspx");
        }
        else
        {
            Server.Transfer("Login.aspx");
        }
    }
    protected void btnMyOrder_Click(object sender, EventArgs e)
    {
            Response.Redirect("MyOrder.aspx");
        
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
          Server.Transfer("UserProfile.aspx");
        //this method is for user profile
    }
    protected void lbtnPwd_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("UserProfile.aspx");

        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }
    protected void btnWishlist_Click(object sender, EventArgs e)
    {
        Response.Redirect("WishList.aspx");
    }
}
