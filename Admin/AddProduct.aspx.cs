using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

public partial class Retailor_AddProduct : System.Web.UI.Page
{
    DB obj;
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                bindBrand();
                bindRetailer();
                Session["list"] = null;
                ddlSubCategory.Visible = false;
                ddlGender.Visible = false;
                //fill_ddl_Subcategory();

                if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString() == "U")
                {
                    btnProdSubmit.Text = "Update";
                    //btnProdSubmit.Enabled = false;
                    load_data_to_update();
                }
                else
                {
                    btnProdSubmit.Text = "Submit";
                    btnProdSubmit.Enabled = true;
                }
            }
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
        }

    }

    [WebMethod]
    public static List<Brand> getBrands(string brandName)
    {
        List<Brand> empObj = new List<Brand>();
        var obj = new DB();
        return obj.getAllBrands(brandName);

    }
    private void bindBrand()
    {
        obj = new DB();
        var lst=  obj.bindBrand();
        //ddlBrand.DataSource = lst;
        //ddlBrand.DataValueField = "id";
        //ddlBrand.DataTextField = "brandName";
        //ddlBrand.DataBind();

    }
    private void bindRetailer()
    {
        obj = new DB();
        var lst = obj.bindRetailer();
        ddlRetailer.DataSource = lst;
        ddlRetailer.DataValueField = "USERID";
        ddlRetailer.DataTextField = "USER_NAME";
        ddlRetailer.DataBind();

    }

    

    private void load_data_to_update()
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetProductDetailforUpdation(Request.QueryString["pid"].ToString(), Session["loginid"].ToString());

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["CId"].ToString();
                fill_ddl_Subcategory(ds.Tables[0].Rows[0]["CId"].ToString(), ds.Tables[0].Rows[0]["Gender"].ToString());
                ddlSubCategory.SelectedValue = ds.Tables[0].Rows[0]["subcid"].ToString();
                if (ddlCategory.SelectedIndex == 1)
                {
                    ddlGender.Visible = true;
                    string gender = ds.Tables[0].Rows[0]["Gender"].ToString();
                    if (!string.IsNullOrEmpty(gender))
                    {
                        ddlGender.SelectedValue = gender;
                    }
                    else
                    {
                        ddlGender.SelectedIndex = 0;
                    }
                    //ddlGender.Visible = true;
                    //cbGender.ClearSelection();
                    //string[] gender = ds.Tables[0].Rows[0]["Gender"].ToString().Split(',');
                    //foreach (string s in gender)
                    //{
                    //    if (s == "M")
                    //    {
                    //        cbGender.Items[0].Selected = true;
                    //    }

                    //    if (s == "W")
                    //    {
                    //        cbGender.Items[1].Selected = true;
                    //    }

                    //    if (s == "KB")
                    //    {
                    //        cbGender.Items[2].Selected = true;
                    //    }
                    //    if (s == "KG")
                    //    {
                    //        cbGender.Items[3].Selected = true;

                    //    }
                    //}

                }

                txtPTitle.Text = ds.Tables[0].Rows[0][0].ToString();
                txtPSellingPrice.Text = ds.Tables[0].Rows[0][1].ToString();
                txtPCostPrice.Text = ds.Tables[0].Rows[0][2].ToString();
                txtPDescription.Text = ds.Tables[0].Rows[0][3].ToString();
                txtPQuantity.Text = ds.Tables[0].Rows[0][4].ToString();
                if (ds.Tables[0].Rows[0]["MFlag"].ToString() == "1")
                {
                    rdbtnMeasurement.SelectedIndex = 0;
                    pnlMeasurement.Visible = true;
                    string s = ds.Tables[0].Rows[0]["Measurement"].ToString();
                    string[] prodallsize = s.Split(',');
                    lbPSizeList.Items.Clear();
                    foreach (string prodsize in prodallsize)
                    {
                        lbPSizeList.Items.Add(prodsize);
                    }
                }
                else
                {
                    rdbtnMeasurement.SelectedIndex = 1;
                    lbPSizeList.Items.Clear();
                    pnlMeasurement.Visible = false;
                }


                txtTitle1.Text = ds.Tables[0].Rows[0]["Title1"].ToString();
                txtValue1.Text = ds.Tables[0].Rows[0]["value1"].ToString();
                txtTitle2.Text = ds.Tables[0].Rows[0]["Title2"].ToString();
                txtValue2.Text = ds.Tables[0].Rows[0]["value2"].ToString();

                txtTitle3.Text = ds.Tables[0].Rows[0]["Title3"].ToString();
                txtValue3.Text = ds.Tables[0].Rows[0]["Value3"].ToString();
                txtTitle4.Text = ds.Tables[0].Rows[0]["Title4"].ToString();
                txtValue4.Text = ds.Tables[0].Rows[0]["Value4"].ToString();
                txtTitle5.Text = ds.Tables[0].Rows[0]["Title5"].ToString();
                txtValue5.Text = ds.Tables[0].Rows[0]["Value5"].ToString();
                txtTitle6.Text = ds.Tables[0].Rows[0]["Title6"].ToString();
                txtValue6.Text = ds.Tables[0].Rows[0]["Value6"].ToString();
                txtTitle7.Text = ds.Tables[0].Rows[0]["Title7"].ToString();
                txtValue7.Text = ds.Tables[0].Rows[0]["Value7"].ToString();
                txtTitle8.Text = ds.Tables[0].Rows[0]["Title8"].ToString();
                txtValue8.Text = ds.Tables[0].Rows[0]["Value8"].ToString();
                txtTitle9.Text = ds.Tables[0].Rows[0]["Title9"].ToString();
                txtValue9.Text = ds.Tables[0].Rows[0]["Value9"].ToString();
                txtTitle10.Text = ds.Tables[0].Rows[0]["Title10"].ToString();
                txtValue10.Text = ds.Tables[0].Rows[0]["Value10"].ToString();
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
    private void fill_ddl_Subcategory(string cid, string gender)
    {
        try
        {
            obj = new DB();
            DataSet ds = obj.GetSubCategoryList(cid, gender);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlSubCategory.Items.Clear();
                ddlSubCategory.Items.Add(new ListItem("Select", "0"));
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddlSubCategory.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
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

    protected void rdbtnMeasurement_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdbtnMeasurement.SelectedValue == "1")
        {
            pnlMeasurement.Visible = true;
            lbPSizeList.Items.Clear();
        }
        else
        {
            pnlMeasurement.Visible = false;
        }
    }
    protected void btnPShiftSize_Click(object sender, EventArgs e)
    {
        List<Measurment> list = new List<Measurment>();
        var measurment = new Measurment
        {
            title = txtPSize.Text,
            quantity = txtMeasurementQuantity.Text,
            mrp = txtMeasurementPrice.Text,
            sellingPrice = txtSellingPrice.Text
        };

        if (txtPSize.Text.Trim() != "")
        {

            lbPSizeList.Items.Add(measurment.title+"~"+ measurment.quantity+"~"+ measurment.mrp+"~"+ measurment.sellingPrice);
            txtPSize.Text = "";
            txtMeasurementQuantity.Text = "";
            txtMeasurementPrice.Text = "";
        }
      
        if (Session["list"] != null)
        {
            list = Session["list"] as List<Measurment>;
        }
        list.Add(measurment);
        Session["list"] = list;
    }
    class Measurment
    {
        public int id { get; set; }
        public int productId { get; set; }
        public string title { get; set; }
        public string quantity { get; set; }
        public string mrp { get; set; }
        public string sellingPrice { get; set; }
    }
    protected void btnPRemoveSize_Click(object sender, EventArgs e)
    {
       var list = Session["list"] as List<Measurment>;
        var data = lbPSizeList.SelectedItem.Value.Split('~');
        var measurment = new Measurment
        {
            title = data[0],
            quantity = data[1],
            mrp = data[2],
            sellingPrice = data[3]
        };
        lbPSizeList.Items.RemoveAt(lbPSizeList.Items.IndexOf(lbPSizeList.SelectedItem));
        txtPSize.Text = "";
        txtMeasurementQuantity.Text = "";
        txtMeasurementPrice.Text = "";
        list.Remove(measurment);
        Session["list"] = list;
    }
    protected void btnProdCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Retailor/RetailorDashboard.aspx");
    }
    protected void btnProdReset_Click(object sender, EventArgs e)
    {
        txtB.Text = "";
        txtH.Text = ""; txtL.Text = ""; txtweight.Text = "";
        ddlCategory.SelectedIndex = 0;
        ddlSubCategory.SelectedIndex = 0;
        ddlGender.SelectedIndex = 0;
        // ddlGender.Visible = false;
        //cbGender.Visible = false;
        //cbGender.ClearSelection();
        txtPCostPrice.Text = "";
        txtPDescription.Text = "";
        txtPQuantity.Text = "";
        txtPSellingPrice.Text = "";
        txtPSize.Text = "";
        txtPTitle.Text = "";
        txtTitle1.Text = "";
        txtTitle10.Text = "";
        txtTitle2.Text = "";
        txtTitle3.Text = "";
        txtTitle4.Text = "";
        txtTitle5.Text = "";
        txtTitle6.Text = "";
        txtTitle7.Text = "";
        txtTitle8.Text = "";
        txtTitle9.Text = "";
        txtValue1.Text = "";
        txtValue10.Text = "";
        txtValue2.Text = "";
        txtValue3.Text = "";
        txtValue4.Text = "";
        txtValue5.Text = "";
        txtValue6.Text = "";
        txtValue7.Text = "";
        txtValue8.Text = "";
        txtValue9.Text = "";
        rdbtnMeasurement.SelectedIndex = 1;
        lbPSizeList.Items.Clear();
        txtSellingPrice.Text = "";
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCategory.SelectedValue == "1")
        {
            ddlGender.Visible = true;
            ddlSubCategory.Visible = true;
        }
        else
        {
            ddlGender.Visible = false;
            ddlSubCategory.Visible = true;
        }

        if (ddlCategory.SelectedIndex != 0)
        {
            fill_ddl_Subcategory(ddlCategory.SelectedValue, "");
        }

    }
    protected void btnProdSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (
                //txtPCostPrice.Text.Trim() != "" 
                 txtPDescription.Text.Trim() != ""
                //&& txtPQuantity.Text.Trim() != "" 
                //&& txtPSellingPrice.Text.Trim() != "" 
                && txtPTitle.Text.Trim() != "" 
                && ddlCategory.SelectedIndex != 0 
                && ddlSubCategory.SelectedIndex != 0
                && lbPSizeList.Items.Count>0
                && ddlRetailer.SelectedItem.Value!=""
                )
            {

                obj = new DB();
                obj.PMeasurementFlag = rdbtnMeasurement.SelectedIndex == 0 ? "1" : "0";
                string listitem = "";
                for (int i = 0; i < lbPSizeList.Items.Count && rdbtnMeasurement.SelectedIndex == 0; i++)
                {
                    listitem += lbPSizeList.Items[i].ToString() + ",";
                }
                if (listitem.Length > 0)
                    obj.ProdAllSize = listitem.Substring(0, listitem.Length - 1);
                else
                    obj.ProdAllSize = null;

                List<Measurment> list = new List<Measurment>();
                for (int i = 0; i < lbPSizeList.Items.Count; i++)
                {
                    var data= lbPSizeList.Items[i].ToString().Split('~');
                    var measurment = new Measurment
                    {
                        title = data[0],
                        quantity = data[1],
                        mrp = data[2],
                        sellingPrice = data[3]
                    };
                    list.Add(measurment);
                }
                Session["list"] = list;


                var brandId = obj.addNewBrand(txtBrand.Text);
                obj.EmpId = ddlRetailer.SelectedItem.Value;// Session["loginid"].ToString();
                obj.ProdCP = txtPCostPrice.Text;
                obj.BrandId = brandId;// Convert.ToInt32(txtBrand.Text);
                obj.Color = ddlColor.SelectedItem.Text;// txtColor.Text;
                obj.isReturnPolicy = false;
                obj.Wieght = Convert.ToDecimal(txtweight.Text);
                obj.Dimension = txtL.Text + "*" + txtB.Text + "*" + txtH.Text;


                obj.ProdDesc = txtPDescription.Text;
                obj.ProdSP = txtPSellingPrice.Text;
                obj.ProdDiscount = "0";// (((Convert.ToDecimal(txtPCostPrice.Text) - Convert.ToDecimal(txtPSellingPrice.Text)) / (Convert.ToDecimal(txtPCostPrice.Text))) * 100).ToString();
                obj.ProdQuantity = txtPQuantity.Text;
                obj.ProdTitle = txtPTitle.Text;
                obj.ProdTitle1 = txtTitle1.Text;
                obj.ProdTitle10 = txtTitle10.Text;
                obj.ProdTitle2 = txtTitle2.Text;
                obj.ProdTitle3 = txtTitle3.Text;
                obj.ProdTitle4 = txtTitle4.Text;
                obj.ProdTitle5 = txtTitle5.Text;
                obj.ProdTitle6 = txtTitle6.Text;
                obj.ProdTitle7 = txtTitle7.Text;
                obj.ProdTitle8 = txtTitle8.Text;
                obj.ProdTitle9 = txtTitle9.Text;
                obj.ProdValue1 = txtValue1.Text;
                obj.ProdValue10 = txtValue10.Text;
                obj.ProdValue2 = txtValue2.Text;
                obj.ProdValue3 = txtValue3.Text;
                obj.ProdValue4 = txtValue4.Text;
                obj.ProdValue5 = txtValue5.Text;
                obj.ProdValue6 = txtValue6.Text;
                obj.ProdValue7 = txtValue7.Text;
                obj.ProdValue8 = txtValue8.Text;
                obj.ProdValue9 = txtValue9.Text;
                obj.ProdCId = ddlCategory.SelectedValue;
                //string gender = "", g = "";
                string gender = "";
                if (ddlGender.SelectedValue == "0")
                {
                    gender = "";
                }
                else
                {
                    gender = ddlGender.SelectedValue;
                }


                //foreach (ListItem item in cbGender.Items)
                //{
                //    if (item.Selected)
                //    {
                //        if (item.Value == "Men")
                //            g = "M";
                //        else
                //            if (item.Value == "Women")
                //            g = "W";
                //        else
                //            if (item.Value == "KidBoy")
                //            g = "KB";
                //        else
                //            if (item.Value == "KidGirl")
                //            g = "KG";
                //        gender += g + ",";
                //    }
                //}
                //if (gender.Length > 0)
                //   gender = gender.Substring(0, gender.LastIndexOf(','));


                int s = 0;
                if (btnProdSubmit.Text == "Submit")
                {
                    s = obj.AddNewProdInfo(ddlSubCategory.SelectedValue, gender);
                    if (s > 0)
                    {
                        List<Measurment> lst = new List<Measurment>();
                        lst = Session["list"] as List<Measurment>;
                        foreach (var item in lst)
                        {
                            obj.AddProdMeasurment(s, item.title, item.quantity, item.mrp, item.sellingPrice);
                        }
                        

                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Record Added Successfully !');", true);
                        btnProdReset_Click(null, null);

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Record not Added Successfully !');", true);
                    }
                }
                else
                {
                    obj.ProdId = Request.QueryString["pid"].ToString();
                    s = obj.UpdateProdInfo(ddlSubCategory.SelectedValue, gender);
                    if (s > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Updation Done Successfully !');", true);
                        //  clear_all_fields();
                        btnProdReset_Click(null, null);
                        btnProdSubmit.Text = "Submit";
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Updation not Done Successfully !');", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Fill all mandatory fields !');", true);
            }
        }
        catch (Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }

    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        fill_ddl_Subcategory(ddlCategory.SelectedValue, ddlGender.SelectedValue);
    }
}