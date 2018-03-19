using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Retailor_RetailorDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            hdnUserId.Value = Convert.ToString(Session["loginid"]);
            lblPendingOrder.Text = Convert.ToString(getPendingOrder());
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                if (Request.QueryString["flag"] != null)
                {
                    if (Request.QueryString["flag"].ToString().ToLower() == "ts")
                    {
                        //sendGiftVoucher_Method();
                        //Response.Redirect("RetailorDashboard.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/PanelLogin.aspx?mode=R");
            }
        }
       
    }
    private int getPendingOrder()
    {
        return 12;
    }

    protected void lblPendingOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("PendingOrder.aspx?type=p");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("PendingOrder.aspx?type=t");
    }
    [WebMethod]
    public static List<SalesReprot> getSaleReport(string year, string id, int action)
    {
        var list = DB.saleReport(id, year, action);
        JavaScriptSerializer searialize = new JavaScriptSerializer();
        var json = searialize.Serialize(list);
        return list;
    }

    protected void lnkbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("PendingOrder.aspx?type=p");
    }

    protected void lnkPendingOrders_Click(object sender, EventArgs e)
    {
        Response.Redirect("PendingOrder.aspx?type=p");
    }

    protected void lnkpaymentHistory_Click(object sender, EventArgs e)
    {

    }

    private void sendGiftVoucher_Method()
    {
        try
        {
            DB obj = new DB();
            string[] user = Session["loginid"].ToString().Split(',');
            if (user[0].StartsWith("R"))
            {

                string cardId = obj.CouponAssignPreUser(user[0]);
                if (!string.IsNullOrEmpty(cardId))
                {
                    DataSet ds = new DataSet();
                    ds = obj.GetRetailerList(user[0]);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        // send mail to inform gift voucher given
                        string name = ds.Tables[0].Rows[0]["Org_Name"].ToString();
                        string msg = obj.createEmailBodyforPremiumCard(cardId, name);
                        if (!string.IsNullOrEmpty(msg))
                        {
                            obj.SendEmail(ds.Tables[0].Rows[0]["Org_Email"].ToString(), msg, "Premium Gift Voucher from Team Villagers");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('" + ex.Message + "');", true);
        }
    }
    protected void sendGiftVoucher_Click(object sender, EventArgs e)
    {
        try
        {
            DB obj = new DB();
            string[] user = Session["loginid"].ToString().Split(',');
            if (user[0].StartsWith("R"))
            {

                string cardId = obj.CouponAssignPreUser(user[0]);
                if (!string.IsNullOrEmpty(cardId))
                {
                    DataSet ds = new DataSet();
                    ds = obj.GetRetailerList(user[0]);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        // send mail to inform gift voucher given
                        string name = ds.Tables[0].Rows[0]["Org_Name"].ToString();
                        string msg = obj.createEmailBodyforPremiumCard(cardId, name);
                        if (!string.IsNullOrEmpty(msg))
                        {
                            obj.SendEmail(ds.Tables[0].Rows[0]["Org_Email"].ToString(), msg, "Premium Gift Voucher from Team Villagers");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('" + ex.Message + "');", true);
        }
    }
}