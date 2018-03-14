 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class _Default : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            //obj = new DB();
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                //obj.EmpId = Session["uid"].ToString();
                //obj.UserSessionId = Session["sessionid"].ToString();
                //if (Request.QueryString["paymode"] != null && Request.QueryString["paymode"].ToString() == "disguard")
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Network Error Occured Please Try Again Later!!')", true);
                //}
                ((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Logout";
                ((LinkButton)Master.FindControl("btnMyOrder")).Visible = true;
            }
            else
            {
                ((LinkButton)Master.FindControl("btnMyOrder")).Visible = false;
                ((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Login";
                // Response.Redirect("Login.aspx");
            }
        }


    }

    protected void sendGiftVoucher_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            string[] user = Session["loginid"].ToString().Split(',');
            if(user[0].StartsWith("R"))
            {
                string gvid = "";
                for (int i = 0; i < 5; i++)
                {
                    gvid = gvid + "," + obj.FreeUserGiftVoucher(user[0], "Villagers100", "100");
                }
                if (gvid != "")
                {
                    DataSet ds = new DataSet();
                    ds = obj.GetRetailerList(user[0]);
                    if(ds.Tables[0].Rows.Count>0)
                    {
                        // send mail to inform gift voucher given
                        string cards = gvid.Remove(0, 1);
                        string msg = obj.createEmailBodyforPremiumCard(gvid, "INR 100 each");
                        if(!string.IsNullOrEmpty(msg))
                        {
                            obj.SendEmail(ds.Tables[0].Rows[0]["Org_Email"].ToString(), msg, "Premium Gift Voucher from Team Villagers");
                        }
                        
                    }
                    
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('" + ex.Message + "');", true);
        }
    }
}