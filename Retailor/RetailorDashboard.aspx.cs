using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Retailor_RetailorDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        hdnUserId.Value = Convert.ToString(Session["loginid"]);
        lblPendingOrder.Text = Convert.ToString(getPendingOrder());
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
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
}