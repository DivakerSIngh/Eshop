using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logistic_UploadReceipt : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {
            if(Request.QueryString["tid"]==null)
            {
                Response.Redirect("~/Logistic/LogisticDashboard.aspx");
            }
        }
        else
        {
            Session["loginid"] = null;
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/PanelLogin.aspx?mode=L");
        }
        if (!IsPostBack)
        {
            rbImage.SelectedIndex = 0;
            pnladd.Visible = true;
        }
    }
    protected void btnProdImgCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Logistic/LogisticDashboard.aspx");
    }
    protected void btnProdImgSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();

            if (fileupload.HasFiles)
            {
                int i = 0;
                foreach (HttpPostedFile uploadedFile in fileupload.PostedFiles)
                {
                    //Is the file too big to upload?
                    int fileSize = uploadedFile.ContentLength;
                    string fileExtension = Path.GetExtension(uploadedFile.FileName);
                    if (fileSize > (1024 * 1024))
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Filesize of some image is too large. Maximum file size permitted is 1 MB');", true);
                        return;
                    }
                    else if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpeg")
                    {
                        byte[] bytes = null;
                        bytes = new byte[uploadedFile.ContentLength];
                        uploadedFile.InputStream.Read(bytes, 0, bytes.Length);
                        string tid = Request.QueryString["tid"].ToString();
                        string lid = Request.QueryString["lid"].ToString();
                        i = obj.AddReceiptImage(tid, lid, bytes, fileExtension);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('File Type of some image is invalid. File should be in .jpg, .jpeg, .png Format');", true);
                        return;
                    }

                }
                if (i != 0)
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Record Added Successfully !');", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Record not Added Successfully !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Choose Images to upload !');", true);
            }

        }
        catch (Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }
    private void bind_imagegrid()
    {

        obj = new DB();
        string tid = Request.QueryString["tid"].ToString();
        string lid = Request.QueryString["lid"].ToString();
        DataSet ds = obj.fillDataSet("select id from RECEIPT_IMAGE where TRANS_ID='" + tid + "' and LID='" + lid + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            gv_Images.DataSource = ds.Tables[0];
            gv_Images.DataBind();
            pnlrepeater.Visible = true;
        }
        else
        {
            gv_Images.DataSource = null;
            gv_Images.DataBind();
        }
    }
    protected void gv_Images_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the TextBox control.
            Label lblId = (e.Row.FindControl("lblImgId") as Label);
            Image imgprod = (e.Row.FindControl("imgProd") as Image);
            DataSet ds = get_Image(lblId.Text);

            byte[] imagem = (byte[])(ds.Tables[0].Rows[0][0]);
            string base64String = Convert.ToBase64String(imagem);

            imgprod.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);


        }
    }
    private DataSet get_Image(string id)
    {
        DataSet ds = obj.fillDataSet("select image from RECEIPT_IMAGE where id=" + id);
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds;
        }
        return null;
    }
    protected void gv_Images_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "GetId")
        {
            obj = new DB();
            int i = obj.IUD("delete from RECEIPT_IMAGE where id=" + e.CommandArgument.ToString());
            if (i != 0)
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Record Deleted !');", true);
                bind_imagegrid();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Deletion Failed !');", true);
            }
        }
    }
    protected void rbImage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbImage.SelectedIndex == 0)
        {
            pnladd.Visible = true;
            pnlUpdate.Visible = false;
        }
        else
        {
            bind_imagegrid();
            pnladd.Visible = false;
            pnlUpdate.Visible = true;
        }
    }
}