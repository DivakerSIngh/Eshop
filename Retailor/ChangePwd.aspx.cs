using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Retailor_ChangePwd : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["loginid"] = "R98761004";
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {

            }
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
        }

    }
    protected void btnLogSubmit_Click(object sender, EventArgs e)
    {
        if (txtNewPwd.Text.Trim() != "" && txtCNewPwd.Text.Trim() != "" && txtOldPwd.Text.Trim() != "")
        {
            if (txtCNewPwd.Text == txtNewPwd.Text)
            {
                try
                {
                    obj = new DB();
                    string s = obj.ChangeRetailerPwd(txtOldPwd.Text, txtNewPwd.Text, Session["loginid"].ToString());
                    if (s == "1")
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Password changed Successfully !');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Failed to change Password !');", true);
                    }
                }
                catch (Exception ex)
                { }
                finally
                {
                    obj = null;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('New Password Mismatch !');", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Fill all mandatory fields !');", true);
        }
    }
    protected void btnLogCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("RetailorDashboard.aspx");
    }
    protected void btnLogReset_Click(object sender, EventArgs e)
    {
        txtCNewPwd.Text = "";
        txtNewPwd.Text = "";
        txtOldPwd.Text = "";
    }
}