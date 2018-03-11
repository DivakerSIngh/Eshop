using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using GoogleMaps.LocationServices;

public partial class CheckOut : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                try
                {
                    rbtnAddress.SelectedIndex = 0;
                    string[] usersid = Session["loginid"].ToString().Split(',');
                    obj = new DB();
                    DataSet ds = obj.GetCartInfoQtyNdAmt(usersid[0]);
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        lblQuantity.Text = ds.Tables[0].Rows[0]["qty"].ToString();
                        lblprice.Text = ds.Tables[0].Rows[0]["totalamount"].ToString();
                        lblCouponAmt.Text = ds.Tables[0].Rows[0]["Coupon_Amt"].ToString();
                        lblDeliveryAmt.Text = ds.Tables[0].Rows[0]["Delivery_Amount"].ToString();
                        lblTotAmt.Text = (Convert.ToDecimal(lblprice.Text) + Convert.ToDecimal(lblDeliveryAmt.Text) - Convert.ToDecimal(lblCouponAmt.Text)).ToString();
                    }
                    Load_DefaultAddress(usersid[0]);
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
                Server.Transfer("Login.aspx");
            }
        }
    }

    private void NewAddressUserInfo()
    {

        txtAddress.Enabled = true;
        txtCity.Enabled = true;
        txtLandmark.Enabled = true;
        txtName.Enabled = true;
        txtPhone.Enabled = true;
        txtPincode.Enabled = true;
        txtState.Enabled = true;

        txtState.Text = "";
        txtPincode.Text = "";
        txtPhone.Text = "";
        txtName.Text = "";
        txtLandmark.Text = "";
        txtCity.Text = "";
        txtAddress.Text = "";

    }

    private void Load_DefaultAddress(string userid)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetUserInfoforCheckout(userid);

            txtAddress.Enabled = false;
            txtCity.Enabled = false;
            txtLandmark.Enabled = false;
            txtName.Enabled = false;
            txtPhone.Enabled = false;
            txtPincode.Enabled = false;
            txtState.Enabled = false;

            txtState.Text = ds.Tables[0].Rows[0]["state"].ToString();
            txtPincode.Text = ds.Tables[0].Rows[0]["pincode"].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
            txtName.Text = ds.Tables[0].Rows[0]["name"].ToString();
            txtLandmark.Text = ds.Tables[0].Rows[0]["landmark"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
            txtAddress.Text = ds.Tables[0].Rows[0]["uaddress"].ToString();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }

    protected void btnNewAddDelivery_Command(object sender, CommandEventArgs e)
    {
        try
        {
            
            obj = new DB();
            int i = 0;
            int count = 0;
            DataSet ds = obj.GetAllPincodeListfromLogistic();
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string[] stringArray = ds.Tables[0].Rows[i]["pincodelist"].ToString().Split(',');
                    //string stringToCheck=txtPincode.Text.Trim();

                    string stringToCheck = txtPincode.Text;
                    string[] rPin = Session["RPin"].ToString().Split(',');
                    string[] pWt = Session["Wt"].ToString().Split(',');
                    if (stringArray.Any(stringToCheck.Contains) && stringArray.Any(rPin[0].Contains))
                    {
                        for (int j = 0; j < rPin.Length; j++)
                        {
                            //================================================================//
                            // latitude and longitude
                            var pincode1 = rPin[j];
                            var pincode2 = txtPincode.Text;
                            var locationService = new GoogleLocationService();
                            var point1 = locationService.GetLatLongFromAddress(pincode1);
                            var point2 = locationService.GetLatLongFromAddress(pincode2);
                            double distance = getDistanceUsinLongAndLat(point1.Latitude, point1.Longitude, point2.Latitude, point2.Longitude, 'K');
                            double wt = Convert.ToDouble(pWt[j]);
                            //=================================================================//

                            hf_logistic_id.Value = ds.Tables[0].Rows[i]["userid"].ToString();
                            hf_Delivery_Rate.Value = Convert.ToString(Convert.ToDecimal(hf_Delivery_Rate.Value) + getDeliveryAmt(hf_logistic_id.Value, wt, distance));
                        }
                        count += 1;
                        break;
                    }
                }

                //string[] stringArray = ds.Tables[0].Rows[0]["pincodelist"].ToString().Split(',');
                //string stringToCheck=txtPincode.Text.Trim();
                //string stringToCheck = "201301";
                if (count>0)
                {
                    if (rbtnAddress.SelectedIndex == 0)
                    {

                        string totamt = "", deliveryamt = hf_Delivery_Rate.Value;//"150";
                        string[] usersid = Session["loginid"].ToString().Split(',');
                        totamt = usersid[2];
                        i = obj.UpdateUserNewAddress(usersid[0], txtName.Text, txtPhone.Text, txtAddress.Text, txtCity.Text, txtState.Text, txtPincode.Text, txtLandmark.Text, totamt, deliveryamt);
                        if (i > 0)
                        {
                            Session["loginid"] = usersid[0] + "," + usersid[1] + "," + usersid[2] + "," + deliveryamt;
                            Response.Redirect("ConfirmOrder.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Cannot Checkout Please Try Later !');", true);
                        }

                    }
                    else
                    {
                        if (txtAddress.Text.Trim() != "" && txtCity.Text.Trim() != "" && txtLandmark.Text.Trim() != "" && txtName.Text.Trim() != "" && txtPhone.Text.Trim() != "" && txtPincode.Text.Trim() != "" && txtState.Text.Trim() != "")
                        {
                            string totamt = "", deliveryamt = hf_Delivery_Rate.Value;//"250";
                            string[] usersid = Session["loginid"].ToString().Split(',');
                            totamt = usersid[2];
                            i = obj.UpdateUserNewAddress(usersid[0], txtName.Text, txtPhone.Text, txtAddress.Text, txtCity.Text, txtState.Text, txtPincode.Text, txtLandmark.Text, totamt, deliveryamt);
                            if (i > 0)
                            {
                                Session["loginid"] = usersid[0] + "," + usersid[1] + "," + usersid[2] + "," + deliveryamt;
                                Response.Redirect("ConfirmOrder.aspx");
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Cannot Checkout Please Try Later !');", true);
                            }


                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('All Fields are compulsory !');", true);
                        }
                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Delivery of products not available at provided pincode.Please change Pincode !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('No Pincode Avialable from Logistic to check !');", true);
            }
        }
        catch (Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {

    }
    protected void rbtnAddress_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (rbtnAddress.SelectedValue == "D")
        {
            string[] usersid = Session["loginid"].ToString().Split(',');
            Load_DefaultAddress(usersid[0]);
        }
        else
        {
            NewAddressUserInfo();
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

    private decimal getDeliveryAmt(string logistic_id, double wt, double distance)
    {
        obj = new DB();
        DataSet ds = obj.getDeliveryAmt(logistic_id, wt, distance);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            return Convert.ToDecimal(ds.Tables[0].Rows[0][0]);
        }
        else
        {
            return 0;
        }

    }
}