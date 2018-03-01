    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class ViewPassbook : System.Web.UI.Page
{
    DB
        obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                string[] str=Session["loginid"].ToString().Split(',');
                load_passbook_data(str[0]);
                btnAddMoney.Visible = false;
                btnPassbook.Visible = false;
                btnPremiumUser.Visible = true;
                btnPremiumUser.Text = "Back to Wallet";
                btnReferEarn.Visible = false;
                btnTransfer.Visible = false;
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    private void load_passbook_data(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetUserPassbookInfo(userid);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                pnlPassbook.Visible = true;
                rptPassbookInfo.DataSource = ds.Tables[0];
                rptPassbookInfo.DataBind();
            }
            else
            {
                pnlPassbook.Visible = false;
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
    protected void btnPremiumUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserWallet.aspx");
    }
    protected void btnAddMoney_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserWallet.aspx");
    }
    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserWallet.aspx");
    }
    protected void btnReferEarn_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserWallet.aspx");
    }
    protected void btnPassbook_Click(object sender, EventArgs e)
    {

    }
}