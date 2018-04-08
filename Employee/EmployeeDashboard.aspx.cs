using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_EmployeeDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "" && Session["mode"].ToString() == "E")
        {

        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=E");
        }
    }

    [WebMethod]
    public static List<SalesReprot> getSaleReportForRetailer(string year, int action)
    {
        var list = DB.saleReportAll(year, action);
        JavaScriptSerializer searialize = new JavaScriptSerializer();
        var json = searialize.Serialize(list);
        return list;
    }

    [WebMethod]
    public static string getDashBoardBudgeCount()
    {
        var list = DB.getBudgeCount();
        var searialize = new JavaScriptSerializer();
        return searialize.Serialize(list);
    }
}