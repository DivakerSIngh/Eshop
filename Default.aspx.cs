 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class _Default : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        if(!IsPostBack)
        {
            //obj = new DB();
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                //obj.EmpId = Session["uid"].ToString();
                //obj.UserSessionId = Session["sessionid"].ToString();
                //if (Request.QueryString["paymode"] != null && Request.QueryString["paymode"].ToString() == "disguard")
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Network Error Occured Please Try Again Later!!')", true);
                //}
                ((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Logout";
                ((LinkButton)Master.FindControl("btnMyOrder")).Visible = true;
            }
            else
            {
                ((LinkButton)Master.FindControl("btnMyOrder")).Visible = false;
                ((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Login";
               // Response.Redirect("Login.aspx");
            }
        }
    }
}