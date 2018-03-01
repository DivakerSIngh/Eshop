 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class AddLogistic : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new DB();
        if(!IsPostBack)
        {
            if (Session["uid"] != null)
            {

                obj.EmpId = Session["uid"].ToString();
                if (Session["Lid"] != null)
                {
                    obj.logLId = Session["Lid"].ToString();
                    btnLogSubmit.Text = "Update";
                    load_data_to_update();
                }
                else
                {
                    btnLogSubmit.Text = "Submit";
                    clear_all_fields();
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
        DataSet ds = obj.fillDataSet("select title,laddress,lmobile1,lemailaddress1,ldescription,pincodelist from logisticinfo where LId="+obj.logLId);
        if(ds.Tables[0].Rows.Count > 0)
        {
            txtEmail.Text = ds.Tables[0].Rows[0][3].ToString();
            txtLAddress.Text = ds.Tables[0].Rows[0][1].ToString();
            txtLDescription.Text = ds.Tables[0].Rows[0][4].ToString();
            txtLMob.Text = ds.Tables[0].Rows[0][2].ToString();
            txtLTitle.Text = ds.Tables[0].Rows[0][0].ToString();
            string s=ds.Tables[0].Rows[0][5].ToString();
            string[] pincode = s.Split(',');
            lbPincodeList.Items.Clear();
            foreach (string pin in pincode)
            {
                lbPincodeList.Items.Add(pin);
            }
        }
    }
    protected void btnPincodeShift_Click(object sender, EventArgs e)
    {
        if(txtLPincode.Text.Trim() != "")
        {
            lbPincodeList.Items.Add(txtLPincode.Text);
            txtLPincode.Text = "";
        }
    }

    protected void btnRemovePincode_Click(object sender, EventArgs e)
    {
        try
        {
            if (lbPincodeList.SelectedItem.Text != "")
            {
                lbPincodeList.Items.RemoveAt(lbPincodeList.Items.IndexOf(lbPincodeList.SelectedItem));
                txtLPincode.Text = "";
            }
        }
        catch(Exception ex)
        { }
    }
    protected void btnLogCancel_Click(object sender, EventArgs e)
    {
        clear_all_fields();
        btnLogSubmit.Text = "Submit";
        Response.Redirect("AdminPage.aspx");
    }
    private void clear_all_fields()
    {
        txtEmail.Text = "";
        txtLAddress.Text = "";
        txtLDescription.Text = "";
        txtLMob.Text = "";
        txtLPincode.Text = "";
        txtLTitle.Text = "";
        lbPincodeList.Items.Clear();
    }

    protected void btnLogReset_Click(object sender, EventArgs e)
    {
        clear_all_fields();
        btnLogSubmit.Text = "Submit";
    }
    protected void btnLogSubmit_Click(object sender, EventArgs e)
    {
        if(txtEmail.Text.Trim() != "" && txtLAddress.Text.Trim() != "" && txtLMob.Text.Trim() != "" && txtLTitle.Text.Trim() !="" && lbPincodeList.Items.Count > 0)
        {
            string listitem = "";
            for(int i=0;i<lbPincodeList.Items.Count;i++)
            {
                listitem += lbPincodeList.Items[i].ToString() + ",";
            }

            DB obj = new DB();
            obj.logaddress = txtLAddress.Text;
            obj.logdescription = txtLDescription.Text;
            obj.logemail = txtEmail.Text;
            obj.logmobile = txtLMob.Text;
            obj.logpincodelist = listitem.Substring(0,listitem.Length-1);
            obj.logtitle = txtLTitle.Text;
            obj.EmpId = Session["uid"].ToString();
            int s = 0;
            if(btnLogSubmit.Text == "Submit")
            { 
            s=obj.AddNewLogistic();
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
                obj.logLId = Session["Lid"].ToString();
                s = obj.UpdateLogistic();
                if (s > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updation Done Successfully !')", true);
                    clear_all_fields();
                    btnLogSubmit.Text = "Submit";
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updation not done successfully !')", true);
                }
            }
            
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill all mandatory fields !')", true);
        }
    }
}