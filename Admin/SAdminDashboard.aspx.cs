using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.Services;

public partial class Admin_SAdminDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=A");
        }
    }

    //public DataTable getRecord()
    //{
    //    DataTable dt = new DataTable();
    //    var list=DB.saleReport('','',4);
    //}

    protected void btnRetailer_Click(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static List<SalesReprot> getSaleReportForRetailer(string year, int action)
    {
        var list = DB.saleReportAll(year, action);
        JavaScriptSerializer searialize = new JavaScriptSerializer();
        var json = searialize.Serialize(list);
        return list;
    }
}