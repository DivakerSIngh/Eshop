using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            }
            else
            {
                pnlRetailer.Visible = false;
                pnlLogistic.Visible = true;
            }
        }
    }
}