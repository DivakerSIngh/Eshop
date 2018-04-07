using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logistic_LogisticDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlChart.Visible = true;
            pnlPassbook.Visible = false;
            pnlPayment.Visible = false;
            pnlOrderTracking.Visible = false;
        }
        else
        {
            var type = Convert.ToInt32(Request.QueryString["type"]);
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
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
            hdnUserId.Value = Convert.ToString(Session["loginid"]);
            hdnTrack.Value = Convert.ToString(Request.QueryString["type"]);

        }
            else
            {
                Response.Redirect("~/PanelLogin.aspx?mode=L");
            }
        
    }

    [WebMethod]
    public static List<Logistic> getAllOrderList(string id, int action, string fromdate, string todate, string status)
    {
        // var id= HttpContext.Current.Session["loginid"].ToString();
        var list = DB.getAllOrderListForLogistic(id, action,Convert.ToInt16(status));
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

    [WebMethod]
    public static List<SalesReprot> getSaleReport(string year, string id, int action)
    {
        var list = DB.saleReport(id, year, action);
        JavaScriptSerializer searialize = new JavaScriptSerializer();
        var json = searialize.Serialize(list);
        return list;
    }

    [WebMethod]
    public static string updateStatus(string cartId,string status)
    {
        var list = DB.updateStatus(Convert.ToInt32(cartId), Convert.ToInt32(status));
        return "Ok";
    }
   
}