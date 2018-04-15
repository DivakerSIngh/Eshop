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
            var type = Convert.ToInt32(Request.QueryString["type"]);
            if (type == 1)
            {
                pnlPassbook.Visible = false;
                pnlPayment.Visible = false;
                pnlOrderTracking.Visible = true;
                hdnType.Value = "1";
                pnlChart.Visible = false;
            }else
            {
                pnlPassbook.Visible = false;
                pnlPayment.Visible = false;
                pnlOrderTracking.Visible = false;
                pnlChart.Visible = true;
            }
           
         

            hdnUserId.Value = Convert.ToString(Session["loginid"]);
            //lblPendingOrder.Text = Convert.ToString(getPendingOrder());
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                if (Request.QueryString["flag"] != null)
                {
                    if (Request.QueryString["flag"].ToString().ToLower() == "ts")
                    {
                        if (Session["Retailor_Payment"] != null)
                        {
                            sendGiftVoucher_Method();
                            Session["Retailor_Payment"] = null;
                        }
                        else
                        {
                            Response.Redirect("RetailorDashboard.aspx");
                        }
                        
                    }
                    else if(Request.QueryString["flag"].ToString().ToLower() == "tf")
                    {
                        if (Session["Retailor_Payment"] == null)
                        {
                            Response.Redirect("RetailorDashboard.aspx");
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("~/PanelLogin.aspx?mode=R");
            }
        }else
        {
            var type =Convert.ToInt32(Request.QueryString["type"]);
            switch (type)
            {
              
                case 1:
                     pnlPassbook.Visible = false;
                    pnlPayment.Visible = false;
                    pnlOrderTracking.Visible = true;
                    hdnType.Value = "1";
                    pnlChart.Visible = false;
                    break;
                case 2:
                    pnlPassbook.Visible = false;
                    pnlPayment.Visible = true;
                    pnlOrderTracking.Visible = false;
                    pnlChart.Visible = false;
                    hdnType.Value = "2";
                    break;
                case 3:
                    pnlPassbook.Visible = true;
                    pnlPayment.Visible = false;
                    pnlOrderTracking.Visible = false;
                    pnlChart.Visible = false;
                    hdnType.Value = "3";
                    break;

               

            }
            
        }
       
    }
    [WebMethod]
    public static List<Retailer> getAllOrderList(string id, int action, string fromdate, string todate, string status)
    {
        // var id= HttpContext.Current.Session["loginid"].ToString();
        var list = DB.getAllOrderListForReatiler(id, action, fromdate, todate,Convert.ToInt16(status));
        JavaScriptSerializer searialize = new JavaScriptSerializer();
        var json = searialize.Serialize(list);
        return list;
    }
    [WebMethod]
    public static List<Retailer> getRetailerPaymentStatus(string id, int action)
    {
        return DB.getRetalerPaymentStatus(id, action);
    }
    [WebMethod]
    public static List<Retailer> getRetalerPassbook(string id, int action)
    {
        return DB.getRetalerPassbook(id, action);
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

    protected void btnOrderTacking_Click(object sender, EventArgs e)
    {
        Response.Redirect("RetailorDashboard.aspx?type=1");
    }

    protected void btnPayment_Click(object sender, EventArgs e)
    {
        Response.Redirect("RetailorDashboard.aspx?type=2");
    }

    protected void btnPassbook_Click(object sender, EventArgs e)
    {
        Response.Redirect("RetailorDashboard.aspx?type=3");
    }
}