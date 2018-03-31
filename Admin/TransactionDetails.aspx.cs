using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_TransactionDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindRetailer();
        if (!IsPostBack)
        {
            pnlRetailer.Visible = true;
            pnlLogistic.Visible = false;
        }else
        {
            var type = Convert.ToInt32(Request.QueryString["type"]);
            if (type == 1)
            {
                pnlRetailer.Visible = true;
                pnlLogistic.Visible = false;
                hdnType.Value = "1";
            }
            else
            {
                pnlRetailer.Visible = false;
                pnlLogistic.Visible = true;
                hdnType.Value = "2";
            }
        }
    }

    [WebMethod]
    public static List<Retailer> getPaymentDetail(string id, int action, string fromdate, string todate, string status)
    {
        var list = DB.getPaymentStatus(id, action, fromdate, todate, Convert.ToInt16(status));
        return list;
    }
    private void bindRetailer()
    {
        DB obj = new DB();
        var lst = obj.bindRetailer();
        ddlRetailer.DataSource = lst;
        ddlRetailer.DataValueField = "USERID";
        ddlRetailer.DataTextField = "USER_NAME";
        ddlRetailer.DataBind();

    }
}