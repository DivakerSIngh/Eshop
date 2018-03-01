using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Admin_ViewEmployeeList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            obj = new DB();
            load_gv();
        }
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=A");
        }
    }

    private void load_gv()
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetEmpLoginDetails();
            if(ds.Tables[0].Rows.Count > 0)
            {
                gv_EmpList.DataSource = ds.Tables[0];
                gv_EmpList.DataBind();
            }
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "f()", true);
        }
    }
    protected void LinkButtonProd_Command(object sender, CommandEventArgs e)
    {
        try
        {
            string empid = e.CommandArgument.ToString();
            Response.Redirect("CreateEmp.aspx?type=U&empid="+empid);
        }
        catch(Exception ex)
        {

        }
    }
    protected void LinkButtonProdDelete_Command(object sender, CommandEventArgs e)
    {
        obj = new DB();
        try
        {
            string empid = e.CommandArgument.ToString();
            int i = obj.DeleteEmployeeInfo(empid);
                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Employee Deleted Successfully !');", true);
                    load_gv();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Error Occured Info cannot be deleted try later !');", true);
                }
           
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('" + ex.Message + "');", true);
        }
        finally
        {
            obj = null;
        }
    }
}