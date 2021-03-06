﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using GoogleMaps.LocationServices;
using System.Threading;

public partial class SingleProdInfo : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["loginid"] != null)
            {
              var str=  Convert.ToString(Session["loginid"]);
                
                if (str.Contains(","))
                {
                    hdnProductStatusid.Value = new DB().getLastPurchaseProductId(Convert.ToString(str.Split(',')[0]), "N");

                }else
                {
                    hdnProductStatusid.Value = new DB().getLastPurchaseProductId(Convert.ToString(Session["loginid"]), "N");
                }

            }

            if (Request.QueryString["pid"] != null && Request.QueryString["pid"].ToString() != "")
            {
                hf_ddl_Value.Value = "0";
                load_image(Request.QueryString["pid"].ToString());
                load_ProdInfo(Request.QueryString["pid"].ToString());

                if(Request.QueryString["p"]!=null)
                {
                    hf_CheckPin.Value = Request.QueryString["p"].ToString();
                    ViewState["delAmt"] = Request.QueryString["r"].ToString();
                    ViewState["CheckPin"]= Request.QueryString["p"].ToString();
                    ViewState["lid"]= Request.QueryString["l"].ToString();
                }
            }
        }
        if (Session["loginid"] != null)
        {
            var str = Convert.ToString(Session["loginid"]);

            if (str.Contains(","))
            {
                hdnProductStatusid.Value = new DB().getLastPurchaseProductId(Convert.ToString(str.Split(',')[0]), "N");

            }
            else
            {
                hdnProductStatusid.Value = new DB().getLastPurchaseProductId(Convert.ToString(Session["loginid"]), "N");
            }

        }
    }

    [WebMethod]
    public static List<Review> getReviewList(string productId)
    {
        return new DB().getAllReview(productId);
    }

    private void load_ProdInfo(string pid)
    {
        try
        {

            obj = new DB();
            DataSet ds = obj.GetProtducsInfo(Request.QueryString["pid"].ToString()); //.fillDataSet("select top 1 pd.PId,pd.HeaderTitle,pd.SellingPrice,pd.CostPrice,pd.PDescription,pd.Discount,pd.title1,pd.value1,pd.title2,pd.value2,pd.title3,pd.value3,pd.title4,pd.value4,pd.title5,pd.value5,pd.title6,pd.value6,pd.title7,pd.value7,pd.title8,pd.value8,pd.title9,pd.Value9,pd.Title10,pd.value10,pimg.PImage from productdescription as pd inner join productimage as pimg on pd.Pid=pimg.Pid");
            dlProdInfo.DataSource = ds.Tables[0];
            dlProdInfo.DataBind();
            ddlProdDetail.DataSource = ds.Tables[0];
            ddlProdDetail.DataBind();


            //DataSet ds2 = new DataSet();
            //for (int i = 1; i < 8;i++)
            //    ds2.Merge(ds);


        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }

    private void load_image(string pid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetProductImage(pid);

            //the following can be improved by adding a
            //new method to get image types
            //byte[] imgArray = ;
            //logoImg.Src =  Convert.ToBase64String(imgArray);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                switch (i)
                {
                    case 0:
                        img1.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);
                        img11.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);
                        img1.Visible = true;
                        break;

                    case 1:
                        img2.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[1][0]);
                        img12.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[1][0]);
                        img2.Visible = true;
                        break;

                    case 2:
                        img3.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[2][0]);
                        img13.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[2][0]);
                        img3.Visible = true;
                        break;

                    case 3:
                        img4.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[3][0]);
                        img14.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[3][0]);
                        img4.Visible = true;
                        break;
                }

            }

            //img1.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);
            //img11.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0][0]);


            //img2.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[1][0]);
            //img12.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[1][0]);

            //img3.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[2][0]);
            //img13.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[2][0]);


            //img4.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[3][0]);
            //img14.Attributes["data-thumb"] = "data:image/png;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[3][0]);




        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }

    protected void btnAddCart_Command1(object sender, CommandEventArgs e)
    {
        try
        {
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                string[] commandArgs = ((LinkButton)sender).CommandArgument.ToString().Split(new char[] { ',' });
                string pid = commandArgs[0];
                string rid = commandArgs[1];
                string amt = commandArgs[2];
                string costprice = commandArgs[3];
                string discount = (Convert.ToDecimal(costprice) - Convert.ToDecimal(amt)).ToString("0.00");
                string qty = "1";
                string deliveryamt = ViewState["delAmt"]==null ? "0" : ViewState["delAmt"].ToString();// hf_deliveryAmt.Value;//"150";
                string lid = ViewState["lid"]==null ? "0" : ViewState["lid"].ToString(); //hf_logistic_id.Value;
                string User_Shipping_Chrg = Session["User_Shipping_Chrg"] == null ? "0" : Session["User_Shipping_Chrg"].ToString();

                obj = new DB();
                string size = "";
                LinkButton btnAddToCart = (LinkButton)sender;
                DataListItem item = (DataListItem)btnAddToCart.NamingContainer;
                var ddlsize = (DropDownList)item.FindControl("ddlsize");
                if (ddlsize.Visible == true)
                {
                    size = ddlsize.SelectedValue;
                }
                string[] str = Session["loginid"].ToString().Split(',');
                int i = obj.AddNewCartProdInfo(pid, str[0], rid, amt, size, costprice, discount, qty, deliveryamt, lid, User_Shipping_Chrg);
                if (i > 0)
                {
                    //this.Master.cartCount = (Convert.ToInt32(this.Master.cartCount) + 1).ToString();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "setValueToCardButton()", true);
                    // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Item Successfully added in Cart !');", true);
                    //string p = ((Label)Master.FindControl("lblcountcart")).Text;
                    //((Label)Master.FindControl("lblcountcart")).Text = (Convert.ToInt32(((Label)Master.FindControl("lblcountcart")).Text) + 1).ToString();
                    //Button btncart = ddlPrdoDescription.FindControl("btnAddToCart") as Button;
                    //btncart.Enabled = false;
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Item Successfully added in Cart !');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Item Already added in cart !');", true);
                }
            }
            else
            {
                string pid = Request.QueryString["pid"].ToString();
                string damt = ViewState["delAmt"] == null ? "0" : ViewState["delAmt"].ToString();
                string pincode = ViewState["CheckPin"] == null ? "0" : ViewState["CheckPin"].ToString();
                string lid = ViewState["lid"] == null ? "0" : ViewState["lid"].ToString();
                //Context.ApplicationInstance.CompleteRequest();
                Response.Redirect("Login.aspx?flag=SP&pid=" + pid + "&p=" + pincode + "&r=" + damt + "&l=" + lid + "", false);
                //Server.Execute("Login.aspx",false);
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
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                string[] commandArgs = ((LinkButton)sender).CommandArgument.ToString().Split(new char[] { ',' });
                string pid = commandArgs[0];
                string rid = commandArgs[1];
                string amt = commandArgs[2];

                obj = new DB();
                string size = "";
                LinkButton btnAddToCart = (LinkButton)sender;
                DataListItem item = (DataListItem)btnAddToCart.NamingContainer;
                var ddlsize = (DropDownList)item.FindControl("ddlsize");
                if (ddlsize.Visible == true)
                {
                    size = ddlsize.SelectedValue;
                }
                int i = obj.AddNewProdInfotoWishlist(pid, Session["loginid"].ToString(), rid, amt, size);
                if (i > 0)
                {
                    //string p = ((Label)Master.FindControl("lblcountcart")).Text;
                    //((Label)Master.FindControl("lblcountcart")).Text = (Convert.ToInt32(((Label)Master.FindControl("lblcountcart")).Text) + 1).ToString();
                    ////Button btncart = ddlPrdoDescription.FindControl("btnAddToCart") as Button;
                    //btncart.Enabled = false;
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Cannot Add Product Try Later !');", true);
                }

            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
        catch (Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }
    protected  void btnCheckPincode_Command(object sender, CommandEventArgs e)
    {
        START:
        try
        {
            obj = new DB();
            int i = 0;
            int count = 0;
            //var txtRpin = (TextBox)sender;
            string UserPincode = "";
            double weight = 0.00;
            int cid = 0;
            double selling_price = 0;
            foreach (DataListItem item in this.dlProdInfo.Items)
            {
                UserPincode = (item.FindControl("txtLocation") as TextBox).Text;
                weight = Convert.ToDouble((item.FindControl("lblWt") as Label).Text);
                cid = Convert.ToInt32((item.FindControl("lblcid") as Label).Text);
                selling_price = Convert.ToDouble((item.FindControl("lblSP") as Label).Text);
            }
            //TextBox txtuserpin = (TextBox)dlProdInfo.FindControl("txtLocation");
            //string ddl_selectedvalue = ((TextBox)txtRpin.NamingContainer.FindControl("txtLocation")).Text.Trim();
            
            string retailer_pincode = e.CommandArgument.ToString();
            DataSet ds = obj.GetAllPincodeListfromLogistic();
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string[] stringArray = ds.Tables[0].Rows[i]["pincodelist"].ToString().Split(',');
                    //string stringToCheck=txtPincode.Text.Trim();

                    string stringToCheck = UserPincode;
                    string dist = "0";
                    if (stringArray.Any(stringToCheck.Contains) && stringArray.Any(retailer_pincode.Contains))
                    {
                        hf_logistic_id.Value = ds.Tables[0].Rows[i]["userid"].ToString();
                        double distance = 0;
                        DataSet ds1 = new DataSet();
                        ds1 = obj.getLatitudeLongitude(UserPincode, retailer_pincode);
                        if(ds1.Tables[0].Rows.Count>0 && !string.IsNullOrEmpty(ds1.Tables[0].Rows[0][0].ToString()))
                        {
                            double user_lat = Convert.ToDouble(ds1.Tables[0].Rows[0]["USER_LATITUDE"].ToString());
                            double user_lon = Convert.ToDouble(ds1.Tables[0].Rows[0]["USER_LONGITUDE"].ToString());
                            double r_lat = Convert.ToDouble(ds1.Tables[0].Rows[0]["R_LATITUDE"].ToString());
                            double r_lon = Convert.ToDouble(ds1.Tables[0].Rows[0]["R_LONGITUDE"].ToString());
                            distance = getDistanceUsinLongAndLat(r_lat, r_lon, user_lat, user_lon, 'K');
                            dist = String.Format("{0:0.00}", distance);
                        }
                        else
                        {
                            //================================================================//
                            // latitude and longitude
                            var locationService = new GoogleLocationService();
                            var point1 = locationService.GetLatLongFromAddress(retailer_pincode);
                            var point2 = locationService.GetLatLongFromAddress(UserPincode);
                            obj.pushLatitudeLongitude(retailer_pincode, Convert.ToDecimal(point1.Latitude), Convert.ToDecimal(point1.Longitude));
                            obj.pushLatitudeLongitude(UserPincode, Convert.ToDecimal(point2.Latitude), Convert.ToDecimal(point2.Longitude));
                            distance = getDistanceUsinLongAndLat(point1.Latitude, point1.Longitude, point2.Latitude, point2.Longitude, 'K');
                            dist = String.Format("{0:0.00}", distance);
                            //=================================================================//
                        }

                        hf_CheckPin.Value = UserPincode;
                        ViewState["CheckPin"]= UserPincode;
                        hf_deliveryAmt.Value = Convert.ToString(getDeliveryAmt(hf_logistic_id.Value, weight, Convert.ToDouble(dist)));
                        ViewState["lid"] = hf_logistic_id.Value;
                        ViewState["delAmt"] = hf_deliveryAmt.Value;
                        if (cid != 1)
                        {
                            if (distance <= 12)
                            {
                                if(selling_price<500)
                                {
                                    Session["User_Shipping_Chrg"] = "49";
                                }
                                else
                                {
                                    Session["User_Shipping_Chrg"] = "0";
                                }
                                count += 1;
                            }
                            else
                            {
                                Session["User_Shipping_Chrg"] = "0";
                                hf_CheckPin.Value = "";
                                ViewState["CheckPin"] = "";
                                hf_deliveryAmt.Value = "0";
                                ViewState["lid"] = "";
                                ViewState["delAmt"] = "0";
                            }
                        }
                        else
                        {
                            if (selling_price < 500)
                            {
                                Session["User_Shipping_Chrg"] = "49";
                            }
                            else
                            {
                                Session["User_Shipping_Chrg"] = "0";
                            }
                            count += 1;
                        }
                        
                        break;
                    }
                    else
                    {
                        if (cid == 1)
                        {
                            hf_logistic_id.Value = ds.Tables[0].Rows[i]["userid"].ToString();
                            double distance = 0;
                            DataSet ds1 = new DataSet();
                            ds1 = obj.getLatitudeLongitude(UserPincode, retailer_pincode);
                            if (ds1.Tables[0].Rows.Count > 0 && !string.IsNullOrEmpty(ds1.Tables[0].Rows[0][0].ToString()))
                            {
                                double user_lat = Convert.ToDouble(ds1.Tables[0].Rows[0]["USER_LATITUDE"].ToString());
                                double user_lon = Convert.ToDouble(ds1.Tables[0].Rows[0]["USER_LONGITUDE"].ToString());
                                double r_lat = Convert.ToDouble(ds1.Tables[0].Rows[0]["R_LATITUDE"].ToString());
                                double r_lon = Convert.ToDouble(ds1.Tables[0].Rows[0]["R_LONGITUDE"].ToString());
                                distance = getDistanceUsinLongAndLat(r_lat, r_lon, user_lat, user_lon, 'K');
                                dist = String.Format("{0:0.00}", distance);
                            }
                            else
                            {
                                //================================================================//
                                // latitude and longitude
                                var locationService = new GoogleLocationService();
                                var point1 = locationService.GetLatLongFromAddress(retailer_pincode);
                                var point2 = locationService.GetLatLongFromAddress(UserPincode);
                                obj.pushLatitudeLongitude(retailer_pincode, Convert.ToDecimal(point1.Latitude), Convert.ToDecimal(point1.Longitude));
                                obj.pushLatitudeLongitude(UserPincode, Convert.ToDecimal(point2.Latitude), Convert.ToDecimal(point2.Longitude));
                                distance = getDistanceUsinLongAndLat(point1.Latitude, point1.Longitude, point2.Latitude, point2.Longitude, 'K');
                                dist = String.Format("{0:0.00}", distance);
                                //=================================================================//
                            }

                            hf_CheckPin.Value = UserPincode;
                            ViewState["CheckPin"] = UserPincode;
                            hf_deliveryAmt.Value = Convert.ToString(getDeliveryAmt(hf_logistic_id.Value, weight, Convert.ToDouble(dist)));
                            ViewState["lid"] = hf_logistic_id.Value;
                            ViewState["delAmt"] = hf_deliveryAmt.Value;

                            if (selling_price < 500)
                            {
                                Session["User_Shipping_Chrg"] = "49";
                            }
                            else
                            {
                                Session["User_Shipping_Chrg"] = "0";
                            }
                            count += 1;
                            break;
                        }
                    }
                }
                if (count > 0)
                {
                    hdnWeight.Value = weight.ToString();
                    foreach (DataListItem item in this.dlProdInfo.Items)
                    {
                        Label lblmsg = (item.FindControl("lblPincodeMsg") as Label);
                        lblmsg.Visible = true;
                        lblmsg.Text = "This Product available on your Location";
                        lblmsg.ForeColor = System.Drawing.Color.ForestGreen;
                    }
                }
                else
                {
                    foreach (DataListItem item in this.dlProdInfo.Items)
                    {
                        Label lblmsg = (item.FindControl("lblPincodeMsg") as Label);
                        lblmsg.Visible = true;
                        lblmsg.Text = "Sorry This Product Not available on your Location";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    
                }

            }
        }
        catch (Exception ex)
        {
            if (ex.Message == "Request Not Authorized or Over QueryLimit")
            {
                Thread.Sleep(200);
                goto START;
            }
        }
    }

    

    protected void btnview_Command(object sender, CommandEventArgs e)
    {
        string pid = e.CommandArgument.ToString();
        Response.Redirect("SingleProdInfo.aspx?pid=" + pid);
    }
    protected void dlProdInfo_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var myDropDownList = e.Item.FindControl("ddlsize") as DropDownList;

            var myrecommendprodlist = e.Item.FindControl("lblcid") as Label;
            var hdnSubCid = e.Item.FindControl("hdnSubCid") as HiddenField;

            if (myrecommendprodlist.Text != "")
            {
                DataSet dss = obj.GetProducts(hdnSubCid.Value, null, myrecommendprodlist.Text, null);
                gvRecommendedProd.DataSource = dss.Tables[0];

                gvRecommendedProd.DataBind();
            }
            //int currentItemID = int.Parse(this.ddlPrdoDescription.DataKeys[e.Item.ItemIndex].ToString());

            if (Request.QueryString["pid"] != null && Request.QueryString["pid"].ToString() != "")
            {
                //DataSet ds = obj.fillDataSet("select MFlag,Measurement from productdescription where PId=" +Request.QueryString["pid"].ToString());
                //if (ds.Tables[0].Rows.Count > 0)
                //{
                //    if (ds.Tables[0].Rows[0]["MFlag"].ToString() != "0")
                //    {
                //        myDropDownList.Visible = true;
                //        string[] sizelist = ds.Tables[0].Rows[0]["Measurement"].ToString().Split(',');


                //        for (int i = 0; i < sizelist.Length; i++)
                //        {
                //            myDropDownList.Items.Add(new ListItem(sizelist[i], sizelist[i]));
                //        }
                //        myDropDownList.DataSource = null; //GetDDLDataSource(currentItemID);
                //        myDropDownList.DataBind();
                //    }
                //    else
                //        myDropDownList.Visible = false;
                //}
                if (myDropDownList.Items.Count == 0)
                {
                    DataSet ds = obj.fillDataSet("select id,[measurementTitle] from ProductMeasurementMapping where productid=" + Request.QueryString["pid"].ToString() + " and cast([measurementLeftQuantity] as int)>0 order by cast([measurementSellingPrice] as float)");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        myDropDownList.Visible = true;
                        myDropDownList.DataTextField = "measurementTitle";
                        myDropDownList.DataValueField = "id";
                        myDropDownList.DataSource = ds.Tables[0];
                        myDropDownList.DataBind();
                        if (!string.IsNullOrEmpty(hf_ddl_Value.Value))
                            myDropDownList.SelectedValue = hf_ddl_Value.Value;
                    }
                    else
                    {
                        myDropDownList.Visible = false;
                    }
                }
                else
                {
                    DataSet ds = obj.fillDataSet("select id,[measurementTitle] from ProductMeasurementMapping where productid=" + Request.QueryString["pid"].ToString() + " and cast([measurementLeftQuantity] as int)>0");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        myDropDownList.Visible = true;
                        myDropDownList.DataTextField = "measurementTitle";
                        myDropDownList.DataValueField = "id";
                        myDropDownList.DataSource = ds.Tables[0];
                        myDropDownList.DataBind();
                        myDropDownList.SelectedValue = hf_ddl_Value.Value;
                    }
                    else
                    {
                        myDropDownList.Visible = false;
                    }
                }
            }
        }
    }

    protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            var ddl = (DropDownList)sender;
            string ddl_selectedvalue = ((DropDownList)ddl.NamingContainer.FindControl("ddlSize")).SelectedValue;
            hf_ddl_Value.Value = ddl_selectedvalue;
            obj = new DB();
            DataSet ds = obj.GetProtducsInfoRebind(Convert.ToInt64(ddl_selectedvalue)); //.fillDataSet("select top 1 pd.PId,pd.HeaderTitle,pd.SellingPrice,pd.CostPrice,pd.PDescription,pd.Discount,pd.title1,pd.value1,pd.title2,pd.value2,pd.title3,pd.value3,pd.title4,pd.value4,pd.title5,pd.value5,pd.title6,pd.value6,pd.title7,pd.value7,pd.title8,pd.value8,pd.title9,pd.Value9,pd.Title10,pd.value10,pimg.PImage from productdescription as pd inner join productimage as pimg on pd.Pid=pimg.Pid");
            dlProdInfo.DataSource = ds.Tables[0];
            dlProdInfo.DataBind();
            //ddlProdDetail.DataSource = ds.Tables[0];
            //ddlProdDetail.DataBind();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }

    private double getDistanceUsinLongAndLat(double lat1, double lon1, double lat2, double lon2, char unit)
    {
        double theta = lon1 - lon2;
        double dist = Math.Sin(deg2rad(lat1)) * Math.Sin(deg2rad(lat2)) + Math.Cos(deg2rad(lat1)) * Math.Cos(deg2rad(lat2)) * Math.Cos(deg2rad(theta));
        dist = Math.Acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        if (unit == 'K')
        {
            dist = dist * 1.609344;
        }
        else if (unit == 'N')
        {
            dist = dist * 0.8684;
        }
        return (dist);
    }

    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::  This function converts decimal degrees to radians             :::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    private double deg2rad(double deg)
    {
        return (deg * Math.PI / 180.0);
    }

    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::  This function converts radians to decimal degrees             :::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    private double rad2deg(double rad)
    {
        return (rad / Math.PI * 180.0);
    }

    private decimal getDeliveryAmt(string logistic_id,double wt,double distance)
    {
        obj = new DB();
        DataSet ds = obj.getDeliveryAmt(logistic_id, wt, distance);
        if(ds!=null && ds.Tables[0].Rows.Count>0)
        {
            return Convert.ToDecimal(ds.Tables[0].Rows[0][0]);
        }
        else
        {
            return 0;
        }
        
    }
}