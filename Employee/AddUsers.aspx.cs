using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_AddUsers : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "" && Session["mode"].ToString() == "E")
        {
            if (!IsPostBack)
            {

            }
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=E");
        }
      
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtMobile.Text.Trim() != "")
            {
                obj = new DB();
                string pwd = obj.CreatePassword();
                string mob = txtMobile.Text;
                int i = obj.CreateUserInfo(mob, pwd, Session["loginid"].ToString());
                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Login Password Created Successfully !');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Login Password cannot be created try later !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please enter mobile number !');", true);
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }



}