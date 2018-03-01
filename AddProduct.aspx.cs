using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class AddProduct : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new DB();
        if (Session["uid"] != null)
        {

            obj.EmpId = Session["uid"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");

        }
        if (!IsPostBack)
        {
            //clear_all_fields();
            //obj.EmpId=Session[].ToString();
            if (Session["uid"] != null)
            {
                load_ddl_category();
                obj.EmpId = Session["uid"].ToString();
                if (Session["Pid"] != null)
                {
                    obj.ProdId = Session["Pid"].ToString();
                    btnProdSubmit.Text = "Update";
                    load_data_to_update();
                }
                else
                {
                    btnProdSubmit.Text = "Submit";
                    clear_all_fields();
                }

                if (Session["uname"] != null && Session["uname"].ToString() != "")
                {
                    lblname.Text = Session["uname"].ToString();
                }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
    }

    private void load_ddl_category()
    {
        DataSet ds = obj.fillDataSet("select cid,cname from Category");
        ddlCategory.DataSource = ds.Tables[0];
        ddlCategory.DataTextField = "cname";
        ddlCategory.DataValueField = "cid";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("Select", "Select"));

        DataSet dsret = obj.fillDataSet("select rid,rname from retailerinfo");
        ddlRetailer.DataSource = dsret.Tables[0];
        ddlRetailer.DataTextField = "rname";
        ddlRetailer.DataValueField = "rid";
        ddlRetailer.DataBind();
        ddlRetailer.Items.Insert(0, new ListItem("Select", "Select"));

    }
    private void load_data_to_update()
    {
        clear_all_fields();
        DataSet ds = obj.fillDataSet("select HeaderTitle,SellingPrice,CostPrice,PDescription,Quantity,Discount,Title1,value1,Title2,Value2,Title3,Value3,Title4,Value4,Title5,Value5,Title6,Value6,Title7,Value7,Title8,Value8,Title9,Value9,Title10,Value10,MFlag,Measurement,CId,rid,Gender from productdescription where PId=" + obj.ProdId);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlCategory.SelectedIndex = Convert.ToInt32(ds.Tables[0].Rows[0]["CId"].ToString());
            if(ddlCategory.SelectedIndex == 1)
            {
                rbtnGender.Visible = true;
                if("M" == ds.Tables[0].Rows[0]["Gender"].ToString())
                {
                    rbtnGender.SelectedIndex = 0;
                }
                else
                {
                    rbtnGender.SelectedIndex = 1;
                }
            }
            else
            {
                rbtnGender.Visible = false;
                
            }
            ddlRetailer.SelectedIndex = Convert.ToInt32(ds.Tables[0].Rows[0]["rid"].ToString());
            txtPTitle.Text = ds.Tables[0].Rows[0][0].ToString();
            txtPSellingPrice.Text = ds.Tables[0].Rows[0][1].ToString();
            txtPCostPrice.Text = ds.Tables[0].Rows[0][2].ToString();
            txtPDescription.Text = ds.Tables[0].Rows[0][3].ToString();
            txtPQuantity.Text = ds.Tables[0].Rows[0][4].ToString();
            if(ds.Tables[0].Rows[0]["MFlag"].ToString() == "1")
            {
                rdbtnMeasurement.SelectedIndex = 0;
                pnlMeasurement.Visible=true;
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
                pnlMeasurement.Visible=false;
            }

            
            txtTitle1.Text=ds.Tables[0].Rows[0]["Title1"].ToString();
            txtValue1.Text=ds.Tables[0].Rows[0]["value1"].ToString();
            if(ds.Tables[0].Rows[0]["Title2"].ToString() != "" || ds.Tables[0].Rows[0]["Value2"].ToString() != "")
            {
                pnlAddTitle2.Visible=true;
                txtTitle2.Text = ds.Tables[0].Rows[0]["Title2"].ToString();
                txtValue2.Text = ds.Tables[0].Rows[0]["Value2"].ToString();
            }
            if(ds.Tables[0].Rows[0]["Title3"].ToString() != "" || ds.Tables[0].Rows[0]["Value3"].ToString() != "")
            {
                pnlAddTitle3.Visible = true;
                txtTitle3.Text = ds.Tables[0].Rows[0]["Title3"].ToString();
                txtValue3.Text = ds.Tables[0].Rows[0]["Value3"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Title4"].ToString() != "" || ds.Tables[0].Rows[0]["Value4"].ToString() != "")
            {
                pnlAddTitle4.Visible = true;
                txtTitle4.Text = ds.Tables[0].Rows[0]["Title4"].ToString();
                txtValue4.Text = ds.Tables[0].Rows[0]["Value4"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Title5"].ToString() != "" || ds.Tables[0].Rows[0]["Value5"].ToString() != "")
            {
                pnlAddTitle5.Visible = true;
                txtTitle5.Text = ds.Tables[0].Rows[0]["Title5"].ToString();
                txtValue5.Text = ds.Tables[0].Rows[0]["Value5"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Title6"].ToString() != "" || ds.Tables[0].Rows[0]["Value6"].ToString() != "")
            {
                pnlAddTitle6.Visible = true;
                txtTitle6.Text = ds.Tables[0].Rows[0]["Title6"].ToString();
                txtValue6.Text = ds.Tables[0].Rows[0]["Value6"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Title7"].ToString() != "" || ds.Tables[0].Rows[0]["Value7"].ToString() != "")
            {
                pnlAddTitle7.Visible = true;
                txtTitle7.Text = ds.Tables[0].Rows[0]["Title7"].ToString();
                txtValue7.Text = ds.Tables[0].Rows[0]["Value7"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Title8"].ToString() != "" || ds.Tables[0].Rows[0]["Value8"].ToString() != "")
            {
                pnlAddTitle8.Visible = true;
                txtTitle8.Text = ds.Tables[0].Rows[0]["Title8"].ToString();
                txtValue8.Text = ds.Tables[0].Rows[0]["Value8"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Title9"].ToString() != "" || ds.Tables[0].Rows[0]["Value9"].ToString() != "")
            {
                pnlAddTitle9.Visible = true;
                txtTitle9.Text = ds.Tables[0].Rows[0]["Title9"].ToString();
                txtValue9.Text = ds.Tables[0].Rows[0]["Value9"].ToString();
            }
            if (ds.Tables[0].Rows[0]["Title10"].ToString() != "" || ds.Tables[0].Rows[0]["Value10"].ToString() != "")
            {
                pnlAddTitle10.Visible = true;
                txtTitle10.Text = ds.Tables[0].Rows[0]["Title10"].ToString();
                txtValue10.Text = ds.Tables[0].Rows[0]["Value10"].ToString();
            }





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
    protected void ImgbtnMore_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle2.Visible = true;


    }
    protected void ImgbtnMore2_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle3.Visible = true;
    }
    protected void ImgbtnMore3_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle4.Visible = true;
    }
    protected void ImgbtnMore4_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle5.Visible = true;
    }
    protected void ImgbtnMore5_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle6.Visible = true;
    }
    protected void ImgbtnMore6_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle7.Visible = true;
    }
    protected void ImgbtnMore7_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle8.Visible = true;
    }
    protected void ImgbtnMore8_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle9.Visible = true;
    }
    protected void ImgbtnMore9_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle10.Visible = true;
    }
    protected void btnPShiftSize_Click(object sender, EventArgs e)
    {
        if (txtPSize.Text.Trim() != "")
        {
            lbPSizeList.Items.Add(txtPSize.Text);
            txtPSize.Text = "";
        }
    }

    protected void btnPRemoveSize_Click(object sender, EventArgs e)
    {
        lbPSizeList.Items.RemoveAt(lbPSizeList.Items.IndexOf(lbPSizeList.SelectedItem));
        txtPSize.Text = "";
    }

    protected void ImgbtnCancel2_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle2.Visible = false;
    }
    protected void ImgbtnCancel3_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle3.Visible = false;
    }
    protected void ImgbtnCancel4_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle4.Visible = false;
    }
    protected void ImgbtnCancel5_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle5.Visible = false;
    }
    protected void ImgbtnCancel6_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle6.Visible = false;
    }
    protected void ImgbtnCancel7_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle7.Visible = false;
    }
    protected void ImgbtnCancel8_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle8.Visible = false;
    }
    protected void ImgbtnCancel9_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle9.Visible = false;
    }

    protected void ImgbtnCancel10_Click(object sender, ImageClickEventArgs e)
    {
        pnlAddTitle10.Visible = false;
    }
    protected void btnProdCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage.aspx");
    }
    protected void btnProdReset_Click(object sender, EventArgs e)
    {
        clear_all_fields();
    }

    private void clear_all_fields()
    {
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
        txtTitle6.Text = "";
        txtTitle7.Text = "";
        txtTitle5.Text = "";
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
        pnlAddTitle10.Visible = false;
        pnlAddTitle2.Visible = false;
        pnlAddTitle3.Visible = false;
        pnlAddTitle4.Visible = false;
        pnlAddTitle5.Visible = false;
        pnlAddTitle6.Visible = false;
        pnlAddTitle7.Visible = false;
        pnlAddTitle8.Visible = false;
        pnlAddTitle9.Visible = false;
        pnlMeasurement.Visible = false;
        rdbtnMeasurement.SelectedIndex = 1;
        ddlRetailer.SelectedIndex = 0;
        ddlCategory.SelectedIndex = 0;
        rbtnGender.Visible = false;
        lbPSizeList.Items.Clear();
    }



    protected void btnProdSubmit_Click(object sender, EventArgs e)
    {
        if (txtPCostPrice.Text.Trim() != "" && txtPDescription.Text.Trim() != "" && txtPQuantity.Text.Trim() != "" && txtPSellingPrice.Text.Trim() != "" && txtPTitle.Text.Trim() != "" && ddlCategory.SelectedIndex != 0 && ddlRetailer.SelectedIndex != 0 )
        {
           
            DB obj = new DB();
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
            obj.EmpId = Session["uid"].ToString();
            obj.ProdCP = txtPCostPrice.Text;
            obj.ProdDesc = txtPDescription.Text;
            obj.ProdSP = txtPSellingPrice.Text;
            obj.ProdDiscount = (((Convert.ToDecimal(txtPCostPrice.Text) - Convert.ToDecimal(txtPSellingPrice.Text)) / (Convert.ToDecimal(txtPCostPrice.Text))) * 100).ToString();
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
            obj.ProdRId = ddlRetailer.SelectedValue;
           if(rbtnGender.Visible)
           {
               obj.ProdGender = rbtnGender.SelectedValue;

           }
           
            int s = 0;
            if (btnProdSubmit.Text == "Submit")
            {
                s = 0;// obj.AddNewProdInfo();
                if (s > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Added Successfully !')", true);
                    clear_all_fields();

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record not added successfully !')", true);
                }
            }
            else
            {
                obj.ProdId = Session["Pid"].ToString();
                s = 0;// obj.UpdateProdInfo();
                if (s > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updation Done Successfully !')", true);
                    clear_all_fields();
                    btnProdSubmit.Text = "Submit";
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updation not done successfully !')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Kindly Fill Mandatory All Fields  !')", true);
        }
    }


    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlCategory.SelectedIndex == 1)
        {
            rbtnGender.Visible = true;
            rbtnGender.SelectedIndex = 0;
        }
        else
        {
            rbtnGender.Visible = false;

        }
    }
}