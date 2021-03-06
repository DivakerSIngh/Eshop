﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Text;

using System.Collections.Specialized;
using System.Security.Cryptography;

public partial class ConfirmOrder : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(Request.Form["encResp"])))
                {
                    getPaymentResponse();
                }
                else
                {
                    string[] usersid = Session["loginid"].ToString().Split(',');
                    load_cartlist(usersid[0]);
                    rbtnAddress.SelectedIndex = 0;
                }

            }

        }
        else
        {
            Server.Transfer("Login.aspx");
        }

    }

    private void getPaymentResponse()
    {
        string workingKey = "6495FC57F155EE0E038A040E4A5EDB08";//put in the 32bit alpha numeric key in the quotes provided here
        CCA.Util.CCACrypto ccaCrypto = new CCA.Util.CCACrypto();
        string encResponse = ccaCrypto.Decrypt(Request.Form["encResp"], workingKey);
        NameValueCollection Params = new NameValueCollection();
        string[] segments = encResponse.Split('&');
        foreach (string seg in segments)
        {
            string[] parts = seg.Split('=');
            if (parts.Length > 0)
            {
                string Key = parts[0].Trim();
                string Value = parts[1].Trim();
                Params.Add(Key, Value);
            }
        }

        Dictionary<string, string> resp = new Dictionary<string, string>();
        for (int i = 0; i < Params.Count; i++)
        {
            resp.Add(Params.Keys[i], Params[i]);
        }

        var payemtStatus = resp["order_status"];
        // payement cancel
        if(payemtStatus== "Aborted")
        {
            string[] usersid = Session["loginid"].ToString().Split(',');
            string[] param1 = Session["BuyPayumoney"].ToString().Split('|');
            obj = new DB();
            obj.TransactionConfirmation(usersid[0], null, param1[2], "PAY", param1[1], "F", null, null, param1[3]);
            Session["BuyPayumoney"] = null;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "popup", "openPopUp('tf');", true);
        }
        //payment success
        if (payemtStatus == "Success")
        {
            string[] param = Session["BuyPayumoney"].ToString().Split('|');
            ConfirmPayUMoneyOrder("PAID VIA CCAVENUE", "", param[1], param[2], param[3]);
            Session["BuyPayumoney"] = null;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "popup", "openPopUp('ts');", true);
        }
        //payment pending from bank
        if (payemtStatus == "Awaited")
        {

        }
        
    }

    private void load_cartlist(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetCartAllProductList(userid);
            rptCartProds.DataSource = ds.Tables[0];
            rptCartProds.DataBind();

            DataSet dss = obj.GetCartInfoQtyNdAmt(userid);
            if (dss.Tables.Count > 0 && dss.Tables[0].Rows.Count > 0)
            {
                lblQuantity.Text = dss.Tables[0].Rows[0]["qty"].ToString();
                lblCartNum.Text = "My Cart(" + dss.Tables[0].Rows[0]["qty"].ToString() + ")";
                lblPriceAmt.Text = dss.Tables[0].Rows[0]["totalamount"].ToString();
                // pnlMsg.Visible = false;
            }
            else
            {
                // pnlMsg.Visible = true;
            }

            //lblCartNum.Text = "My Cart(" + ds.Tables[0].Rows.Count.ToString() + 
            //lblQuantity.Text = ds.Tables[0].Rows.Count.ToString();
            //decimal amt = 0;
            //for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            //{
            //    amt += Convert.ToDecimal(ds.Tables[0].Rows[i]["sellingprice"].ToString());
            //}
            //lblPriceAmt.Text = amt.ToString();
            lblTotAmt.Text = (Convert.ToDecimal(lblPriceAmt.Text) + Convert.ToDecimal(ds.Tables[0].Rows[0]["USER_SHIPPING_CHRG"].ToString()) - Convert.ToDecimal(ds.Tables[0].Rows[0]["coupon_amt"].ToString())).ToString();
            lblDeliveryCharge.Text = ds.Tables[0].Rows[0]["USER_SHIPPING_CHRG"].ToString();
            if (ds.Tables[0].Rows[0]["coupon_amt"].ToString() == "0.00")
            {
                lblCouponInfo.Text = "No Coupon Applied.";
            }
            else
            {
                lblCouponInfo.Text = "Coupon Applied.";
            }
            //string usersid = Session["loginid"].ToString() + "," + ds.Tables[0].Rows.Count.ToString() + "," + lblTotAmt.Text;
            Session["loginid"] = userid;
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }

    }

    protected void btnPayment_Command(object sender, CommandEventArgs e)
    {
        try
        {
            obj = new DB();

            string[] str = Session["loginid"].ToString().Split(',');
            if (rbtnAddress.SelectedValue == "P")
            {
                DataSet dss = obj.GetCartInfoQtyNdAmt(str[0]);//total amount to be paid
                decimal grandtotamt = Convert.ToDecimal(dss.Tables[0].Rows[0]["totalamount"].ToString()) + Convert.ToDecimal(dss.Tables[0].Rows[0]["Delivery_Amount"].ToString()) - Convert.ToDecimal(dss.Tables[0].Rows[0]["Coupon_Amt"].ToString());
                DataSet dscart = obj.GetAllCartIdandQty(str[0]);
                string cartid = "", qty = "", lid = "";

                for (int i = 0; i < dscart.Tables[0].Rows.Count; i++)
                {
                    cartid += dscart.Tables[0].Rows[i]["cartid"].ToString() + ",";
                    qty += dscart.Tables[0].Rows[i]["quantity"].ToString() + ",";
                    lid += dscart.Tables[0].Rows[i]["LID"].ToString() + ",";
                }

                //string tid = obj.TransactionConfirmation(str[0], null, grandtotamt.ToString(), "PAY", cartid, "S", null, null, qty);
                string name = "", phone = "", pincode = "", state = "", address = "", landmark = "", city = "";
                string[] add = dss.Tables[0].Rows[0]["Address"].ToString().Split('?');
                name = add[0];
                phone = add[1];
                address = add[2];
                city = add[3];
                state = add[4];
                pincode = add[5];
                landmark = add[6];

                string billingaddress = name + "," + landmark + "," + address + "," + city + "," + state + "," + pincode + "\n" + "Phone : " + phone;
                payuMoneyAction(name, phone, address, city, state, pincode, landmark, Convert.ToString(grandtotamt), dscart.Tables[0].Rows[0]["EmailId"].ToString());
                Session["BuyPayumoney"] = txnid.Value + "|" + cartid + "|" + grandtotamt.ToString() + "|" + qty;
                Response.Redirect("payumoney.aspx", false);
            }

            if (rbtnAddress.SelectedValue == "C")
            {
                DataSet dss = obj.GetCartInfoQtyNdAmt(str[0]);//total amount to be paid
                decimal grandtotamt = Convert.ToDecimal(dss.Tables[0].Rows[0]["totalamount"].ToString()) + Convert.ToDecimal(dss.Tables[0].Rows[0]["Delivery_Amount"].ToString()) - Convert.ToDecimal(dss.Tables[0].Rows[0]["Coupon_Amt"].ToString());
                DataSet dscart = obj.GetAllCartIdandQty(str[0]);
                string cartid = "", qty = "", lid = "";

                for (int i = 0; i < dscart.Tables[0].Rows.Count; i++)
                {
                    cartid += dscart.Tables[0].Rows[i]["cartid"].ToString() + ",";
                    qty += dscart.Tables[0].Rows[i]["quantity"].ToString() + ",";
                    lid += dscart.Tables[0].Rows[i]["LID"].ToString() + ",";
                }

                string tid = obj.TransactionConfirmation(str[0], null, grandtotamt.ToString(), "Buycod", cartid, "S", null, null, qty);
                string name = "", phone = "", pincode = "", state = "", address = "", landmark = "", city = "";
                string[] add = dss.Tables[0].Rows[0]["Address"].ToString().Split('?');
                name = add[0];
                phone = add[1];
                address = add[2];
                city = add[3];
                state = add[4];
                pincode = add[5];
                landmark = add[6];

                string billingaddress = name + "," + landmark + "," + address + "," + city + "," + state + "," + pincode + "\n" + "Phone : " + phone;
                if (tid != "")
                {
                    //send mail and msg
                    string msg = "", msgretailer = "";
                    msg = obj.createEmailBodyforConfirmOrder(tid, billingaddress, grandtotamt.ToString(), dscart, dscart.Tables[0].Rows[0]["Delivery_Amount"].ToString(), dscart.Tables[0].Rows[0]["coupon_amt"].ToString(), "COD");
                    obj.SendEmail(dscart.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Order Confirmation Mail");

                    //send mail nd msg to logistic and retailer
                    string[] cart = cartid.Split(',');
                    string[] lidid = lid.Split(',');
                    for (int k = 0; k < cart.Length && cart[k] != ""; k++)
                    {
                        string SMS_USER = "";
                        SMS_USER = "You have Successfully Placed your order.";
                        SMS_USER = SMS_USER + " Item: " + dscart.Tables[0].Rows[k]["HeaderTitle"].ToString();
                        SMS_USER = SMS_USER + ", Qty: " + dscart.Tables[0].Rows[k]["OrderedQty"].ToString();
                        SMS_USER = SMS_USER + ", Price :" + dscart.Tables[0].Rows[k]["TotalAmount"].ToString();
                        SMS_USER = SMS_USER + ", Size :" + dscart.Tables[0].Rows[k]["size"].ToString();

                        string SMS_RETAILER = "";
                        SMS_RETAILER = "One Product has been sold from your store.";
                        SMS_RETAILER = SMS_RETAILER + " Item: " + dscart.Tables[0].Rows[k]["HeaderTitle"].ToString();
                        SMS_RETAILER = SMS_RETAILER + ", Qty: " + dscart.Tables[0].Rows[k]["OrderedQty"].ToString();
                        SMS_RETAILER = SMS_RETAILER + ", Price: " + dscart.Tables[0].Rows[k]["TotalAmount"].ToString();
                        SMS_RETAILER = SMS_RETAILER + ", Size: " + dscart.Tables[0].Rows[k]["size"].ToString();
                        //DataSet dslog = obj.GetLogisticEmailndMobileInfo(lidid[k]);
                        DataSet dsret = obj.GetReatilerEmailndMobileInfo(cart[k]); 

                        msgretailer = obj.createEmailBodyforRetailerndLogistic(tid, dsret.Tables[0].Rows[0]["raddress"].ToString(), dsret.Tables[0].Rows[0]["rname"].ToString(), dsret.Tables[0].Rows[0]["quantity"].ToString(), dsret.Tables[0].Rows[0]["headertitle"].ToString()+" ("+ dsret.Tables[0].Rows[0]["size"].ToString()+")", dsret.Tables[0].Rows[0]["mobile"].ToString(), dsret.Tables[0].Rows[0]["prodid"].ToString(), dsret.Tables[0].Rows[0]["org_email"].ToString(), dsret.Tables[0].Rows[0]["totalamount"].ToString(), dsret.Tables[0].Rows[0]["city"].ToString(), dsret.Tables[0].Rows[0]["landmark"].ToString(), dsret.Tables[0].Rows[0]["pincode"].ToString(), dsret.Tables[0].Rows[0]["rstate"].ToString(), billingaddress, "COD");
                        obj.SendEmail(dsret.Tables[0].Rows[0]["org_email"].ToString(), msgretailer, "Order Confirmation Mail");

                        obj.SendMessage(dscart.Tables[0].Rows[0]["User_Mobile"].ToString(), SMS_USER);
                        obj.SendMessage(dsret.Tables[0].Rows[0]["Mobile"].ToString(), SMS_RETAILER);

                        //string sms = "One Product has been sold from your store.";
                        //if (dslog.Tables.Count > 0 && dslog.Tables[0].Rows.Count > 0)
                        //{
                        //    obj.SendMessage(dslog.Tables[0].Rows[0]["mobile"].ToString(), sms);
                        //    obj.SendEmail(dslog.Tables[0].Rows[0]["LEmailAddress1"].ToString(), msgretailer, "Order Confirmation Mail");
                        //}
                    }


                    //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Order Successfully placed !');", true);
                    //redirect some where
                    Response.Redirect("MyOrder.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Server error cannot place order try later !');", true);
                }

            }
            else
                if (rbtnAddress.SelectedValue == "W")
            {
                DataSet ds = obj.GetUserTypeAndBalance(str[0]);//user wallet balance
                DataSet dss = obj.GetCartInfoQtyNdAmt(str[0]);//total amount to be paid
                decimal grandtotamt = Convert.ToDecimal(dss.Tables[0].Rows[0]["totalamount"].ToString()) - Convert.ToDecimal(dss.Tables[0].Rows[0]["Delivery_Amount"].ToString()) - Convert.ToDecimal(dss.Tables[0].Rows[0]["Coupon_Amt"].ToString());
                //find updated balance and prod quantity
                if (grandtotamt <= Convert.ToDecimal(ds.Tables[0].Rows[0]["Balance"].ToString()))
                {
                    decimal bal = Convert.ToDecimal(ds.Tables[0].Rows[0]["Balance"].ToString()) - grandtotamt;
                    DataSet dscart = obj.GetAllCartIdandQty(str[0]);
                    string cartid = "", qty = "", lid = "";
                    for (int i = 0; i < dscart.Tables[0].Rows.Count; i++)
                    {
                        cartid += dscart.Tables[0].Rows[i]["cartid"].ToString() + ",";
                        qty += dscart.Tables[0].Rows[i]["quantity"].ToString() + ",";
                        lid += dscart.Tables[0].Rows[i]["lid"].ToString() + ",";
                    }

                    string tid = obj.TransactionConfirmation(str[0], null, grandtotamt.ToString(), "Buywallet", cartid, "S", bal.ToString(), null, qty);

                    string name = "", phone = "", pincode = "", state = "", address = "", landmark = "", city = "";
                    string[] add = dss.Tables[0].Rows[0]["Address"].ToString().Split('?');
                    name = add[0];
                    phone = add[1];
                    address = add[2];
                    city = add[3];
                    state = add[4];
                    pincode = add[5];
                    landmark = add[6];

                    string billingaddress = name + "," + landmark + "," + address + "," + city + "," + state + "," + pincode + "\n" + "Phone : " + phone;


                    if (false && tid != "")
                    {
                        //send mail nd msg
                        string msg = "", msgretailer = "";
                        msg = obj.createEmailBodyforConfirmOrder(tid, billingaddress, grandtotamt.ToString(), dscart, dscart.Tables[0].Rows[0]["Delivery_Amount"].ToString(), dscart.Tables[0].Rows[0]["coupon_amt"].ToString(), "Wallet");
                        obj.SendEmail(dscart.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Order Confirmation Mail");


                        //send mail nd msg to logistic and retailer
                        string[] cart = cartid.Split(',');
                        string[] logisticId = lid.Split(',');
                        for (int k = 0; k < cart.Length; k++)
                        {
                            string SMS_USER = "";
                            SMS_USER = "You have Successfully Placed your order.";
                            SMS_USER = SMS_USER + " Item: " + dscart.Tables[0].Rows[k]["HeaderTitle"].ToString();
                            SMS_USER = SMS_USER + ", Qty: " + dscart.Tables[0].Rows[k]["OrderedQty"].ToString();
                            SMS_USER = SMS_USER + ", Price: " + dscart.Tables[0].Rows[k]["TotalAmount"].ToString();
                            SMS_USER = SMS_USER + ", Size :" + dscart.Tables[0].Rows[k]["size"].ToString();

                            string SMS_RETAILER = "";
                            SMS_RETAILER = "One Product has been sold from your store.";
                            SMS_RETAILER = SMS_RETAILER + " Item: " + dscart.Tables[0].Rows[k]["HeaderTitle"].ToString();
                            SMS_RETAILER = SMS_RETAILER + ", Qty: " + dscart.Tables[0].Rows[k]["OrderedQty"].ToString();
                            SMS_RETAILER = SMS_RETAILER + ", Price: " + dscart.Tables[0].Rows[k]["TotalAmount"].ToString();
                            SMS_RETAILER = SMS_RETAILER + ", Size: " + dscart.Tables[0].Rows[k]["size"].ToString();

                            //DataSet dslog = obj.GetLogisticEmailndMobileInfo(logisticId[k]);
                            DataSet dsret = obj.GetReatilerEmailndMobileInfo(cart[k]);
                            msgretailer = obj.createEmailBodyforRetailerndLogistic(tid, dsret.Tables[0].Rows[0]["raddress"].ToString(), dsret.Tables[0].Rows[0]["rname"].ToString(), dsret.Tables[0].Rows[0]["quantity"].ToString(), dsret.Tables[0].Rows[0]["headertitle"].ToString() + " (" + dsret.Tables[0].Rows[0]["size"].ToString() + ")", dsret.Tables[0].Rows[0]["mobile"].ToString(), dsret.Tables[0].Rows[0]["prodid"].ToString(), dsret.Tables[0].Rows[0]["org_email"].ToString(), dsret.Tables[0].Rows[0]["totalamount"].ToString(), dsret.Tables[0].Rows[0]["city"].ToString(), dsret.Tables[0].Rows[0]["landmark"].ToString(), dsret.Tables[0].Rows[0]["pincode"].ToString(), dsret.Tables[0].Rows[0]["rstate"].ToString(), billingaddress, "Wallet");
                            obj.SendEmail(dsret.Tables[0].Rows[0]["org_email"].ToString(), msgretailer, "Order Confirmation Mail");

                            obj.SendMessage(dscart.Tables[0].Rows[0]["USER_Mobile"].ToString(), SMS_USER);
                            obj.SendMessage(dsret.Tables[0].Rows[0]["Mobile"].ToString(), SMS_RETAILER);

                            //string sms = "One Product has been sold form your store.";
                            //if (dslog.Tables.Count > 0 && dslog.Tables[0].Rows.Count > 0)
                            //{
                            //    obj.SendMessage(dslog.Tables[0].Rows[0]["mobile"].ToString(), sms);
                            //    obj.SendEmail(dslog.Tables[0].Rows[0]["LEmailAddress1"].ToString(), msgretailer, "Order Confirmation Mail");
                            //}
                        }


                        //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Order Successfully placed !');", true);
                        //redirect some where
                        Response.Redirect("MyOrder.aspx", false);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Server error cannot place order try later !');", true);
                    }


                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Insufficient balance in Wallet cannot place order !');", true);
                }

            }
            else if (rbtnAddress.SelectedValue == "N")
            {


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

    protected void rbtnAddress_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnAddress.SelectedIndex == 0)
        {

        }
        else if (rbtnAddress.SelectedIndex == 1)
        {

        }
        else if (rbtnAddress.SelectedIndex == 2)
        {

        }
    }

    protected void rptCartProds_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
        {
            try
            {
                var image = (HtmlImage)e.Item.FindControl("imgprod");
                var pid = (Label)e.Item.FindControl("lblpid");
                DataSet ds = obj.GetProductImage(pid.Text);

                image.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);

                var qty = (Label)e.Item.FindControl("lblquanty");
                var sp = (Label)e.Item.FindControl("lblsingsp");
                //var totsp = (Label)e.Item.FindControl("totsp");
                //decimal amt = 0;
                //amt = Convert.ToDecimal(sp.ToString()) * Convert.ToDecimal(qty.ToString());
                //totsp.Text = amt.ToString();
            }
            catch (Exception ex)
            {

            }
        }
    }

    public string action1 = string.Empty;
    public string hash1 = string.Empty;

    private void payuMoneyAction(string name, string phone1, string address, string city1, string state1, string pincode, string landmark, string amt, string email_id)
    {
        System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
        Random r = new Random();
        int n = r.Next();
        data.Add("tid", n.ToString());
        data.Add("merchant_id", "162563");
        data.Add("order_id", n.ToString());
        data.Add("amount", amt);
        data.Add("currency", "INR");
        data.Add("redirect_url", ConfigurationManager.AppSettings["surl"].ToString());
        data.Add("cancel_url", ConfigurationManager.AppSettings["curl"].ToString());
        Session["hastable"] = data;
    }

    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }

    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }

    private void ConfirmPayUMoneyOrder(string payment_mode, string payment_trans_no, string cartid, string amount, string qty)
    {
        obj = new DB();
        string[] str = Session["loginid"].ToString().Split(',');
        DataSet dscart = obj.GetAllCartIdandQty(str[0]);
        DataSet dss = obj.GetCartInfoQtyNdAmt(str[0]);
        string tid = obj.TransactionConfirmation(str[0], null, amount, "PAY", cartid, "S", null, null, qty, payment_mode, payment_trans_no);
        string name = "", phone = "", pincode = "", state = "", address = "", landmark = "", city = "";
        string[] add = dss.Tables[0].Rows[0]["Address"].ToString().Split('?');
        name = add[0];
        phone = add[1];
        address = add[2];
        city = add[3];
        state = add[4];
        pincode = add[5];
        landmark = add[6];
        string billingaddress = name + "," + landmark + "," + address + "," + city + "," + state + "," + pincode + "\n" + "Phone : " + phone;
        if (tid != "")
        {
            //send mail and msg
            string msg = "", msgretailer = "";
            msg = obj.createEmailBodyforConfirmOrder(tid, billingaddress, amount, dscart, dscart.Tables[0].Rows[0]["Delivery_Amount"].ToString(), dscart.Tables[0].Rows[0]["coupon_amt"].ToString(), "PAID VIA PAYUMONEY");
            obj.SendEmail(dscart.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Order Confirmation Mail");

            //send mail nd msg to logistic and retailer
            string[] cart = cartid.Split(',');
            for (int k = 0; k < cart.Length && cart[k] != ""; k++)
            {
                string SMS_USER = "";
                SMS_USER = "You have Successfully Placed your order.";
                SMS_USER = SMS_USER + " Item: " + dscart.Tables[0].Rows[k]["HeaderTitle"].ToString();
                SMS_USER = SMS_USER + ", Qty: " + dscart.Tables[0].Rows[k]["OrderedQty"].ToString();
                SMS_USER = SMS_USER + ", Price :" + dscart.Tables[0].Rows[k]["TotalAmount"].ToString();
                SMS_USER = SMS_USER + ", Size :" + dscart.Tables[0].Rows[k]["size"].ToString();

                string SMS_RETAILER = "";
                SMS_RETAILER = "One Product has been sold from your store.";
                SMS_RETAILER = SMS_RETAILER + " Item: " + dscart.Tables[0].Rows[k]["HeaderTitle"].ToString();
                SMS_RETAILER = SMS_RETAILER + ", Qty: " + dscart.Tables[0].Rows[k]["OrderedQty"].ToString();
                SMS_RETAILER = SMS_RETAILER + ", Price: " + dscart.Tables[0].Rows[k]["TotalAmount"].ToString();
                SMS_RETAILER = SMS_RETAILER + ", Size: " + dscart.Tables[0].Rows[k]["size"].ToString();

                //DataSet dslog = obj.GetLogisticEmailndMobileInfo(lidid[k]);
                DataSet dsret = obj.GetReatilerEmailndMobileInfo(cart[k]);

                msgretailer = obj.createEmailBodyforRetailerndLogistic(tid, dsret.Tables[0].Rows[0]["raddress"].ToString(), dsret.Tables[0].Rows[0]["rname"].ToString(), dsret.Tables[0].Rows[0]["quantity"].ToString(), dsret.Tables[0].Rows[0]["headertitle"].ToString() + " (" + dsret.Tables[0].Rows[0]["size"].ToString() + ")", dsret.Tables[0].Rows[0]["mobile"].ToString(), dsret.Tables[0].Rows[0]["prodid"].ToString(), dsret.Tables[0].Rows[0]["org_email"].ToString(), dsret.Tables[0].Rows[0]["totalamount"].ToString(), dsret.Tables[0].Rows[0]["city"].ToString(), dsret.Tables[0].Rows[0]["landmark"].ToString(), dsret.Tables[0].Rows[0]["pincode"].ToString(), dsret.Tables[0].Rows[0]["rstate"].ToString(), billingaddress, "PAID VIA CCAVENUE");
                obj.SendEmail(dsret.Tables[0].Rows[0]["org_email"].ToString(), msgretailer, "Order Confirmation Mail");

                obj.SendMessage(dscart.Tables[0].Rows[0]["User_Mobile"].ToString(), SMS_USER);
                obj.SendMessage(dsret.Tables[0].Rows[0]["Mobile"].ToString(), SMS_RETAILER);

            }
        }
    }

}