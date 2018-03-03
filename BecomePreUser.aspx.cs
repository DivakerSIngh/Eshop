using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Retailor_BecomePreUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnPremium_Click(object sender, EventArgs e)
    {
        string[] str = Session["loginid"].ToString().Split(',');
        Session["loginid"] = str[0] + ",,Premium";
        Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
    }
}