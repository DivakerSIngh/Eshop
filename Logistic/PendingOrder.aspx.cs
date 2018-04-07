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
    

      
}