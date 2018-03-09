using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using Telerik.Web.UI;


public partial class Retailor_AddProductImage : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=R");
        }
        if(!IsPostBack)
        {
            rbImage.SelectedIndex = 0;
            load_product_list();
            pnladd.Visible = false;
        
        }
    }


    private void load_product_list()
    {
        try
        {
            obj = new DB();
            ddlProdImage.Items.Clear();
            DataSet ds = obj.GetProdListforRetailer(Session["loginid"].ToString());
            ddlProdImage.DataSource = ds.Tables[0];
            ddlProdImage.DataTextField = "HeaderTitle";
            ddlProdImage.DataValueField = "pid";
            ddlProdImage.DataBind();
            ddlProdImage.Items.Insert(0, new ListItem("Select", "Select"));
        }
        catch(Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }

    protected void ddlProdImage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlProdImage.SelectedIndex != 0)
        {
            if (rbImage.SelectedIndex == 0)
            {
                pnladd.Visible = true;
                pnlUpdate.Visible = false;
               
            }
            else
            {
                pnladd.Visible = false;
                pnlUpdate.Visible = true;
                bind_imagegrid();    
            }
        }
        else
        {
            pnladd.Visible = false;
            pnlUpdate.Visible = false;
        }
    }
    protected void btnProdImgCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Retailor/RetailorDashboard.aspx");
    }
    protected void btnProdImgSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            if ( ddlProdImage.SelectedIndex != 0)
            {

                obj.EmpId = Session["loginid"].ToString();
                
                    obj.ProdId = ddlProdImage.SelectedValue;
                //check image duplicacy
                    DataSet ds = obj.CheckImageDuplicacy(obj.EmpId,obj.ProdId);
                if(ds.Tables[0].Rows.Count == 0)
                {
                    if (fileupload.UploadedFiles.Count > 0)
                    {
                    int i = 0, f = 1;
                    foreach (UploadedFile file in fileupload.UploadedFiles)
                    {
                            using (System.Drawing.Bitmap originalImage = new System.Drawing.Bitmap(file.InputStream))
                            {
                                int width = originalImage.Width;
                                int height = originalImage.Height;
                                //if(width >= 500 && height >= 500)
                                //{
                                //    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Image size is too long please use another image !');", true);
                                //    break;
                                //}
                                //else
                                //{

                                //}
                            }
                                if (f <= 4)
                        {
                            byte[] bytes = null;
                            bytes = new byte[file.ContentLength];
                            file.InputStream.Read(bytes, 0, bytes.Length);
                            i = obj.AddNewProdImgInfo(bytes);
                            if (i == 0)
                                break;
                            f++;
                        }
                        else
                        {
                            break;
                        }
                    }
                    if (i != 0)
                    {
                        ddlProdImage.SelectedIndex = 0;
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
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Image Already Uploaded !');", true);
                }
            }
           
        }
        catch(Exception ex)
        { }
        finally
        {
            obj = null;
        }
    }

    private void bind_imagegrid()
    {

        obj = new DB();
        string[] str = Session["loginid"].ToString().Split(',');
        DataSet ds = obj.fillDataSet("select pimgid from productimage where pid=" + ddlProdImage.SelectedValue + " and userid='" + str[0] +"'");
        if (ds.Tables[0].Rows.Count > 1)
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
        DataSet ds = obj.fillDataSet("select pimage from productimage where pimgid=" + id);
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
            int i = obj.deleteImage(e.CommandArgument.ToString());
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
        if(rbImage.SelectedIndex == 0)
        {
            pnladd.Visible = true;
            pnlUpdate.Visible = false;
        }
        else
        {
            pnladd.Visible = false;
            pnlUpdate.Visible = true;
        }
    }
}