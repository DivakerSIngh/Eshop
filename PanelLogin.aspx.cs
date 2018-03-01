using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PanelLogin : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtMob.Attributes.Add("placeholder", "Username");

        if (!IsPostBack)
        {
            lblType.Text = "Login to your account";
            if (Request.QueryString["mode"] != null && Request.QueryString["mode"] != "" && Request.QueryString["mode"].ToString() != "")
            {
                if (Request.QueryString["mode"].ToString() == "R")
                    pnlRetailer.Visible = true;
                else
                    pnlRetailer.Visible = false;
            }
            else
            {
                Response.Redirect("SelectLoginMode.aspx");
            }
        }
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["mode"] != "" && Request.QueryString["mode"].ToString() != "")
            {
                var response = new Dictionary<string, string>();
                obj = new DB();
                if (btnLogin.Text == "Login")
                {
                    string mode = Request.QueryString["mode"].ToString();

                    if (txtMob.Value.Trim() != "" && txtPwd.Value.Trim() != "")
                    {

                        response = obj.VerifyLoginInfo(txtMob.Value, txtPwd.Value, mode);
                        if (response.Count>0)
                        {
                            Session["loginid"] = response["loginid"];
                            Session["userType"] = response["userType"];
                           
                            Session["mode"] = mode;
                            if (mode == "L")
                            {
                                Response.Redirect("~/Logistic/LogisticDashboard.aspx", false);
                            }
                            else
                                if (mode == "R")
                                {
                                    Response.Redirect("~/Retailor/RetailorDashboard.aspx", false);
                                }
                                else
                                    if (mode == "E")
                                    {
                                        Response.Redirect("~/Employee/EmployeeDashboard.aspx", false);
                                    }
                                    else
                                        if (mode == "A")
                                        {
                                            Response.Redirect("~/Admin/SAdminDashboard.aspx", false);
                                        }

                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Incorrect username or password !');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please Fill all mandatory fields !');", true);
                    }
                }
                else
                    if (txtMob.Value.Trim() != "" && btnLogin.Text == "Send OTP")
                    {
                        string mode = Request.QueryString["mode"].ToString();
                        DataSet ds = obj.CheckMobileNumDuplicacy(txtMob.Value, mode);
                        if (ds.Tables[0].Rows.Count == 0 && mode != "A")
                        {
                            string otp = obj.GenerateOTP();
                            Session["OTP"] = otp;
                            Session["Mobile"] = txtMob.Value;
                            txtMob.Value = "";
                            obj.SendOTP(Session["Mobile"].ToString(), otp);
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('OTP Send Successfully !');", true);
                            btnLogin.Text = "Verify OTP";
                            txtMob.Attributes.Add("placeholder", "Enter OTP");
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Mobile number already Registered !');", true);
                        }
                    }
                    else
                        if (txtMob.Value.Trim() != "" && btnLogin.Text == "Verify OTP" )
                        {
                            //if (txtMob.Value == Session["OTP"].ToString())
                            //{
                            //    if (Session["fpwd"] != null && Session["fpwd"].ToString() == "f")
                            //    {
                            //        btnLogin.Text = "Save New Password";
                            //        return;
                            //    }
                                txtMob.Value = "";
                                txtPwd.Value = "";
                                txtPwd.Visible = true;
                                btnLogin.Text = "Login";
                                Session["OTP"] = null;
                                btnRegister.Text = "Register";
                                string pwd = obj.CreatePassword();
                                string mob = Session["Mobile"].ToString();
                                if (Request.QueryString["mode"] != "" && Request.QueryString["mode"].ToString() != "")
                                {

                                    string mode = Request.QueryString["mode"].ToString();

                                    string logdetails = "";
                                    if (mode == "R")
                                    {
                                        logdetails = obj.CreateRetailorInfo(mob, pwd, null, "Self", "free");
                                    }
                                    else
                                        if (mode == "L")
                                        {
                                            logdetails = obj.CreateLogisticInfo(mob, pwd, null);
                                        }

                                    if (logdetails != "")
                                    {
                                        lblType.Text = "Login to your account";
                                        txtMob.Attributes.Add("placeholder", "Username");
                                        string[] user = logdetails.Split(',');
                                        string msg = "UserId : " + user[0] + " and Password : " + pwd;
                                        obj.SendMessage(Session["Mobile"].ToString(), msg);
                                    }
                                    Session["Mobile"] = null;
                                }
                                else
                                {
                                    Server.Transfer("SelectLoginMode.aspx");
                                }

                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('OTP Mismatched !');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please Fill all mandatory fields !');", true);
                        }
            
        }

        catch (Exception ex)
        {
            Server.Transfer("SelectLoginMode.aspx");
        }
        finally
        {
            obj = null;
        }

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (btnRegister.Text == "Register")
        {
            txtPwd.Visible = false;
            btnRegister.Text = "Resend OTP";
            btnLogin.Text = "Send OTP";
            txtMob.Attributes.Add("placeholder", "Mobile");
            lblType.Text = "Register to create new account";
        }
        else
        {
            //resend otp logic
            try
            {
                obj = new DB();
                string otp = obj.GenerateOTP();
                Session["OTP"] = otp;
                if (Session["Mobile"] != null && Session["Mobile"].ToString() != "")
                    obj.SendOTP(Session["Mobile"].ToString(), otp);
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
    protected void btnfPwd_Click(object sender, EventArgs e)
    {

        //txtPwd.Visible = false;
        //btnRegister.Text = "Resend OTP";
        //btnLogin.Text = "Send OTP";
        //txtMob.Attributes.Add("placeholder", "Mobile");
        //lblType.Text = "Reset account";
        //Session["fpwd"] = "f";



    }
}