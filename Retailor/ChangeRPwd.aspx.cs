using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Retailor_ChangeRPwd : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
        }
    }
    

    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            if (txtOldPwd.Text.Trim() != "" && txtNewPwd.Text.Trim() != "")
            {
                string[] str = Session["loginid"].ToString().Split(',');
                DataSet ds = obj.GetRetailerPassword(str[0]);
                if (ds.Tables[0].Rows[0]["rpwd"].ToString() == txtOldPwd.Text)
                {
                    int i = obj.UpdateRetailerPassword(str[0], txtNewPwd.Text);
                    if (i > 0)
                    {
                        txtNewPwd.Text = "";
                        txtOldPwd.Text = "";
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Password updated successfully !');", true);
                        DataSet dsinfo = obj.GetInfo("select Mobile from retailer_logininfo where userid='"+str[0]+"'");
                        obj.SendMessage(dsinfo.Tables[0].Rows[0][0].ToString(),"Password Changed Successfully.");

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Password not updated try later !');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Incorrect Old Password !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('All Fields are mandatory !');", true);
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