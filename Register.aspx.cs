using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        //btnRegisterInfo.OnClientClick = ClientScript.GetPostBackEventReference(btnRegisterInfo, "") + ";vali(this); this.value='Registering...';this.disabled = true;";
        if (btnSubmit.Text == "Send OTP")
        {
           // btnSubmit.OnClientClick = ClientScript.GetPostBackEventReference(btnSubmit, "") + "; this.value='Sending...';this.disabled = true;";
        }
        else
        {
            //btnSubmit.OnClientClick = ClientScript.GetPostBackEventReference(btnSubmit, "") + "; this.value='Verifying...';this.disabled = true;";
        }
        if (!IsPostBack)
        {
            rbbtnUserType.SelectedIndex = 1;
            pnlRegisterInfo.Visible = false;
            pnlRequestOTP.Visible = true;
            lbtnReSendOTP.Visible = false;
            pnlPreUserInfo.Visible = false;
            btnSubmit.Text = "Send OTP";
            txtaddress.Value = "";
            txtcity.Value = "";
            txtemail.Value = "";
            txtlandmark.Value = "";
            txtname.Value = "";
            txtNumber.Text = "";

            txtpincode.Value = "";
            txtreferal.Value = "";
            txtstate.Value = "";
            rbtnGender.SelectedIndex = 0;
            ddlSize.SelectedIndex = 0;

            btnSubmit.Text = "Send OTP";
            btnSubmit.Enabled = true;
        }
        else
        {

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            if (txtNumber.Text.Trim() != "")
            {
                //btnSubmit.Enabled = false;
                if (btnSubmit.Text == "Send OTP")
                {
                   // btnSubmit.Enabled = false;
                    DataSet ds = obj.CheckUserMobileNumDuplicacy(txtNumber.Text);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        string otp = obj.GenerateOTP();
                        Session["OTP"] = otp;
                        Session["Mobile"] = txtNumber.Text;
                        txtNumber.Text = "";
                        obj.SendOTP(Session["Mobile"].ToString(), otp);
                        btnSubmit.Text = "Verify OTP";
                        btnSubmit.Enabled = true;
                        txtNumber.Attributes.Add("placeholder", "Enter OTP");

                        lbtnReSendOTP.Visible = true;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('OTP send Successfully to Your Mobile !');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Mobile number already Registered !');", true);
                        btnSubmit.Enabled = true;
                        btnSubmit.Text = "Send OTP";
                    }
                }
                else
                {
                    btnSubmit.Text = "Verifying ...";
                    //btnSubmit.Enabled = false;
                    //lbtnReSendOTP.Enabled = false;
                    if (txtNumber.Text == Session["OTP"].ToString())
                    {

                        //btnRegisterInfo.Text = "Register";
                        //btnRegisterInfo.Enabled = true;
                        pnlRequestOTP.Visible = false;
                        pnlRegisterInfo.Visible = true;
                        Session["OTP"] = null;

                    }
                    else
                    {
                        btnSubmit.Text = "Verify OTP";
                        //btnSubmit.Enabled = false;
                        //lbtnReSendOTP.Enabled = false;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('OTP Mismatched !');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Field cannot be left empty !');", true);
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
    protected void lbtnReSendOTP_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            //lbtnReSendOTP.Enabled = false;

            string otp = Session["OTP"].ToString();
            Session["OTP"] = otp;
            obj.SendOTP(Session["Mobile"].ToString(), otp);
            btnSubmit.Text = "Verify OTP";
            //lbtnReSendOTP.Enabled = true;
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }
    protected void btnRegisterInfo_Click(object sender, EventArgs e)
    {

        //btnRegisterInfo.Text = "Processing...";

        string logininfo = "";
        try
        {
            if (btnRegisterInfo.Text == "Register" && btnRegisterInfo.Enabled)
            {
                btnRegisterInfo.Enabled = false;
                if (txtname.Value.Trim() != "" && txtemail.Value.Trim() != "" && txtstate.Value.Trim() != "" && txtcity.Value.Trim() != "" && txtpincode.Value.Trim() != "" && txtlandmark.Value.Trim() != "" && txtaddress.Value.Trim() != "")
                {

                    obj = new DB();
                    string pwd = obj.CreatePassword();
                    logininfo = obj.UserRegistrationInfo(Session["Mobile"].ToString(), pwd, "Online", "Website", "Free", txtname.Value, txtemail.Value, txtaddress.Value, txtcity.Value, txtstate.Value, txtpincode.Value, txtlandmark.Value, txtreferal.Value, rbtnGender.SelectedIndex == 0 ? "M" : "F", ddlSize.SelectedValue);
                    if (logininfo != "")
                    {
                        string[] user = logininfo.Split(',');
                        string msg = "Registered Successfully.Your UserId : " + user[0] + " and Password : " + user[1];
                        obj.SendMessage(Session["Mobile"].ToString(), msg);
                        msg = obj.createEmailBodyforRegistrationUPwd(user[0], user[1]);
                        obj.SendEmail(txtemail.Value, msg, "Registration Done Successfully !");
                        Session["Mobile"] = null;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('User Registered Successfully !');", true);
                        if (rbbtnUserType.SelectedIndex == 0)
                        {
                            if (txtreferal.Value != "")
                            {
                                logininfo += ",Referral," + txtreferal.Value;
                            }
                            else
                            {
                                logininfo += ",Premium";
                            }
                            Session["loginid"] = logininfo;
                            //redirect tp payment page
                            Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");

                        }
                        else
                        {
                            string gvid = "";
                            gvid = obj.FreeUserGiftVoucher(user[0], "Villagers100", "100");
                            if (gvid != "")
                            {
                                // send mail to inform gift voucher given
                                msg = "";
                                msg = obj.createEmailBodyforGiftCard(gvid, txtname.Value);
                                obj.SendEmail(txtemail.Value, msg, "Gift Voucher from Team Villagers");

                                if (txtreferal.Value != "")
                                {
                                    //give giftvoucher of 100 to referral also
                                    gvid = "";
                                    gvid = obj.FreeUserGiftVoucher(txtreferal.Value, "Villagers100", "100");
                                    if (gvid != "")
                                    {
                                        DataSet dss = obj.GetUserTypeAndBalance(txtreferal.Value);
                                        if (dss.Tables[0].Rows.Count > 0)
                                        {
                                            msg = "";
                                            msg = obj.createEmailBodyforGiftCard(gvid, dss.Tables[0].Rows[0]["Name"].ToString());
                                            obj.SendEmail(dss.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Gift Voucher from Team Villagers");
                                        }

                                    }
                                }
                            }
                            else
                            {

                            }
                            Session["loginid"] = logininfo;
                            Response.Redirect("Default.aspx");
                            //Server.Transfer("Default.aspx");
                        }
                    }
                    else
                    {

                        pnlRequestOTP.Visible = true;
                        pnlRequestOTP.Visible = false;
                        lbtnReSendOTP.Visible = false;
                        txtaddress.Value = "";
                        txtcity.Value = "";
                        txtemail.Value = "";
                        txtlandmark.Value = "";
                        txtname.Value = "";
                        txtNumber.Text = "";

                        txtpincode.Value = "";
                        txtreferal.Value = "";
                        txtstate.Value = "";
                        btnSubmit.Text = "Send OTP";
                        Session["Mobile"] = null;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Registration Failed Try Again !');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Fields cannot be left empty !');", true);
                }
            }
        }
        catch (Exception ex)
        {
            //if (logininfo != "")
            //{
            //    Response.Redirect("Default.aspx");
            //}
        }
        finally
        {
            obj = null;
        }
    }



    protected void rbbtnUserType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbbtnUserType.SelectedItem.Text == "Premium")
        {
            pnlPreUserInfo.Visible = true;
        }
        else
        {
            pnlPreUserInfo.Visible = false;
        }
    }
}