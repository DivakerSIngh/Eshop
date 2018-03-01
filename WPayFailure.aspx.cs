using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WPayFailure : System.Web.UI.Page
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
                }
                else // invalid user
                {
                    Session["loginid"] = null;
                    Response.Redirect("Default.aspx?flag=tf");
                }
            }
        }
        else
        {
            //Response.Redirect("Login.aspx");
            Session["loginid"] = null;
            Response.Redirect("Default.aspx?flag=tf");
        }
        Response.Redirect("Default.aspx?flag=tf");
    }

    private void transactionsuccess(string userid, string type, string id = null)
    {
        try
        {
            string tid = "";
            obj = new DB();
            if (type == "Premium")
            {
                int i = 0, j = 1;
                do
                {

                    tid = obj.TransactionConfirmation(userid, null, null, "Premium", null, "F", null);
                    j++;

                } while (tid == "" && j <= 3);

                
            }
            else
                if (type == "Referral")
                {
                    int i = 0, j = 1; decimal amt;

                            do
                            {

                                tid = obj.TransactionConfirmation(userid, null, null, "Referral", id, "F", null);
                                j++;

                            } while (tid == "" && j <= 3);
                
                }
                else
                    if (type == "AddMoney")
                    {
                        int i = 0, j = 1; decimal amt;

                            do
                            {

                                tid = obj.TransactionConfirmation(userid, "500", null, "AddMoney", userid, "F", null);
                                j++;

                            } while (tid == "" && j <= 3);

                        
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