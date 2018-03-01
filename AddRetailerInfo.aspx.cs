using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class AddRetailerInfo : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {

         obj = new DB();
         if (!IsPostBack)
         {
             clear_all_fields();
             if (Session["uid"] != null)
             {

                 obj.EmpId = Session["uid"].ToString();
                 if (Session["Rid"] != null)
                 {
                     obj.RetId = Session["Rid"].ToString();
                     btnRetSubmit.Text = "Update";
                     load_data_to_update();
                 }
                 else
                 {
                     btnRetSubmit.Text = "Submit";

                 }

                 if (Session["uname"] != null && Session["uname"].ToString() != "")
                 {
                     lblname.Text = Session["uname"].ToString();
                 }

             }
             else
             {
                 Response.Redirect("Login.aspx");
             }
         }
        
    }

    private void load_data_to_update()
    {
        DataSet ds = obj.fillDataSet("select rname,rmobile1,remail1,rdescription,raddress from retailerinfo where rid=" + obj.RetId);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtREmail.Text = ds.Tables[0].Rows[0][2].ToString();
            txtRAddress.Text = ds.Tables[0].Rows[0][4].ToString();
            txtRDescription.Text = ds.Tables[0].Rows[0][3].ToString();
            txtRMob.Text = ds.Tables[0].Rows[0][1].ToString();
            txtRName.Text = ds.Tables[0].Rows[0][0].ToString();
            
        }
    }


    private void clear_all_fields()
    {
        txtRAddress.Text = "";
        txtRDescription.Text = "";
        txtREmail.Text = "";
        txtRMob.Text = "";
        txtRName.Text = "";
    }

    protected void btnRetSubmit_Click(object sender, EventArgs e)
    {
        if(txtRAddress.Text.Trim() != "" && txtREmail.Text.Trim() != "" && txtRMob.Text.Trim() != "" && txtRName.Text.Trim() != "")
        {
            DB obj = new DB();
            obj.RetAddress = txtRAddress.Text;
            obj.RetDescription = txtRDescription.Text;
            obj.RetEmail = txtREmail.Text;
            obj.RetMobile = txtRMob.Text;
            obj.RetName = txtRName.Text;
            obj.EmpId = Session["uid"].ToString();
            int s = 0;
            if (btnRetSubmit.Text == "Submit")
            {
                s = obj.AddNewRetailerInfo();
                if (s > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Added Successfully !')", true);
                    clear_all_fields();

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record not added successfully !')", true);
                }
            }
            else
            {
                obj.RetId = Session["Rid"].ToString();
                s = obj.UpdateRetailerInfo();
                if (s > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updation Done Successfully !')", true);
                    clear_all_fields();
                    btnRetSubmit.Text = "Submit";
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updation not done successfully !')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Kindly Fill Mandatory All Fields  !')", true);
        }
    }
    protected void btnRetCancel_Click(object sender, EventArgs e)
    {
        clear_all_fields();
        btnRetSubmit.Text = "Submit";
        Response.Redirect("AdminPage.aspx");
    }
    protected void btnRetReset_Click(object sender, EventArgs e)
    {
        clear_all_fields();
        btnRetSubmit.Text = "Submit";
    }
}