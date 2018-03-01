using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logistic_LogisticDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if(Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                
            }
            else
            {
                Response.Redirect("~/PanelLogin.aspx?mode=L");
            }
        
    }
}