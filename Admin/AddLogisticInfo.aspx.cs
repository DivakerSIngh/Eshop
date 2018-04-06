using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Script.Serialization;
using System.Collections;
using System.Web.Services;

public partial class Logistic_AddLogisticInfo : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            hdnLoginId.Value = Convert.ToString(Session["loginid"]);
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString() == "U")
                {
                    btnLogSubmit.Text = "Update";
                    load_logistic_data();
                }
                else
                {
                    btnLogSubmit.Text = "Submit";
                }
            }  
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=L");
        }
    }


    private void load_logistic_data()
    {
        try
        {
            obj = new DB();
            string lid = Request.QueryString["lid"].ToString();
            if (lid != null && lid != "")
            {
                DataSet ds = obj.GetLogisticDetails(lid);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtEmail.Text = "";
                    txtLAddress.Text ="";
                    txtLDescription.Text = "";
                    txtLMob.Text ="";
                    txtLTitle.Text = "";
                    lbPincodeList.Items.Clear();
                    
                    txtEmail.Text = ds.Tables[0].Rows[0]["lemailaddress1"].ToString();
                    txtLAddress.Text = ds.Tables[0].Rows[0]["laddress"].ToString();
                    txtLDescription.Text = ds.Tables[0].Rows[0]["ldescription"].ToString();
                    txtLMob.Text = ds.Tables[0].Rows[0]["lmobile1"].ToString();
                    txtLTitle.Text = ds.Tables[0].Rows[0]["title"].ToString();
                    string s = ds.Tables[0].Rows[0]["pincodelist"].ToString();
                    string[] pincode = s.Split(',');
                    lbPincodeList.Items.Clear();
                    foreach (string pin in pincode)
                    {
                        lbPincodeList.Items.Add(pin);
                    }
                }
            }
            else
            {
                btnLogReset_Click(null, null);
            }
        }
        catch(Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }
    protected void btnLogSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtEmail.Text.Trim() != "" && txtLAddress.Text.Trim() != "" && txtLMob.Text.Trim() != "" && txtLTitle.Text.Trim() != "" && lbPincodeList.Items.Count > 0)
            {
                string listitem = "";
                for (int i = 0; i < lbPincodeList.Items.Count; i++)
                {
                    listitem += lbPincodeList.Items[i].ToString() + ",";
                }

                DB obj = new DB();
                obj.logaddress = txtLAddress.Text;
                obj.logdescription = txtLDescription.Text;
                obj.logemail = txtEmail.Text;
                obj.logmobile = txtLMob.Text;
                obj.logpincodelist = listitem.Substring(0, listitem.Length - 1);
                obj.logtitle = txtLTitle.Text;
                obj.EmpId = Session["loginid"].ToString();
                int s = 0;
                if (btnLogSubmit.Text == "Submit")
                {
                    s = obj.AddNewLogistic();
                    if (s > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Record Added Successfully !');", true);
                        btnLogReset_Click(null, null);

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Record not added successfully !');", true);
                    }
                }
                else
                {
                    obj.logLId = Request.QueryString["lid"].ToString();
                    s = obj.UpdateLogistic();
                    if (s > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Updation Done Successfully !');", true);
                        btnLogReset_Click(null, null);
                        btnLogSubmit.Text = "Submit";
                    }
                    else
                    {

                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Updation not done successfully !');", true);
                    }
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Fill all mandatory fields !');", true);
            }
        }
        catch(Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }
    protected void btnLogCancel_Click(object sender, EventArgs e)
    {
        btnLogSubmit.Text = "Submit";
        Server.Transfer("/Logistic/LogisticDashboard.aspx");
    }
    protected void btnLogReset_Click(object sender, EventArgs e)
    {
        txtEmail.Text = "";
        txtLAddress.Text = "";
        txtLDescription.Text = "";
        txtLMob.Text = "";
        txtLPincode.Text = "";
        txtLTitle.Text = "";
        lbPincodeList.Items.Clear();
    }
    protected void btnPincodeShift_Click(object sender, EventArgs e)
    {
        if (txtLPincode.Text.Trim() != "")
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
        catch (Exception ex)
        { }
    }


    [WebMethod]
    public static string addLogistic(string mobile, string loginId)
    {
        string pwd = DB.GeneratePassword();
        string logdetails = new DB().CreateLogisticInfo(mobile, pwd, loginId);
        return getLogistic();
    }

    [WebMethod]
    public static string updateLogistic(string mobile, string loginId)
    {
        var db = new DB();
        db.UpdateEmailLogistic(loginId, mobile);
        return getLogistic();
    }

    [WebMethod]
    public static string deleteLogistic(string mobile, string loginId)
    {
        var db = new DB();
        db.DeleteLogistic(loginId, mobile);
        return getLogistic();
    }


    [WebMethod]
    public static string getLogistic()
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        ArrayList objs = new ArrayList();
        con = new SqlConnection(DB.constr);
        cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandType = CommandType.StoredProcedure;

        cmd.CommandText = "Select * from Logistic_LoginInfo";
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();


        while (dr.Read())
        {
            objs.Add(new
            {
                UserId = dr["UserId"],
                Mobile = dr["Mobile"],
                LStatus = dr["LStatus"],
                Password = dr["LPwd"],

            });

        }

        var searialize = new JavaScriptSerializer();
        return searialize.Serialize(objs);
    }
}