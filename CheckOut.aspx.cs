using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

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
                        lblTotAmt.Text = ds.Tables[0].Rows[0]["totalamount"].ToString();
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
            DataSet ds=obj.GetAllPincodeListfromLogistic();
            if(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
            string[] stringArray=ds.Tables[0].Rows[0]["pincodelist"].ToString().Split(',');
            string stringToCheck=txtPincode.Text.Trim();
            if(stringArray.Any(stringToCheck.Contains))
                {
            if(rbtnAddress.SelectedIndex == 0)
            {
                
                string totamt = "", deliveryamt = "150";
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
                if(txtAddress.Text.Trim() != "" && txtCity.Text.Trim() != "" && txtLandmark.Text.Trim() != "" && txtName.Text.Trim() != "" && txtPhone.Text.Trim() != "" && txtPincode.Text.Trim() != "" && txtState.Text.Trim() != "")
                {
                    string totamt="", deliveryamt = "250";
                    string[] usersid=Session["loginid"].ToString().Split(',');
                    totamt = usersid[2];
                    i = obj.UpdateUserNewAddress(usersid[0],txtName.Text,txtPhone.Text,txtAddress.Text,txtCity.Text,txtState.Text,txtPincode.Text,txtLandmark.Text,totamt,deliveryamt);
                    if(i > 0)
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
        catch(Exception ex)
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
}