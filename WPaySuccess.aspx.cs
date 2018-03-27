using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WPaySuccess : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                string[] str = Session["loginid"].ToString().Split(',');
                if (str.Length >= 3) // valid user
                {
                    string userid = "", type = "", id = "";
                    userid = str[0];
                    type = str[2];

                    if (str.Length == 4)
                    {
                        transactionsuccess(userid, type, str[3]);
                    }
                    else
                        transactionsuccess(userid, type);

                    Session["Retailor_Payment"] = "true";
                }
                else // invalid user
                {
                    //Response.Redirect("Retailor/RetailorDashboard.aspx?flag=tf");
                    Session["loginid"] = null;
                    Response.Redirect("Default.aspx?flag=tf");
                }
                if (str[0].StartsWith("U"))
                {
                    Response.Redirect("Default.aspx?flag=ts");
                }
                else if (str[0].StartsWith("R"))
                {
                    Response.Redirect("Retailor/RetailorDashboard.aspx?flag=ts");
                }
                else if (str[0].StartsWith("L"))
                {
                    Response.Redirect("Logistic/LogisticDashboard.aspx?flag=ts");
                }
                else
                {
                    Response.Redirect("Default.aspx?flag=ts");
                }
            }
        }
        else
        {
            //Response.Redirect("Login.aspx");
            Session["loginid"] = null;
            Response.Redirect("Default.aspx");
        }

        //Response.Redirect("Default.aspx?flag=ts");

    }


    private void transactionsuccess(string userid, string type, string id = null)
    {
        try
        {
            obj = new DB();
            string msg = ""; string tid = "";
            if (type == "Premium")
            {
                int i = 0, j = 1;
                do
                {
                    tid = obj.TransactionConfirmation(userid, null, null, "Premium", null, "S", null);
                    j++;

                } while (tid == "" && j <= 3);

                if (tid != "")
                {
                    //string[] user = logininfo.Split(',');
                    string smsmsg = "Congratulations on becoming Premium user with regards, Team Villagers.";

                    DataSet ds = obj.GetUserTypeAndBalance(userid);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string cardid = obj.CouponAssignPreUser(userid);
                        msg = obj.createEmailBodyforPremiumCard(cardid, ds.Tables[0].Rows[0]["Name"].ToString());
                        obj.SendEmail(ds.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Gift Voucher from Team Villagers");
                        obj.SendMessage(ds.Tables[0].Rows[0]["Mobile"].ToString(), smsmsg);
                    }
                }
            }
            else
                if (type == "Referral" && id != null)
            {
                int i = 0, j = 1; decimal amt;
                DataSet dss = obj.GetUserTypeAndBalance(userid);
                DataSet ds = obj.GetUserTypeAndBalance(id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["UserType"].ToString() == "Premium") //premium user
                    {
                        amt = Convert.ToDecimal(ds.Tables[0].Rows[0]["Balance"].ToString()) + 50;
                        do
                        {

                            tid = obj.TransactionConfirmation(userid, null, null, "Referral", id, "S", amt.ToString());
                            j++;

                        } while (tid == "" && j <= 3);
                        if (tid != "")
                        {
                            string cardid = "";

                            if (dss.Tables[0].Rows.Count > 0)
                            {
                                cardid = obj.CouponAssignPreUser(userid);
                                msg = "";
                                msg = obj.createEmailBodyforPremiumCard(cardid, dss.Tables[0].Rows[0]["Name"].ToString());
                                obj.SendEmail(dss.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Gift Voucher from Team Villagers");
                            }
                        }
                    }
                    else //free user case not applicable here
                    {
                        amt = Convert.ToDecimal(ds.Tables[0].Rows[0]["Balance"].ToString()) + 0;
                        do
                        {

                            tid = obj.TransactionConfirmation(userid, null, null, "Referral", id, "S", amt.ToString());
                            j++;

                        } while (tid == "" && j <= 3);
                        if (tid != "")
                        {
                            string cardid = "", gvid = "";
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                gvid = obj.FreeUserGiftVoucher(id, "Villagers100", "100");
                                msg = "";
                                msg = obj.createEmailBodyforGiftCard(gvid, ds.Tables[0].Rows[0]["Name"].ToString());
                                obj.SendEmail(ds.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Gift Voucher from Team Villagers");
                            }

                            if (dss.Tables[0].Rows.Count > 0)
                            {
                                cardid = obj.CouponAssignPreUser(userid);
                                msg = "";
                                msg = obj.createEmailBodyforPremiumCard(cardid, dss.Tables[0].Rows[0]["Name"].ToString());
                                obj.SendEmail(dss.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Gift Voucher from Team Villagers");
                            }
                        }
                    }
                }

            }
            else if (type == "AddMoney")
            {
                int i = 0, j = 1; decimal amt;

                DataSet ds = obj.GetUserTypeAndBalance(userid);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    amt = Convert.ToDecimal(ds.Tables[0].Rows[0]["Balance"].ToString()) + 599;
                    do
                    {

                        tid = obj.TransactionConfirmation(userid, "599", null, "AddMoney", userid, "S", amt.ToString());
                        j++;

                    } while (tid == "" && j <= 3);

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

}