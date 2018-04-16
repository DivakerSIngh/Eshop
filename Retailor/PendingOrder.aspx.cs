using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Retailor_PendingOrder : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        hdnUserId.Value= Convert.ToString(Session["loginid"]);
        hdnTrack.Value = Convert.ToString(Request.QueryString["type"]);
    }
    

    [WebMethod]
    public static string updateStatus(string cartId,string lid, string lemailId, string lMobile, string orderId,string address,string productName)
    {
        var list = DB.updateStatus(Convert.ToInt32(cartId), (int)Status.ReadyToDispatch);
        string msg = "One product "+ productName +" has ready to shipped please collect this order from your retailer. your order id ="+ orderId + ", and address ="+address+"";
        new DB().SendMessage(lMobile, msg);
        new DB().SendEmail(lemailId, msg, "New order from Retailer to collect");
        return "Ok";
    }
    [WebMethod]
    public static List<Retailer> getAllOrderList(string id,int action,string fromdate,string todate,string status)
    {
      // var id= HttpContext.Current.Session["loginid"].ToString();
        var list= DB.getAllOrderListForReatiler(id, 1, fromdate, todate,Convert.ToInt16(status));
        JavaScriptSerializer searialize = new JavaScriptSerializer();
        var json =searialize.Serialize(list);
        return list;
    }
}