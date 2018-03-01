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


public partial class ConfirmOrder : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
    
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                string[] usersid = Session["loginid"].ToString().Split(',');
                load_cartlist(usersid[0]);
                rbtnAddress.SelectedIndex = 0;
                }
                
            }
            else
            {
                Server.Transfer("Login.aspx");
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
                   lblQuantity.Text =  dss.Tables[0].Rows[0]["qty"].ToString();
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
                 lblTotAmt.Text = (Convert.ToDecimal(lblPriceAmt.Text) + Convert.ToDecimal(ds.Tables[0].Rows[0]["delivery_amount"].ToString()) - Convert.ToDecimal(ds.Tables[0].Rows[0]["coupon_amt"].ToString())).ToString();
            lblDeliveryCharge.Text = ds.Tables[0].Rows[0]["delivery_amount"].ToString();
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
            if (rbtnAddress.SelectedValue == "C")
            {
                DataSet dss = obj.GetCartInfoQtyNdAmt(str[0]);//total amount to be paid
                decimal grandtotamt = Convert.ToDecimal(dss.Tables[0].Rows[0]["totalamount"].ToString()) + Convert.ToDecimal(dss.Tables[0].Rows[0]["Delivery_Amount"].ToString()) - Convert.ToDecimal(dss.Tables[0].Rows[0]["Coupon_Amt"].ToString());
                DataSet dscart = obj.GetAllCartIdandQty(str[0]);
                string cartid = "", qty = "";

                for (int i = 0; i < dscart.Tables[0].Rows.Count; i++)
                {
                    cartid += dscart.Tables[0].Rows[i]["cartid"].ToString() + ",";
                    qty += dscart.Tables[0].Rows[i]["quantity"].ToString() + ",";
                }

                string tid = obj.TransactionConfirmation(str[0], null, grandtotamt.ToString(), "Buycod", cartid, "S", null, null, qty);
                string name = "", phone = "", pincode = "", state = "", address = "", landmark = "",city="";
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
                    string msg = "",msgretailer="";
                    msg = obj.createEmailBodyforConfirmOrder(tid, billingaddress, grandtotamt.ToString(), dscart, dscart.Tables[0].Rows[0]["Delivery_Amount"].ToString(), dscart.Tables[0].Rows[0]["coupon_amt"].ToString());
                    obj.SendEmail(dscart.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Order Confirmation Mail");

                    DataSet dslog = obj.GetLogisticEmailndMobileInfo();
                    //send mail nd msg to logistic and retailer
                    string[] cart=cartid.Split(',');
                    for (int k = 0; k < cart.Length && cart[k] != ""; k++)
                    {
                        DataSet dsret = obj.GetReatilerEmailndMobileInfo(cart[k]);
                        msgretailer = obj.createEmailBodyforRetailerndLogistic(tid, dsret.Tables[0].Rows[0]["raddress"].ToString(), dsret.Tables[0].Rows[0]["rname"].ToString(), dsret.Tables[0].Rows[0]["quantity"].ToString(), dsret.Tables[0].Rows[0]["headertitle"].ToString(), dsret.Tables[0].Rows[0]["mobile"].ToString(), dsret.Tables[0].Rows[0]["prodid"].ToString(), dsret.Tables[0].Rows[0]["org_email"].ToString(), dsret.Tables[0].Rows[0]["totalamount"].ToString(), dsret.Tables[0].Rows[0]["city"].ToString(), dsret.Tables[0].Rows[0]["landmark"].ToString(), dsret.Tables[0].Rows[0]["pincode"].ToString(), dsret.Tables[0].Rows[0]["rstate"].ToString(),billingaddress);
                        obj.SendEmail(dsret.Tables[0].Rows[0]["org_email"].ToString(), msgretailer, "Order Confirmation Mail");

                        
                        string sms = "One Product has been sold form your store.";
                        if (dslog.Tables.Count > 0 && dslog.Tables[0].Rows.Count > 0)
                        {
                            obj.SendMessage(dslog.Tables[0].Rows[0]["mobile"].ToString(), sms);
                            obj.SendEmail(dslog.Tables[0].Rows[0]["LEmailAddress1"].ToString(), msgretailer, "Order Confirmation Mail");
                        }
                    }
                    

                    //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Order Successfully placed !');", true);
                    //redirect some where
                    Response.Redirect("MyOrder.aspx");
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
                        string cartid = "", qty = "";
                        for (int i = 0; i < dscart.Tables[0].Rows.Count; i++)
                        {
                            cartid += dscart.Tables[0].Rows[i]["cartid"].ToString() + ",";
                            qty += dscart.Tables[0].Rows[i]["quantity"].ToString() + ",";
                        }

                        string tid = obj.TransactionConfirmation(str[0], null, grandtotamt.ToString(), "Buywallet",cartid,"S",bal.ToString(), null,qty);

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


                        if(tid != "")
                        {
                            //send mail nd msg
                            string msg = "", msgretailer="";
                            msg = obj.createEmailBodyforConfirmOrder(tid, billingaddress, grandtotamt.ToString(), dscart, dscart.Tables[0].Rows[0]["Delivery_Amount"].ToString(), dscart.Tables[0].Rows[0]["coupon_amt"].ToString());
                            obj.SendEmail(dscart.Tables[0].Rows[0]["EmailId"].ToString(), msg, "Order Confirmation Mail");

                            DataSet dslog = obj.GetLogisticEmailndMobileInfo();
                            //send mail nd msg to logistic and retailer
                            string[] cart = cartid.Split(',');
                            for (int k = 0; k < cart.Length; k++)
                            {
                                DataSet dsret = obj.GetReatilerEmailndMobileInfo(cart[k]);
                                msgretailer = obj.createEmailBodyforRetailerndLogistic(tid, dsret.Tables[0].Rows[0]["raddress"].ToString(), dsret.Tables[0].Rows[0]["rname"].ToString(), dsret.Tables[0].Rows[0]["quantity"].ToString(), dsret.Tables[0].Rows[0]["headertitle"].ToString(), dsret.Tables[0].Rows[0]["mobile"].ToString(), dsret.Tables[0].Rows[0]["prodid"].ToString(), dsret.Tables[0].Rows[0]["org_email"].ToString(), dsret.Tables[0].Rows[0]["totalamount"].ToString(), dsret.Tables[0].Rows[0]["city"].ToString(), dsret.Tables[0].Rows[0]["landmark"].ToString(), dsret.Tables[0].Rows[0]["pincode"].ToString(), dsret.Tables[0].Rows[0]["rstate"].ToString(),billingaddress);
                                obj.SendEmail(dsret.Tables[0].Rows[0]["org_email"].ToString(), msgretailer, "Order Confirmation Mail");


                                string sms = "One Product has been sold form your store.";
                                if (dslog.Tables.Count > 0 && dslog.Tables[0].Rows.Count > 0)
                                {
                                    obj.SendMessage(dslog.Tables[0].Rows[0]["mobile"].ToString(), sms);
                                    obj.SendEmail(dslog.Tables[0].Rows[0]["LEmailAddress1"].ToString(), msgretailer, "Order Confirmation Mail");
                                }
                            }
                    

                            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Order Successfully placed !');", true);
                            //redirect some where
                            Response.Redirect("MyOrder.aspx");
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
                else
                    if (rbtnAddress.SelectedValue == "N")
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
    protected void rbtnAddress_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(rbtnAddress.SelectedIndex == 0)
        {

        }
        else
            if(rbtnAddress.SelectedIndex == 1)
        {

        }
        else
                if(rbtnAddress.SelectedIndex == 2)
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
            catch(Exception ex)
            {

            }
        }
    }
    
}