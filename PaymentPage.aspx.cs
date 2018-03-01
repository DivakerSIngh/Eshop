using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaymentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSuccessful_Click(object sender, EventArgs e)
    {
        string s = Session["transactionid"].ToString();
        Response.Redirect("OrderSummary.aspx");
    }
    protected void btnFail_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("Default.aspx?paymode=disguard");
    }
}