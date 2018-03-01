using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WalletAccount : System.Web.UI.MasterPage
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                btnLogin.Text = "Logout";
                btnSignup.Visible = false;
                load_user_data();

            }

        }
    }

    private void load_user_data()
    {
        try
        {
            obj = new DB();
            string[] str = Session["loginid"].ToString().Split(',');
            DataSet ds = obj.GetUserInfo(str[0]);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                lblAmt.Text = ds.Tables[0].Rows[0]["Balance"].ToString();
                lblUserid.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
                lblUType.Text = ds.Tables[0].Rows[0]["UserType"].ToString();
                imgDP.Src = "~/SingleProductHandler.ashx?UserDp="+str[0];

            }


        }
        catch (Exception)
        {

        }
        finally
        {
            obj = null;
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Server.Transfer("Register.aspx");
    }
    protected void btnMyOrder_Click(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            Response.Redirect("MyOrder.aspx");
        }
        else
        {
            Server.Transfer("Login.aspx");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }
    protected void btnCart_Click(object sender, EventArgs e)
    {

    }
    protected void btnsubscribe_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["loginid"] = null;
        Response.Redirect("Login.aspx");
    }
    protected void btnPremiumUser_Click(object sender, EventArgs e)
    {

    }
    protected void btnAddMoney_Click(object sender, EventArgs e)
    {

    }
    protected void btnTransfer_Click(object sender, EventArgs e)
    {

    }
    protected void btnReferEarn_Click(object sender, EventArgs e)
    {


    }
    protected void btnPassbook_Click(object sender, EventArgs e)
    {

    }
    protected void lbtnWallet_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserWallet.aspx");
    }
}
