using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class UserProfile : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        //btnNewEmail.OnClientClick = ClientScript.GetPostBackEventReference(btnNewEmail, "") + "; this.value='Updating...';this.disabled = true;";
        if (btnUpdate1.Text == "Send OTP")
        {
            //btnUpdate1.OnClientClick = ClientScript.GetPostBackEventReference(btnUpdate1, "") + "; this.value='Sending...';this.disabled = true;";
        }
        else
        {
            //btnUpdate1.OnClientClick = ClientScript.GetPostBackEventReference(btnUpdate1, "") + "; this.value='Verifying...';this.disabled = true;";
        }
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                string[] str = Session["loginid"].ToString().Split(',');
                load_userinfo(str[0]);
                pnlChangePwd.Visible = true;
                pnlEmailUpdate.Visible = false;
                pnlUpdateMobile.Visible = false;
                pnlUserProfile.Visible = true;
                btnCancelEmail.Visible = false;
                lbtnCancelUpdate.Visible = false;
                

            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    private void load_userinfo(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetUserInfo(userid);
            if(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                lblCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                lblEmail.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
                lblGender.Text = ds.Tables[0].Rows[0]["Gender"].ToString() == "M" ? "Male":"Female" ;
                lblMobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                lblPincode.Text = ds.Tables[0].Rows[0]["pincode"].ToString();
                lblState.Text = ds.Tables[0].Rows[0]["state"].ToString();
                lblUAddress.Text = ds.Tables[0].Rows[0]["uaddress"].ToString();
                lblLandmark.Text = ds.Tables[0].Rows[0]["landmark"].ToString();
            }
            else
            {

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

    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            if (txtNewPwd.Text.Trim() != "" && txtOldPwd.Text.Trim() != "")
            {
                string[] str = Session["loginid"].ToString().Split(',');
                DataSet ds=obj.GetUserPassword(str[0]);
                if(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (txtOldPwd.Text == ds.Tables[0].Rows[0]["UPwd"].ToString())
                {
                    int i = obj.ChangeUserPassword(str[0],txtNewPwd.Text);
                        if(i > 0)
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Password Changed Successfully !');", true);
                            txtNewPwd.Text = "";
                            txtOldPwd.Text = "";
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Network Error occured.Try Later !');", true);
                        }
                }
                else
                {
                    txtNewPwd.Text = "";
                    txtOldPwd.Text = "";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Password Mismatched !');", true);
                }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Fileds cannot be left Empty !');", true);
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
    protected void lbtnUpdateMobile_Click(object sender, EventArgs e)
    {
        lbtnCancelUpdate.Visible = true;
        lbtnUpdateMobile.Visible = false;
        txtNewMobile.Text = "";
        pnlUpdateMobile.Visible = true;
        btnReSend.Visible = false;
        btnUpdate1.Text = "Send OTP";
    }
    protected void lbtnCancelUpdate_Click(object sender, EventArgs e)
    {
        lbtnCancelUpdate.Visible = false;
        lbtnUpdateMobile.Visible = true;
        pnlUpdateMobile.Visible = false ;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if(txtNewMobile.Text.Trim() != "")
        {
        if (btnUpdate1.Text == "Send OTP")
        {
            obj = new DB();
            DataSet ds = obj.CheckUserMobileNumDuplicacy(txtNewMobile.Text);
            if (ds.Tables[0].Rows.Count == 0)
            {
                string otp = obj.GenerateOTP();
                Session["OTP"] = otp;
                Session["Mobile"] = txtNewMobile.Text;
                txtNewMobile.Text = "";
                obj.SendOTP(Session["Mobile"].ToString(), otp);
                btnUpdate1.Text = "Verify OTP";
                //btnUpdate1.Enabled = true;
                txtNewMobile.Attributes.Add("placeholder", "Enter OTP");
                btnReSend.Visible = true;
                //lbtnReSendOTP.Visible = true;
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('OTP send Successfully to Your Mobile !');", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Mobile number already Registered !');", true);
                //btnUpdate1.Enabled = true;
                btnUpdate1.Text = "Send OTP";
            }
        }
        else
            if(btnUpdate1.Text == "Verify OTP")
            {
                btnUpdate1.Text = "Verifying ...";
                //btnUpdate1.Enabled = false;
                //btnReSend.Enabled = false;
                string ot = Session["OTP"] != null ? Session["OTP"].ToString():"" ;
                if (txtNewMobile.Text == ot)
                {
                    Session["OTP"] = null;
                    
                    string[] str = Session["loginid"].ToString().Split(',');
                    //login to update mobile number
                    obj = new DB();
                    int i = obj.UpdateMobile(str[0], Session["Mobile"].ToString());
                    
                    if (i > 0)
                    {
                        lblMobile.Text = Session["Mobile"].ToString();
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Mobile number Updated Successfully !');", true);
                        pnlUpdateMobile.Visible = false;
                        lbtnCancelUpdate.Visible = false;
                        lbtnUpdateMobile.Visible = true;
                        txtNewMobile.Text = "";
                        //load_userinfo(str[0]);
                    }
                    else
                    {
                        txtNewMobile.Text = "";
                        lbtnUpdateMobile.Text = "Send OTP";
                        btnReSend.Visible = false;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Mobile not Updated !');", true);
                    }
                    Session["Mobile"] = null;
                }
                else
                {
                    btnUpdate1.Text = "Verify OTP";
                    btnReSend.Visible = true;
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('OTP Mismatched !');", true);
                }
            }
        }
        else
        {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Field cannot be left empty !');", true);
        }
    }
    protected void btnReSend_Click(object sender, EventArgs e)
    {
        try
        {
            txtNewMobile.Text = "";
            obj = new DB();
            //lbtnReSendOTP.Enabled = false;

            string otp = obj.GenerateOTP();
            Session["OTP"] = otp;
            obj.SendOTP(Session["Mobile"].ToString(), otp);
            btnUpdate1.Text = "Verify OTP";
            btnReSend.Enabled = true;
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }
    protected void btnUpDateEmail_Click(object sender, EventArgs e)
    {
        btnUpDateEmail.Visible = false;
        btnCancelEmail.Visible = true;
        pnlEmailUpdate.Visible = true;
        txtNewMail.Text = "";
    }
    protected void btnNewEmail_Click(object sender, EventArgs e)
    {
        try
        {
            if(txtNewMail.Text.Trim() != "")
            {
            obj = new DB();
            string[] str = Session["loginid"].ToString().Split(',');
            int i = obj.UpdateEmail(str[0],txtNewMail.Text);
                if(i > 0)
                {
                    lblEmail.Text = txtNewMail.Text;
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Email Updated !');", true);
                    pnlEmailUpdate.Visible = false;
                    btnCancelEmail.Visible = false;
                    btnUpDateEmail.Visible = true;
                    //load_userinfo(str[0]);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Email not Updated !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Field cannot be left empty !');", true);
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
    protected void btnVerifyEmail_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancelEmail_Click(object sender, EventArgs e)
    {
        btnUpDateEmail.Visible = true;
        btnCancelEmail.Visible = false;
        pnlEmailUpdate.Visible = false;
    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            if (lblCity.Text.Trim() != "" && lblLandmark.Text.Trim() != "" && lblUAddress.Text.Trim() != "" && lblState.Text.Trim() != "" && lblPincode.Text.Trim() != "")
            {
                string[] str = Session["loginid"].ToString().Split(',');
                int i = obj.UpdateUserProfileInfo(lblPincode.Text, lblCity.Text, lblState.Text, lblUAddress.Text, lblLandmark.Text, str[0]);
                if(i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Record Updated !');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Error occured !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Field cannot be left empty !');", true);
            }
        }
        catch(Exception ex)
        {

        }
    }
    protected void btnupdateDp_Click(object sender, EventArgs e)
    {
         try
         {
             // Read the file and convert it to Byte Array

             string filePath = fupdp.PostedFile.FileName;

             string filename = Path.GetFileName(filePath);

             string ext = Path.GetExtension(filename);

             //string contenttype = String.Empty;

             if (fupdp.FileBytes.Length > 0)
             {

                 Stream fs = fupdp.PostedFile.InputStream;

                 BinaryReader br = new BinaryReader(fs);
                 Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                 obj = new DB();
                 string[] str = Session["loginid"].ToString().Split(',');
                 int i = obj.UpdateUserProfileImg(str[0],bytes);

                     if(i > 0)
                     {
                         ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Pic Saved successfully !');", true);
                     }
                 else
                     {
                         ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Error occured !');", true);
                     }

             }
             else
             {
                 ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please Upload Image file !');", true);
             }
 
         }
        catch(Exception ex)
         {

         }
    }
    protected void btnAdhar_Click(object sender, EventArgs e)
    {
        try
        {
            
            
            if (fupAdhar.FileBytes.Length > 0)
            {

                Stream fs = fupAdhar.PostedFile.InputStream;

                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                obj = new DB();
                string[] str = Session["loginid"].ToString().Split(',');
                int i = obj.UpdateUserProfileAdhar(str[0], bytes);

                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Pic Saved successfully !');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Error occured !');", true);
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please Upload Adhar Card !');", true);
            }

        }
        catch (Exception ex)
        {

        }
    }
}