using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Retailor_RetailorPanel : System.Web.UI.MasterPage
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (Convert.ToString(Session["userType"]).ToUpper() == "Free".ToUpper())
            {
                btnPremium.Visible = true;
            }else
            {
                btnPremium.Visible = false;
            }
            if (!IsPostBack)
            {
                obj = new DB();
                DataSet ds = obj.CheckRetailerInfoCompleteness(Session["loginid"].ToString());
                if(ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0][0].ToString() != "")
                {
                    btnAddImage.Enabled = true;
                    btnAddProduct.Enabled = true;
                    btnProdList.Enabled = true;
                    btnAddRetailer.Enabled = false;
                }
                else
                {
                    btnAddImage.Enabled = false;
                    btnAddProduct.Enabled = false;
                    btnProdList.Enabled = false;
                    btnAddRetailer.Enabled = true;
                }
                string[] str = Session["loginid"].ToString().Split(',');
                DataSet dspre = obj.fillDataSet("select RegistrationType from retailer_logininfo where userid='"+str[0]+"'");
                //if(dspre.Tables[0].Rows[0][0].ToString() == "free")
                //{
                //    btnPremium.Enabled = true;
                //}
                //else
                //{
                //    btnPremium.Enabled = false;
                //}

            }
        }
    }
    protected void btnViewRetailer_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewRetailorList.aspx");
    }
    protected void btnAddRetailer_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddRetailorInfo.aspx");
    }
    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProduct.aspx");
    }
    protected void btnAddImage_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProductImage.aspx");
    }
    protected void btnProdList_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductList.aspx");
    }
    protected void lbtnRLogout_Click(object sender, EventArgs e)
    {
        Session["loginid"] = null;
        Response.Redirect("../SelectLoginMode.aspx?mode=R");
    }
    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangeRPwd.aspx");
    }
    protected void btnPremium_Click(object sender, EventArgs e)
    {
        Response.Redirect("BecomePreUser.aspx");
    }

   
}
