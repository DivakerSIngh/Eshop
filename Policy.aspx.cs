using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Policy : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new DB();
        if (!IsPostBack)
        {
            if (Session["uid"] != null && Session["sessionid"] != null)
            {

                obj.EmpId = Session["uid"].ToString();
                //Session["sessionid"] = obj.LoginSession(Session["uid"].ToString());
                obj.UserSessionId = Session["sessionid"].ToString();
                //int i = obj.GetCartCount();
                //((Label)Master.FindControl("lblcountcart")).Text = (i).ToString();
                //((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Logout";
            }
            else
            {
                //Response.Redirect("Login.aspx");

            }
        }
    }
}