using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.HtmlControls;
public partial class CartInfo : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                try
                {
                    lblCartNum.Text = ((Label)Master.FindControl("lblcountcart")).Text;
                    // ((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Logout";
                    pnlMsg.Visible = false;
                    string[] usersid = Session["loginid"].ToString().Split(',');
                    load_gv(usersid[0]);
                    obj = new DB();
                    DataSet ds = obj.GetCartCouponCountInfo(usersid[0]);
                    rbtnCouponType.SelectedIndex = 0;
                    pnlApplyCoupon.Visible = false;
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0][0].ToString() == "0")
                    {
                        btnUseCoupon.Text = "Apply Coupon";
                        btnUseCoupon.Enabled = true;
                    }
                    else
                    {
                        btnUseCoupon.Text = "Coupon Applied";
                        btnUseCoupon.Enabled = false;

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
        else
        {
            Server.Transfer("Login.aspx");
        }

    }

    private void load_gv(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetCartAllProductList(userid);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                btnApplyCoupon.Visible = true;
                btnPlaceOrder.Visible = true; btnUseCoupon.Visible = true;

                //DataSet dss = obj.GetCartInfoQtyNdAmt(userid);
                rptCart.DataSource = ds.Tables[0];
                rptCart.DataBind();
                lblCartNum.Text = "My Cart(" + ds.Tables[0].Rows.Count.ToString() + ")";

                int qty = 0, qty1 = 0;
                decimal mrp_amt = 0, discount = 0, price_amt = 0;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    qty += Convert.ToInt32(ds.Tables[0].Rows[i]["cquantity"].ToString());
                    qty1 = Convert.ToInt32(ds.Tables[0].Rows[i]["cquantity"].ToString());
                    mrp_amt += Convert.ToDecimal(ds.Tables[0].Rows[i]["costprice"].ToString()) * qty1;
                    discount += Convert.ToDecimal(ds.Tables[0].Rows[i]["discount_price"].ToString()) * qty1;
                    price_amt += Convert.ToDecimal(ds.Tables[0].Rows[i]["sellingprice"].ToString()) * qty1;
                }

                lblQuantity1.Text = qty.ToString();
                lblMrpAmpt.Text = mrp_amt.ToString();
                lblDiscount.Text = discount.ToString();
                lblDeleiveryCharge.Text = ds.Tables[0].Rows[0]["Delivery_Amount"].ToString();
                lblPriceAmt.Text = price_amt.ToString();
                lblCouponDiscount.Text = ds.Tables[0].Rows[0]["Coupon_Amt"].ToString();

                //lblQuantity.Text = dss.Tables[0].Rows[0]["qty"].ToString();
                //lblQuantity1.Text = dss.Tables[0].Rows[0]["qty"].ToString();
                //lblMrpAmpt.Text = dss.Tables[0].Rows[0]["costprice"].ToString();
                //lblDiscount.Text = dss.Tables[0].Rows[0]["discount"].ToString();
                //lblDeleiveryCharge.Text = dss.Tables[0].Rows[0]["Delivery_Amount"].ToString();
                //lblPriceAmt.Text = dss.Tables[0].Rows[0]["PriceAmount"].ToString();
                //lblCouponDiscount.Text = dss.Tables[0].Rows[0]["Coupon_Amt"].ToString();
                //decimal amt = 0;
                //for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                //{
                //    amt += Convert.ToDecimal(ds.Tables[0].Rows[i]["sellingprice"].ToString()) * Convert.ToDecimal(ds.Tables[0].Rows[i]["cquantity"].ToString());
                //}
                //lblPriceAmt.Text = dss.Tables[0].Rows[0]["totalamount"].ToString();
                lblTotAmt.Text = ((Convert.ToDecimal(lblMrpAmpt.Text) - (Convert.ToDecimal(lblDiscount.Text) + Convert.ToDecimal(lblCouponDiscount.Text))) + Convert.ToDecimal(lblDeleiveryCharge.Text)).ToString(); //dss.Tables[0].Rows[0]["totalamount"].ToString();

                lblSaveAmt.Text = "You have saved amount : " + (Convert.ToDecimal(lblMrpAmpt.Text) - Convert.ToDecimal(lblPriceAmt.Text)).ToString();
                lblSaveAmt.ForeColor = System.Drawing.Color.DarkGreen;
                string usersid = Session["loginid"].ToString() + "," + ds.Tables[0].Rows.Count.ToString() + "," + lblTotAmt.Text;//dss.Tables[0].Rows[0]["totalamount"].ToString();
                Session["loginid"] = usersid;
            }
            else
            {
                pnlApplyCoupon.Visible = false;
                btnApplyCoupon.Visible = false;
                btnPlaceOrder.Visible = false;
                btnUseCoupon.Visible = false;
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

    protected void btnAddWishList_Command(object sender, CommandEventArgs e)
    {
        try
        {
            string cartid = e.CommandArgument.ToString();
            obj = new DB();
            int i = obj.MoveProductfromCarttoWishlist(cartid);
            if (i > 0)
            {
                string[] str = Session["loginid"].ToString().Split(',');
                Response.Redirect("CartInfo.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Cannot Remove Product Try Later !');", true);
            }
        }
        catch (Exception ex)
        { }
        finally
        { obj = null; }
    }
    protected void btnRemove_Command(object sender, CommandEventArgs e)
    {
        try
        {
            string cartid = e.CommandArgument.ToString();
            obj = new DB();
            string[] str = Session["loginid"].ToString().Split(',');
            int i = obj.DeleteProductfromCart(cartid);
            if (i > 0)
            {
                //load_gv(str[0]);
                Response.Redirect("CartInfo.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Cannot Remove Product Try Later !');", true);
            }
        }
        catch (Exception ex)
        { }
        finally
        { obj = null; }
    }
    protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
        {

            var image = (HtmlImage)e.Item.FindControl("imgprod");
            var pid = (Label)e.Item.FindControl("lblpid");
            var cartid = (Label)e.Item.FindControl("lblCartId");
            var qty = (TextBox)e.Item.FindControl("txtQuantity");
            DataSet ds = obj.GetProductImage(pid.Text);
            DataSet dss = obj.GetCartProdQty(cartid.Text);
            qty.Text = dss.Tables[0].Rows[0]["quantity"].ToString();

            image.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);

        }
    }
    protected void btnPlaceOrder_Command(object sender, CommandEventArgs e)
    {
        try
        {
            obj = new DB();
            int i = 0;
            string RetailerPin = "";
            string weight = "";
            foreach (RepeaterItem item in rptCart.Items)
            {
                Label lblPin = item.FindControl("lblRetalorPin") as Label;
                Label lblWt = item.FindControl("lblWt") as Label;
                RetailerPin = RetailerPin + "," + lblPin.Text;
                weight = weight + "," + lblWt.Text;

                Label lab = item.FindControl("lblCartId") as Label;
                Label labsp = item.FindControl("lblSP") as Label;
                string cartid = lab.Text;
                TextBox lab1 = item.FindControl("txtQuantity") as TextBox;
                string quantity = lab1.Text;
                decimal amt = Convert.ToDecimal(labsp.Text) * Convert.ToDecimal(quantity);
                i = obj.UpdateQuantityInCartInfo(cartid, quantity, amt.ToString());

            }
            if (i > 0)
            {
                string finalRPin = RetailerPin.Remove(0, 1);
                string finalWt = weight.Remove(0, 1);
                Session["RPin"] = finalRPin;
                Session["Wt"] = finalWt;
                Response.Redirect("CheckOut.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Server Error occurred Try Later !');", true);
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
    protected void btnContinueShopping_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/ViewProducts.aspx?cid=1");
    }
    protected void btnDecreQty_Command(object sender, CommandEventArgs e)
    {
        string cartid = e.CommandArgument.ToString();
        //TextBox textBox = sender as TextBox;
        //if (textBox != null)
        //{
        //    string theText = textBox.Text;
        //    var item = (RepeaterItem)textBox.NamingContainer;
        //    if (item != null)
        //    {
        //        TextBox titleLabel = (TextBox)item.FindControl("txtQuantity");
        //        if (titleLabel != null)
        //        {
        //            titleLabel.Text = theText;
        //        }
        ////    }
        //}
    }
    protected void btnIncreQty_Command(object sender, CommandEventArgs e)
    {
        string cartid = e.CommandArgument.ToString();
    }
    protected void btnUseCoupon_Command(object sender, CommandEventArgs e)
    {
        if (btnUseCoupon.Text == "Apply Coupon")
        {
            pnlApplyCoupon.Visible = true;
            btnUseCoupon.Enabled = false;
        }
        else
        {
            pnlApplyCoupon.Visible = false;
            btnUseCoupon.Enabled = false;
        }
    }
    protected void btnApplyCoupon_Command(object sender, CommandEventArgs e)
    {
        try
        {
            obj = new DB();
            if (txtCouponId.Text.Trim() != "")
            {
                if (rbtnCouponType.SelectedIndex == 0)
                {
                    string[] usersid = Session["loginid"].ToString().Split(',');
                    DataSet ds = obj.VerifyCoupon(usersid[0], txtCouponId.Text, "G");
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        int i = obj.ApplyCouponIDonCart(usersid[0], txtCouponId.Text, "100");
                        if (i > 0)
                        {
                            lblCouponDiscount.Text = "100";
                            lblTotAmt.Text = (Convert.ToDecimal(lblTotAmt.Text) - Convert.ToDecimal(lblCouponDiscount.Text)).ToString();
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Coupon Applied Successfully !');", true);
                            txtCouponId.Text = "";
                            pnlApplyCoupon.Visible = false;
                            btnUseCoupon.Enabled = false;
                            btnUseCoupon.Text = "Coupon Applied";
                        }
                        else
                        {
                            txtCouponId.Text = "";
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Cannot Apply Coupon Server error occured !');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Invalid Coupon Id !');", true);
                    }
                }
                else
                {
                    string[] usersid = Session["loginid"].ToString().Split(',');
                    DataSet dss = obj.VerifyCoupon(usersid[0], txtCouponId.Text, "P");
                    if (dss.Tables.Count > 0 && dss.Tables[0].Rows.Count > 0)
                    {
                        int i = obj.ApplyCouponIDonCart(usersid[0], txtCouponId.Text, "500");
                        if (i > 0)
                        {
                            lblCouponDiscount.Text = "500";
                            lblTotAmt.Text = (Convert.ToDecimal(lblTotAmt.Text) - Convert.ToDecimal(lblCouponDiscount.Text)).ToString();
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Coupon Applied Successfully !');", true);
                            txtCouponId.Text = "";
                            pnlApplyCoupon.Visible = false;
                            btnUseCoupon.Enabled = false;
                            btnUseCoupon.Text = "Coupon Applied";
                        }
                        else
                        {
                            txtCouponId.Text = "";
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Cannot Apply Coupon Server error occured !');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Invalid Coupon Id !');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Enter Coupon Id !');", true);
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

    protected void btnDecryment_Command(object sender, CommandEventArgs e)
    {
        obj = new DB();
        string cartid = e.CommandArgument.ToString().Split(',')[0];
        string qty = e.CommandArgument.ToString().Split(',')[1];
        string sellingPrice = e.CommandArgument.ToString().Split(',')[2];
        string costPrice = e.CommandArgument.ToString().Split(',')[3];

        int i = 0;
        
        if (Convert.ToInt32(qty) > 1)
        {
            int quantity = Convert.ToInt32(qty) - 1;
            decimal amt = (Convert.ToDecimal(sellingPrice) * quantity);
            i = obj.UpdateQuantityInCartInfo(cartid, quantity.ToString(), amt.ToString());

            string[] usersid = Session["loginid"].ToString().Split(',');
            load_gv(usersid[0]);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Quantity could not be less than 1');", true);
        }
    }

    protected void btnIncrease_Command(object sender, CommandEventArgs e)
    {

        //decimal mrpAmount = 0;
        ////decimal discount = 0;
        //decimal sellingprice = 0;
        obj = new DB();

        string cartid = e.CommandArgument.ToString().Split(',')[0];
        string qty = e.CommandArgument.ToString().Split(',')[1];
        string sellingPrice = e.CommandArgument.ToString().Split(',')[2];
        string costPrice = e.CommandArgument.ToString().Split(',')[3];

        int i = 0;
        int quantity = Convert.ToInt32(qty) + 1;
        decimal amt = (Convert.ToDecimal(sellingPrice) * quantity);
        i = obj.UpdateQuantityInCartInfo(cartid, quantity.ToString(), amt.ToString());

        string[] usersid = Session["loginid"].ToString().Split(',');
        load_gv(usersid[0]);
        //mrpAmount += Convert.ToDecimal(lblCP.Text);
        //sellingprice += Convert.ToDecimal(labsp.Text);
        //discount+= Convert.ToDecimal(lblCP.Text)- Convert.ToDecimal(labsp.Text);
        //lblMrpAmpt.Text = mrpAmount.ToString();
        //lblDiscount.Text = (mrpAmount - sellingprice).ToString();
        //lblPriceAmt.Text = sellingprice.ToString();
        ////lblCouponDiscount.Text
        ////lblDeleiveryCharge.Text
        //lblTotAmt.Text = (sellingprice + Convert.ToDecimal(lblDeleiveryCharge.Text) - Convert.ToDecimal(lblCouponDiscount.Text)).ToString();

    }
}