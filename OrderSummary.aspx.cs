using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class OrderSummary : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Response.Write(Session["transactionid"]);
            if (Session["uid"] != null && Session["sessionid"] != null)
            {
                if (Session["transactionid"] != null && Session["transactionid"].ToString() != "")
                {
                    obj = new DB();
                    //int i = obj.GetCartCount();
                    //((Label)Master.FindControl("lblcountcart")).Text = "0";
                    //((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Logout";
                    update_transaction();
                    load_gridviewall();
                    lblrecentorder.Visible = true;
                    gv_OrederSummary.Visible = true;
                    load_gridviewpast();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Placed Successfully !')", true);

                }
                else
                {
                    lblrecentorder.Visible = false;
                    gv_OrederSummary.Visible = false;
                    load_gridviewpast();

                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    private void update_transaction()
    {
        //try
        //{
        //    int flag = 1;
        //    string[] transid = Session["transactionid"].ToString().Split(',');
        //    string uemail = Session["uemail"].ToString();
           
        //    obj = new DB();
        //    foreach (string s in transid)
        //    {
        //        obj.TransactionId = s;
        //        obj.UserEmail = uemail;

        //        flag = obj.Transaction_Confirmation(uemail, Session["sessionid"].ToString());
        //        if (flag == 1)
        //            continue;
        //        else
        //        {
        //            flag = 0;
        //            break;
        //        }
        //    }
        //    if (flag == 1)
        //    {

        //    }
        //    Session.Remove("transactionid");
        //}
        //catch(Exception ex)
        //{

        //}
    }

    private void load_gridviewall()
    {
        try
        {
            obj = new DB();
            obj.UserSessionId = Session["sessionid"].ToString();
            obj.EmpId = Session["uid"].ToString();
            DataSet ds = obj.GetOrderSummaryRecent();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gv_OrederSummary.DataSource = ds.Tables[0];
                gv_OrederSummary.DataBind();
            }

            //DataSet dss = obj.GetOrderSummaryAll();
            //if (dss.Tables[0].Rows.Count > 0)
            //{
            //    gv_ordersummaryall.DataSource = dss.Tables[0];
            //    gv_ordersummaryall.DataBind();
            //}


        }
        catch(Exception ex)
        {

        }
    }

    private void load_gridviewpast()
    {
        try
        {
            obj = new DB();
            obj.UserSessionId = Session["sessionid"].ToString();
            obj.EmpId = Session["uid"].ToString();
            //DataSet ds = obj.GetOrderSummaryRecent();
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    gv_OrederSummary.DataSource = ds.Tables[0];
            //    gv_OrederSummary.DataBind();
            //}

            DataSet dss = obj.GetOrderSummaryAll();
            if (dss.Tables[0].Rows.Count > 0)
            {
                lblPastSum.Text = "Past Order Summary !";
                gv_ordersummaryall.DataSource = dss.Tables[0];
                gv_ordersummaryall.DataBind();
            }
            else
            {
                lblPastSum.Text = "No Record Available !";
            }

        }
        catch (Exception ex)
        {

        }
    }

}