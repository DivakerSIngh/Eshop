using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Retailor_AddRetailorInfo : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString() == "U")
                {
                    btnRetSubmit.Text = "Update";
                    //btnRetSubmit.Enabled = false;
                    //txtReferralId.Visible = false;
                    //rbratailertype.Visible = false;
                    load_retailer_data();
                }
                else
                {
                    rbratailertype.Visible = true;
                    txtReferralId.Visible = true;
                    btnRetReset_Click(null, null);
                    rbratailertype.SelectedIndex = 1;
                    btnRetSubmit.Text = "Submit";
                    pnlRetailerSize.Visible = false;
                    rbtnGender.SelectedIndex = 0;
                    ddlSize.SelectedIndex = 0;
                }
            }
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
        }
    }

    private void load_retailer_data()
    {
        try
        {
            obj = new DB();
            string rid = Request.QueryString["rid"].ToString();
            if (rid != null && rid != "")
            {
                DataSet ds = obj.GetRetailerDetails(rid);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    // BYTE ARRAY IN VIEW STATE
                    ViewState["OrgDoc"] = ds.Tables[0].Rows[0]["OrganizationDoc"];
                    ViewState["GSTDoc"] = ds.Tables[0].Rows[0]["GSTDoc"];
                    ViewState["PanDoc"] = ds.Tables[0].Rows[0]["PanDoc"];
                    ViewState["AadharDoc"] = ds.Tables[0].Rows[0]["AadharDoc"];

                    ViewState["OrgDocExt"] = ds.Tables[0].Rows[0]["OrganizationDocExt"].ToString();
                    ViewState["GSTDocExt"] = ds.Tables[0].Rows[0]["GSTDocExt"].ToString();
                    ViewState["PanDocExt"] = ds.Tables[0].Rows[0]["PanDocExt"].ToString();
                    ViewState["AadharDocExt"] = ds.Tables[0].Rows[0]["AadharDocExt"].ToString();

                    byte[] org = (byte[])ViewState["OrgDoc"];
                    byte[] gst = (byte[])ViewState["GSTDoc"];
                    byte[] pan = (byte[])ViewState["PanDoc"];
                    byte[] aadhar = (byte[])ViewState["AadharDoc"];

                    if(org.Length>0)
                    {
                        lnkOrgRegDoc.Text = "Document Organization Registration";
                    }
                    if(gst.Length>0)
                    {
                        lnkGstDoc.Text = "Document GST";
                    }
                    if(pan.Length>0)
                    {
                        lnkPanDoc.Text = "Document Pan Card";
                    }
                    if (aadhar.Length > 0)
                    {
                        lnkAdharDoc.Text = "Document Adhar Card";
                    }

                    txtAccNum.Text = ds.Tables[0].Rows[0]["Acc_Number"].ToString();
                    txtBankName.Text = ds.Tables[0].Rows[0]["BankName"].ToString();
                    txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                    txtDistricts.Text = ds.Tables[0].Rows[0]["District"].ToString();
                    txtIFSCcode.Text = ds.Tables[0].Rows[0]["IFSC_Code"].ToString();
                    txtlandmark.Text = ds.Tables[0].Rows[0]["Landmark"].ToString();
                    txtMobile.Text = ds.Tables[0].Rows[0]["Org_Mobile"].ToString();
                    txtOrgName.Text = ds.Tables[0].Rows[0]["Org_Name"].ToString();
                    txtOrgRegNum.Text = ds.Tables[0].Rows[0]["Org_RegistrationNumber"].ToString();
                    txtPAN.Text = ds.Tables[0].Rows[0]["PAN"].ToString();
                    txtPincode.Text = ds.Tables[0].Rows[0]["Pincode"].ToString();
                    txtRAddress.Text = ds.Tables[0].Rows[0]["RAddress"].ToString();
                    txtAHolderName.Text = ds.Tables[0].Rows[0]["Acc_HolderName"].ToString();
                    txtREmail.Text = ds.Tables[0].Rows[0]["Org_Email"].ToString();
                    txtRName.Text = ds.Tables[0].Rows[0]["RName"].ToString();
                    txtServiceNum.Text = ds.Tables[0].Rows[0]["ServiceTax_Number"].ToString();
                    txtStates.Text = ds.Tables[0].Rows[0]["RState"].ToString();
                    txtTINNum12.Text = ds.Tables[0].Rows[0]["Org_TIN_Number"].ToString();
                    txtGST.Text = ds.Tables[0].Rows[0]["GSTNumber"].ToString();
                    txtOrgPan.Text = ds.Tables[0].Rows[0]["ServiceTax_Number"].ToString();
                    txtReferralId.Text = ds.Tables[0].Rows[0]["referralid"].ToString();
                    pnlRetailerSize.Visible = false;
                    if (ds.Tables[0].Rows[0]["Gender"].ToString() == "M")
                        rbtnGender.SelectedIndex = 0;
                    else
                        rbtnGender.SelectedIndex = 1;



                    cbRCategory.ClearSelection();
                    string[] rcategory = ds.Tables[0].Rows[0]["RCategory"].ToString().Split(',');
                    foreach (string s in rcategory)
                    {
                        if (s == "Li")
                        {
                            cbRCategory.Items[0].Selected = true;
                        }
                        else
                            if (s == "Ag")
                        {
                            cbRCategory.Items[1].Selected = true;
                        }
                        else
                                if (s == "Gr")
                        {
                            cbRCategory.Items[2].Selected = true;
                        }
                        else
                        {
                            cbRCategory.Items[3].Selected = true;
                            cbRCategory.Items[0].Selected = false;
                            cbRCategory.Items[1].Selected = false;
                            cbRCategory.Items[2].Selected = false;
                        }
                    }



                    if (ds.Tables[0].Rows[0]["RetailerType"].ToString() == "Rural")
                        ddlRType.SelectedIndex = 1;
                    else
                        ddlRType.SelectedIndex = 2;
                }
            }
            else
            {
                btnRetReset_Click(null, null);
            }
        }
        catch (Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }

    protected void btnRetReset_Click(object sender, EventArgs e)
    {
        txtOrgPan.Text = "";
        txtAccNum.Text = "";
        txtBankName.Text = "";
        txtCity.Text = "";
        txtDistricts.Text = "";
        txtIFSCcode.Text = "";
        txtlandmark.Text = "";
        txtMobile.Text = "";
        txtOrgName.Text = "";
        txtOrgRegNum.Text = "";
        txtPAN.Text = "";
        txtPincode.Text = "";
        txtRAddress.Text = "";
        txtReferralId.Text = "";
        txtREmail.Text = "";
        txtRName.Text = "";
        txtServiceNum.Text = "";
        txtStates.Text = "";
        txtTINNum12.Text = "";
        cbRCategory.ClearSelection();
        ddlRType.SelectedIndex = 0;
        rbtnGender.SelectedIndex = 0;
        pnlRetailerSize.Visible = false;
        ddlSize.SelectedIndex = 0;
        txtAHolderName.Text = "";
        txtGST.Text = "";
        lnkAdharDoc.Text = "";
        lnkGstDoc.Text = "";
        lnkOrgRegDoc.Text = "";
        lnkPanDoc.Text = "";
    }
    protected void btnRetCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Retailor/RetailorDashboard.aspx");
    }
    protected void btnRetSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //check for cb selection vaildation also
            if (txtAccNum.Text.Trim() != "" && txtAHolderName.Text.Trim() != "" && txtBankName.Text.Trim() != "" && txtDistricts.Text.Trim() != "" && txtIFSCcode.Text.Trim() != "" && txtlandmark.Text.Trim() != "" && txtMobile.Text.Trim() != "" && txtOrgName.Text.Trim() != "" && txtOrgRegNum.Text.Trim() != "" && txtPAN.Text.Trim() != "" && txtPincode.Text.Trim() != "" && txtRAddress.Text.Trim() != "" && txtREmail.Text.Trim() != "" && ddlRType.SelectedIndex != 0 && txtGST.Text.Trim() != "" && txtGST.Text.Length == 15 && txtOrgPan.Text.Trim() != "")
            {


                obj = new DB();
                string gst = txtGST.Text, referralid, rname, raddress, city, state, landmark, pincode, district, rcategory, rtype, orgname, orgregnumber, email, mobile, tinnum, staxnum, accholdername, accnumber, bname, ifsc, pan, rid;
                accnumber = txtAccNum.Text;
                accholdername = txtAHolderName.Text;
                bname = txtBankName.Text;
                city = "";
                district = txtDistricts.Text;
                ifsc = txtIFSCcode.Text;
                landmark = txtlandmark.Text;
                mobile = txtMobile.Text;
                orgname = txtOrgName.Text;
                orgregnumber = txtOrgRegNum.Text;
                pan = txtPAN.Text;
                pincode = txtPincode.Text;
                raddress = txtRAddress.Text;
                referralid = txtReferralId.Text;
                email = txtREmail.Text;
                rname = txtRName.Text;
                staxnum = txtOrgPan.Text;
                state = txtStates.Text;
                tinnum = txtTINNum12.Text;
                rtype = ddlRType.SelectedValue;
                rcategory = "";
                string usertype = "";
                if (rbratailertype.Visible == true)
                    usertype = rbratailertype.SelectedValue;
                foreach (ListItem item in cbRCategory.Items)
                {
                    if (item.Selected)
                    {
                        rcategory += item.Value.Substring(0, 2) + ",";
                    }
                }
                rcategory = rcategory.Substring(0, rcategory.LastIndexOf(','));
                gst = txtGST.Text;
                int s = 0;
                string f1 = "";
                string f2 = "";
                string f3 = "";
                string f4 = "";
                if (btnRetSubmit.Text == "Submit")
                {
                    //if (FileUpload1.FileBytes.Length > 0 && FileUpload1.FileBytes.Length <= 200000 && FileUpload2.FileBytes.Length > 0 && FileUpload2.FileBytes.Length <= 200000 && FileUpload3.FileBytes.Length > 0 && FileUpload3.FileBytes.Length <= 200000 && FileUpload4.FileBytes.Length > 0 && FileUpload4.FileBytes.Length <= 200000)
                    //{

                    //    string fileName1 = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    //    string fileName2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
                    //    string fileName3 = Path.GetFileName(FileUpload3.PostedFile.FileName);
                    //    string fileName4 = Path.GetFileName(FileUpload4.PostedFile.FileName);

                    //    f1 = System.IO.Path.GetExtension(FileUpload1.FileName);
                    //    f2 = System.IO.Path.GetExtension(FileUpload2.FileName);
                    //    f3 = System.IO.Path.GetExtension(FileUpload3.FileName);
                    //    f4 = System.IO.Path.GetExtension(FileUpload4.FileName);

                    //    if ((f1 == ".jpg" || f1 == ".jpeg" || f1 == ".pdf" || f1 == ".png") && (f2 == ".jpg" || f2 == ".jpeg" || f2 == ".pdf" || f2 == ".png") && (f3 == ".jpg" || f3 == ".jpeg" || f3 == ".pdf" || f3 == ".png") && (f4 == ".jpg" || f4 == ".jpeg" || f4 == ".pdf" || f4 == ".png"))
                    //    {
                    //    }
                    //    else
                    //    {
                    //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Incorrect file cannot be uploaded !');", true);
                    //        return;
                    //    }
                    //}
                    //else
                    //{
                    //    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Incorrect file cannot be uploaded !');", true);
                    //    btnRetSubmit.Enabled = true;
                    //    btnRetSubmit.Text = "Submit";
                    //    return;
                    //}
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Record in before insert  method !');", true);

                    s = obj.AddRetailerInfo(rname, raddress, city, state, landmark,
                        pincode, district, rcategory, rtype, orgname, orgregnumber, email, mobile, tinnum,
                        staxnum, accholdername, accnumber, bname, ifsc, pan, Session["loginid"].ToString(), rbtnGender.SelectedIndex == 0 ? "M" : "F", ddlSize.SelectedValue,
                        gst, referralid, FileUpload1.FileBytes, FileUpload2.FileBytes, FileUpload3.FileBytes, FileUpload4.FileBytes, f1, f2, f3, f4);
                    if (s > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Record Added Successfully !');", true);
                        btnRetReset_Click(null, null);
                        if (usertype != "" && usertype == "Normal")
                        {
                            //redirect to dashboard
                            Response.Redirect("~/Retailor/RetailorDashboard.aspx");
                        }
                        else
                            if (usertype != "" && usertype == "Premium")
                        {
                            //redirect to paymnet page
                            if (txtReferralId.Text.Trim() != "")
                            {
                                string[] str = Session["loginid"].ToString().Split(',');
                                Session["loginid"] = str[0] + ",,Referral," + txtReferralId.Text;
                                Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
                            }
                            else
                            {
                                string[] str = Session["loginid"].ToString().Split(',');
                                Session["loginid"] = str[0] + ",,Premium";
                                Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Record not added successfully !');", true);
                    }
                }
                else
                {
                    string rrid = Request.QueryString["rid"].ToString();
                    string gender = "";
                    var byte1 = new byte[0];
                   var byte2 = new byte[0];var byte3 = new byte[0];var byte4 = new byte[0];
                    if (rbtnGender.SelectedIndex == 0)
                    {
                        gender = "M";
                    }
                    else
                    {
                        gender = "F";
                    }

                    //if (FileUpload1.FileBytes.Length > 0 && FileUpload1.FileBytes.Length <= 200000)
                    //{
                    //    f1 = System.IO.Path.GetExtension(FileUpload1.FileName);
                    //    if ((f1 == ".jpg" || f1 == ".jpeg" || f1 == ".pdf" || f1 == ".png"))
                    //    {
                    //        byte1 = FileUpload1.FileBytes;
                    //    }
                    //    else
                    //    {
                    //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Incorrect file cannot be uploaded !');", true);
                    //        return;
                    //    }
                    //}
                    //else
                    //{
                    //    f1 = ViewState["OrgDocExt"].ToString();
                    //    byte1 = (byte[])ViewState["OrgDoc"];
                    //}
                    //if (FileUpload2.FileBytes.Length > 0 && FileUpload2.FileBytes.Length <= 200000)
                    //{
                    //    f2 = System.IO.Path.GetExtension(FileUpload2.FileName);
                    //    if ((f2 == ".jpg" || f2 == ".jpeg" || f2 == ".pdf" || f2 == ".png"))
                    //    {
                    //        byte2 = FileUpload2.FileBytes;
                    //    }
                    //    else
                    //    {
                    //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Incorrect file cannot be uploaded !');", true);
                    //        return;
                    //    }
                    //}
                    //else
                    //{
                    //    f2 = ViewState["GSTDocExt"].ToString();
                    //    byte2 = (byte[])ViewState["GSTDoc"];
                    //}
                    //if (FileUpload3.FileBytes.Length > 0 && FileUpload3.FileBytes.Length <= 200000)
                    //{
                    //    f3 = System.IO.Path.GetExtension(FileUpload3.FileName);
                    //    if ((f3 == ".jpg" || f3 == ".jpeg" || f3 == ".pdf" || f3 == ".png"))
                    //    {
                    //        byte3 = FileUpload3.FileBytes;
                    //    }
                    //    else
                    //    {
                    //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Incorrect file cannot be uploaded !');", true);
                    //        return;
                    //    }

                    //}
                    //else
                    //{
                    //    f3 = ViewState["PanDocExt"].ToString();
                    //    byte3 = (byte[])ViewState["PanDoc"];
                    //}
                    //if (FileUpload4.FileBytes.Length > 0 && FileUpload4.FileBytes.Length <= 200000)
                    //{
                    //    f4 = System.IO.Path.GetExtension(FileUpload4.FileName);
                    //    if ((f4 == ".jpg" || f4 == ".jpeg" || f4 == ".pdf" || f4 == ".png"))
                    //    {
                    //        byte4 = FileUpload4.FileBytes;
                    //    }
                    //    else
                    //    {
                    //        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Incorrect file cannot be uploaded !');", true);
                    //        return;
                    //    }
                    //}
                    //else
                    //{
                    //    f4 = ViewState["AadharDocExt"].ToString();
                    //    byte4 = (byte[])ViewState["AadharDoc"];
                    //}
                    s = obj.UpdateRetailerInfo(rname, raddress, city, state, landmark, pincode, district,
                        rcategory, rtype, orgname, orgregnumber, email, mobile, tinnum, staxnum, accholdername, accnumber, bname,
                        ifsc, pan, Session["loginid"].ToString(), rrid, gst, gender, referralid,
                        byte1, byte2, byte3, byte4, f1, f2, f3, f4);
                    if (s > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Updation Done Successfully !');", true);
                        btnRetReset_Click(null, null);
                        btnRetSubmit.Text = "Submit";
                        btnRetSubmit.Enabled = false;
                        Response.Redirect("ViewRetailorList.aspx");
                    }
                    else
                    {

                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Updation not done successfully !');", true);
                    }
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Fill all mandatory fields !');", true);
            }
        }
        catch (Exception ex)
        {
            obj = new DB();
            int i = obj.ErrorLog("insert into errorlog (msg,methodname,entrydate) values ('" + ex.Message.ToString() + "','aadretinfo insert catch'," + DateTime.Now.ToString());
        }
        finally
        {
            obj = null;
        }
    }
    protected void rbratailertype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbratailertype.SelectedValue == "Premium")
        {
            pnlRetailerSize.Visible = true;
        }
        else
        {
            pnlRetailerSize.Visible = false;
        }
    }
    protected void rbratailertype_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (rbratailertype.Text == "Premium")
        {
            pnlRetailerSize.Visible = true;
        }
        else
        {
            pnlRetailerSize.Visible = false;
        }
    }

    protected void lnkOrgRegDoc_Click(object sender, EventArgs e)
    {
        try
        {
            string ext = ViewState["OrgDocExt"].ToString();
            string fileName = "Ogranization_Registration_Document" + ext;
            string content = "";
            if (ext == ".pdf")
            {
                content = "application/pdf";
            }
            if (ext == ".docx")
            {
                content = "application/vnd.ms-word";
            }
            if (ext == ".xsl"|| ext==".xlsx")
            {
                content = "application/vnd.ms-excel";
            }
            if(ext==".jpg"||ext==".png"||ext==".jpeg")
            {
                content = "image/jpeg";
            }
            Byte[] bytes = (Byte[])ViewState["OrgDoc"];
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = content;
            Response.AddHeader("content-disposition", "attachment;filename="+ fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            
        }
    }

    protected void lnkGstDoc_Click(object sender, EventArgs e)
    {
        try
        {
            string ext = ViewState["GSTDocExt"].ToString();
            string fileName = "GST_Registration_Document" + ext;
            string content = "";
            if (ext == ".pdf")
            {
                content = "application/pdf";
            }
            if (ext == ".docx")
            {
                content = "application/vnd.ms-word";
            }
            if (ext == ".xsl" || ext == ".xlsx")
            {
                content = "application/vnd.ms-excel";
            }
            if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
            {
                content = "image/jpeg";
            }
            Byte[] bytes = (Byte[])ViewState["GSTDoc"];
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = content;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {

        }
    }

    protected void lnkPanDoc_Click(object sender, EventArgs e)
    {
        try
        {
            string ext = ViewState["PanDocExt"].ToString();
            string fileName = "Pan_Registration_Document" + ext;
            string content = "";
            if (ext == ".pdf")
            {
                content = "application/pdf";
            }
            if (ext == ".docx")
            {
                content = "application/vnd.ms-word";
            }
            if (ext == ".xsl" || ext == ".xlsx")
            {
                content = "application/vnd.ms-excel";
            }
            if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
            {
                content = "image/jpeg";
            }
            Byte[] bytes = (Byte[])ViewState["PanDoc"];
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = content;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {

        }
    }

    protected void lnkAdharDoc_Click(object sender, EventArgs e)
    {
        try
        {
            string ext = ViewState["AadharDocExt"].ToString();
            string fileName = "Aadhar_Registration_Document" + ext;
            string content = "";
            if (ext == ".pdf")
            {
                content = "application/pdf";
            }
            if (ext == ".docx")
            {
                content = "application/vnd.ms-word";
            }
            if (ext == ".xsl" || ext == ".xlsx")
            {
                content = "application/vnd.ms-excel";
            }
            if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
            {
                content = "image/jpeg";
            }
            Byte[] bytes = (Byte[])ViewState["AadharDoc"];
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = content;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {

        }
    }
}