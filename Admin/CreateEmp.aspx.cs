using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_CreateEmp : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
               
                if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString() == "U")
                {
                    load_EmpInfo();
                    btnSave.Text = "Update";
                }
                else
                {
                    clear_all_fields();
                    btnSave.Text = "Save";
                }
            }
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=A");
        }
    }

    private void load_EmpInfo()
    {
        try
        {
            obj = new DB();
            string empid = Request.QueryString["empid"].ToString();
            DataSet ds = obj.GetEmpLoginDetails(empid);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtAddress.Text = ds.Tables[0].Rows[0]["EmpEmailId"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["EmpAddress"].ToString();
                txtMob.Text = ds.Tables[0].Rows[0]["Euname"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["EmpName"].ToString();
                txtPwd.Text = ds.Tables[0].Rows[0]["EPwd"].ToString();
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

    private void clear_all_fields()
    {
        txtAddress.Text = "";
        txtEmail.Text = "";
        txtMob.Text = "";
        txtName.Text = "";
        txtPwd.Text = "";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            if (btnSave.Text == "Save")
            {
                if (txtMob.Text.Trim() != "" && txtPwd.Text.Trim() != "" && txtName.Text.Trim() != "" && txtAddress.Text.Trim() != "" && txtEmail.Text.Trim() != "")
                {
                int i = obj.AddEmployeeInfo(txtMob.Text, txtPwd.Text, txtName.Text, txtAddress.Text, txtEmail.Text);
                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Employee Created Successfully !');", true);
                    
                    clear_all_fields();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Error Occured Info cannot be saved try later !');", true);
                }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please Fill all mandatory fields !');", true);
                }
            }
            else
            {
                if (txtMob.Text.Trim() != "" && txtPwd.Text.Trim() != "" && txtName.Text.Trim() != "" && txtAddress.Text.Trim() != "" && txtEmail.Text.Trim() != "")
                {
                    string empid = Request.QueryString["empid"].ToString();
                    int i = 0;
                    if (empid != null)
                    {
                        i = obj.UpdateEmployeeInfo(txtMob.Text, txtPwd.Text, txtName.Text, txtAddress.Text, txtEmail.Text, empid);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Error Occured Info cannot be updated try later !');", true);

                        Server.Transfer("SAdminDashboard.aspx");
                        return;
                    }
                    if (i > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Employee Updated Successfully !');", true);

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Error Occured Info cannot be updated try later !');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please Fill all mandatory fields !');", true);
                }
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
    protected void btnProdReset_Click(object sender, EventArgs e)
    {
        
        clear_all_fields();
    }
    protected void btnProdCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("SAdminDashboard.aspx");
    }
  
}