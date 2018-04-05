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
    public static List<Retailer> getPaymentDetail(string id, int action, string fromdate, string todate, string status,string sortBy="1")
    {
        var list = DB.getPaymentStatus(id, action, fromdate, todate, Convert.ToInt16(status), sortBy);
        return list;
    }



    [WebMethod]
    public static int updatePaymentStatus(string Rid, string transaction_id, string RETAILOR_PAY_TRANSACTION_NO, string RETAILOR_PAY_DATE, string RETAILOR_PAY_AMOUNT, string RETAILOR_PAY_STATUS, string RETAILOR_PAY_MODE)
    {
        var status =new  DB().Update_Retailer_Payment(Rid, transaction_id, RETAILOR_PAY_TRANSACTION_NO, Convert.ToDateTime(RETAILOR_PAY_DATE), RETAILOR_PAY_AMOUNT, RETAILOR_PAY_STATUS, RETAILOR_PAY_MODE);
        return status;
    }
    [WebMethod]
    public static List<Retailer> bindRetailer(int id)
    {
        return new DB().bindRetailer();
    }
}