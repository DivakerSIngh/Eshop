using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class UserWallet : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
         if(!IsPostBack)
         {
                string[] str = Session["loginid"].ToString().Split(',');
                load_referralInfo(str[0]);
                load_passbookInfo(str[0]);
                load_user_data();
                pnlAccount.Visible = true;
                pnlAddmoney.Visible = false;
                pnlTransfer.Visible = false;
                pnlReferEarn.Visible = false;
                pnlTransferToBank.Visible = false;
                pnlTransferToUser.Visible = true;
                rbtnTransfer.SelectedIndex = 0;
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    private void load_user_data()
    {
        try
        {
            obj = new DB();
            string[] str = Session["loginid"].ToString().Split(',');
            DataSet ds = obj.GetUserInfo(str[0]);
            if (ds.Tables[0].Rows.Count > 0)
            {

                if (ds.Tables[0].Rows[0]["UserType"].ToString() == "Free")
                {
                    btnPremiumUser.Visible = true;
                }
                else
                {
                    btnPremiumUser.Visible = false;
                }


            }


        }
        catch (Exception)
        {

        }
        finally
        {
            obj = null;
        }
    }


    private void load_referralInfo(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetUserReferralRecordInfo(userid);
            rptReferEarn.DataSource = ds.Tables[0];
            rptReferEarn.DataBind();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }

    }

    private void load_passbookInfo(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetUserPassbookRecordInfo(userid);
            rptPassbook.DataSource = ds.Tables[0];
            rptPassbook.DataBind();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }

    }

    protected void btnPassbook_Click(object sender, EventArgs e)
    {
        pnlAccount.Visible = true;
        pnlAddmoney.Visible = false;
        pnlTransfer.Visible = false;
        pnlReferEarn.Visible = false;
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

            string[] str = Session["loginid"].ToString().Split(',');
            load_referralInfo(str[0]);
            load_passbookInfo(str[0]);

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void btnReferEarn_Click(object sender, EventArgs e)
    {
        pnlAccount.Visible = false;
        pnlAddmoney.Visible = false;
        pnlTransfer.Visible = false;
        pnlReferEarn.Visible = true;
    }
    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        pnlAccount.Visible = false;
        pnlAddmoney.Visible = false;
        pnlTransfer.Visible = true;
        pnlReferEarn.Visible = false;
    }
    protected void btnAddMoney_Click(object sender, EventArgs e)
    {
        pnlAccount.Visible = false;
        pnlAddmoney.Visible = true;
        pnlTransfer.Visible = false;
        pnlReferEarn.Visible = false;

        string[] str = Session["loginid"].ToString().Split(',');
        Session["loginid"] = str[0] + ",,AddMoney";
        //redirect tp payment page
        Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
    }
    protected void btnTransferPayment_Click(object sender, EventArgs e)
    {
        if (txtAccHolderName.Value.Trim() != "" && txtAccNum.Value.Trim() != "" && txtbankTransferAmt.Value.Trim() != "" && txtIFSCCode.Value.Trim() != "")
        {
            try
            {
                obj = new DB();
                string[] str = Session["loginid"].ToString().Split(',');
                DataSet dss = obj.GetUserTypeAndBalance(str[0]);
                if (Convert.ToDecimal(txtbankTransferAmt.Value) > 0 && Convert.ToDecimal(txtbankTransferAmt.Value) <= Convert.ToDecimal(dss.Tables[0].Rows[0]["Balance"].ToString()))
                {


                    string bankid = "";
                    bankid = obj.TransferToBankInfo(str[0], txtAccNum.Value, txtIFSCCode.Value, txtAccHolderName.Value, txtbankTransferAmt.Value);
                    if (bankid != "")
                    {
                        string bal = "";
                        bal = (Convert.ToDecimal(dss.Tables[0].Rows[0]["Balance"].ToString()) - Convert.ToDecimal(txtbankTransferAmt.Value)).ToString();
                        string tid = obj.TransactionConfirmation(str[0], "0.00", txtbankTransferAmt.Value, "Bank", bankid, "S", bal);
                        if (tid != "")
                        {
                            string smsmsg = "Thank you for using our Transfer Service.Amount : " + txtbankTransferAmt.Value + " Debited from your wallet and will be transfered to the bank within 24hrs with regards, Team Villagers.";//sender debit msg
                            obj.SendMessage(dss.Tables[0].Rows[0]["Mobile"].ToString(), smsmsg);
                            //send sms for transfer request
                            obj.SendMessage("9431216127", "You have got a request to transfer an Amount " + txtbankTransferAmt.Value+" from UserID : "+str[0]);
                            //send mail for transfer request
                            obj.SendEmail("rrsworld@gmail.com", "you have got transfer request to bank.", "Request to transfer Amount to Bank");
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Transfer Request Send Successfully !');", true);
                            txtAccHolderName.Value = ""; txtAccNum.Value = ""; txtbankTransferAmt.Value = ""; txtIFSCCode.Value = "";

                        }
                        else
                        {
                            int j = obj.DeleteTransferToBankRequest(bankid);
                            txtAccHolderName.Value = ""; txtAccNum.Value = ""; txtbankTransferAmt.Value = ""; txtIFSCCode.Value = "";
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Unable to Transfer try later !');", true);
                        txtAccHolderName.Value = ""; txtAccNum.Value = ""; txtbankTransferAmt.Value = ""; txtIFSCCode.Value = "";
                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Insufficient Balance in wallet cannot transfer to bank !');", true);
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
        else
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('All Fields are mandatory !');", true);
        }
    }
    protected void btnSendRequest_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            if (txtmob.Value.Trim() != "")
            {
                string[] str = Session["loginid"].ToString().Split(',');
                int i = obj.ReferToNewUser(str[0], txtmob.Value);
                if (i > 0)
                {
                    string msg = "Join Villagers at https://www.villagers.co.in/Register.aspx and use my Referral Id : " + str[0];
                    obj.SendMessage(txtmob.Value, msg);
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Request Send Successfully !');", true);
                    txtmob.Value = "";
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Network Problem Try Later !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Enter Mobile Number !');", true);
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
    protected void btnPremiumUser_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            
            int i = 0;
            string[] str = Session["loginid"].ToString().Split(',');
            string s = ddlsize.SelectedValue.ToString();
            i = obj.UpdateTshirtInfo(str[0], s);
            if (i > 0)
            {
                if (str.Length > 0)
                {
                    Session["loginid"] = str[0] + ",,Premium";
                    Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
                }
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
    protected void lbtnViewReferEarn_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ViewReferNEarn.aspx");
    }
    protected void lbtnViewPassbook_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("ViewPassbook.aspx");
    }
    protected void btnPremiumUser_Click1(object sender, EventArgs e)
    {
        string[] str = Session["loginid"].ToString().Split(',');
        if (str.Length > 0)
        {
            Session["loginid"] = str[0] + ",,Premium";
            Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
        }
    }
    protected void btnAddMoney_Click1(object sender, EventArgs e)
    {
        pnlAccount.Visible = false;
        pnlAddmoney.Visible = true;
        pnlTransfer.Visible = false;
        pnlReferEarn.Visible = false;

        string[] str = Session["loginid"].ToString().Split(',');
        Session["loginid"] = str[0] + ",,AddMoney";
        //redirect tp payment page
        Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
    }
    protected void btnTransfer_Click1(object sender, EventArgs e)
    {
        pnlAccount.Visible = false;
        pnlAddmoney.Visible = false;
        pnlTransfer.Visible = false;
        pnlReferEarn.Visible = false;

    }
    protected void btnReferEarn_Click1(object sender, EventArgs e)
    {
        pnlAccount.Visible = false;
        pnlAddmoney.Visible = false;
        pnlTransfer.Visible = false;
        pnlReferEarn.Visible = true;


    }
    protected void btnPassbook_Click1(object sender, EventArgs e)
    {
        pnlAccount.Visible = true;
        pnlAddmoney.Visible = false;
        pnlTransfer.Visible = false;
        pnlReferEarn.Visible = false;

    }
    protected void rbtnTransfer_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnTransfer.SelectedIndex == 0)
        {
            pnlTransferToBank.Visible = false;
            pnlTransferToUser.Visible = true;
        }
        else
        {
            pnlTransferToBank.Visible = true;
            pnlTransferToUser.Visible = false;
        }
    }
    protected void btnUserTransfer_Click(object sender, EventArgs e)
    {
        if (txtUsertransferAmt.Value.Trim() != "" && txtUserId.Value.Trim() != "")
        {
            try
            {
                obj = new DB();
                string[] str = Session["loginid"].ToString().Split(',');
                if (txtUserId.Value != str[0])
                {
                    DataSet ds = obj.GetUserTypeAndBalance(txtUserId.Value);
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        DataSet dss = obj.GetUserTypeAndBalance(str[0]);
                        if (Convert.ToDecimal(txtUsertransferAmt.Value) > 0 && Convert.ToDecimal(txtUsertransferAmt.Value) <= Convert.ToDecimal(dss.Tables[0].Rows[0]["Balance"].ToString()))
                        {
                            string balsender = dss.Tables[0].Rows[0]["Balance"].ToString();
                            string balreceiver = ds.Tables[0].Rows[0]["Balance"].ToString();
                            balsender = (Convert.ToDecimal(balsender) - Convert.ToDecimal(txtUsertransferAmt.Value)).ToString();
                            balreceiver = (Convert.ToDecimal(balreceiver) + Convert.ToDecimal(txtUsertransferAmt.Value)).ToString();
                            string tid = obj.TransactionConfirmation(str[0], txtUsertransferAmt.Value, txtUsertransferAmt.Value, "Sender", txtUserId.Value, "S", balsender, balreceiver);
                            if (tid != "")
                            {
                                string smsmsg = "Thank you for using our Transfer Service.Amount : " + txtUsertransferAmt.Value + " Debited from your wallet with regards, Team Villagers.";//sender debit msg
                                obj.SendMessage(dss.Tables[0].Rows[0]["Mobile"].ToString(), smsmsg);
                                smsmsg = "Thank you for using our Transfer Service.Amount : " + txtUsertransferAmt.Value + " Credited into your wallet with regards, Team Villagers.";//receiver credit msg
                                obj.SendMessage(ds.Tables[0].Rows[0]["Mobile"].ToString(), smsmsg);
                                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Transaction done successfully. !');", true);
                                txtUsertransferAmt.Value = "";
                                txtUserId.Value = "";
                                Response.Redirect("UserWallet.aspx");
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Transaction Failed. !');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Insufficient balance in Wallet !');", true);
                        }
                    }
                    else
                    {
                        txtUserId.Value = "";
                        txtUsertransferAmt.Value = "";
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Invalid UserId !');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Self Transfer is not allowed !');", true);
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
        else
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('All Fields are mandatory !');", true);
        }
    }
}