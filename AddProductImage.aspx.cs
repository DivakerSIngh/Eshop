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

public partial class AddProductImage : System.Web.UI.Page
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
                bind_updateImg_ddl();
                rbImage.SelectedIndex = 0;
                pnladd.Visible = true;
                pnlUpdate.Visible = false;
                obj.EmpId = Session["uid"].ToString();
                rbtnGender.Visible = false;
                //if (Session["PImgid"] != null)
                //{
                //    obj.ProdImgId = Session["PImgid"].ToString();
                //    btnProdImgSubmit.Text = "Update";
                //    //load_data_to_update();
                //}
                //else
                //{
                //    btnProdImgSubmit.Text = "Submit";
                //    //clear_all_fields();
                //}

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

   protected void rbImage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(rbImage.SelectedValue == "A")
        {
            pnladd.Visible = true;
            pnlUpdate.Visible = false;
            bind_updateImg_ddl();
        }
        else
            if(rbImage.SelectedValue == "U")
            {
                pnladd.Visible = false;
                pnlUpdate.Visible = true;
                bind_updateImg_ddl();
                rbtnGender.Visible = false;
            }
    }

    private void bind_updateImg_ddl()
    {
        ddlUPCategory.Items.Clear();
        DataSet ds = obj.fillDataSet("select cid,cname from Category");
        ddlUPCategory.DataSource = ds.Tables[0];
        ddlUPCategory.DataTextField = "cname";
        ddlUPCategory.DataValueField = "cid";
        ddlUPCategory.DataBind();
        ddlUPCategory.Items.Insert(0, new ListItem("Select", "Select"));

        ddlUPRetailor.Items.Clear();
        DataSet dsupret = obj.fillDataSet("select rid,rname from retailerinfo");
        ddlUPRetailor.DataSource = dsupret.Tables[0];
        ddlUPRetailor.DataTextField = "rname";
        ddlUPRetailor.DataValueField = "rid";
        ddlUPRetailor.DataBind();
        ddlUPRetailor.Items.Insert(0, new ListItem("Select", "Select"));
        ddlProdImage.Items.Clear();
        pnlrepeater.Visible = false;

    }


    protected void ddlUPCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUPRetailor.SelectedIndex != 0 && ddlUPCategory.SelectedIndex != 0)
        {
            DataSet dsupimage = obj.fillDataSet("select (Headertitle+' ('+cast(Pid as varchar(max))+')') as Headertitle,Pid from ProductDescription where rid=" + ddlUPRetailor.SelectedValue + " and cid=" + ddlUPCategory.SelectedValue + " order by pid");
            ddlProdImage.DataSource = dsupimage.Tables[0];
            ddlProdImage.DataTextField = "Headertitle";
            ddlProdImage.DataValueField = "Pid";
            ddlProdImage.DataBind();
            ddlProdImage.Items.Insert(0, new ListItem("Select", "Select"));
            if(ddlUPCategory.SelectedIndex == 1)
            {
                rbtnGender.Visible = true;
                rbtnGender.SelectedIndex = 0;
            }
            else
            {
                rbtnGender.Visible = false;
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Choose all List Items !')", true);
        }
    }
    protected void ddlProdImage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlProdImage.SelectedIndex != 0)
        {
            
            bind_imagegrid();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Choose any Product from the List !')", true);
        }
    }
    protected void ddlUPRetailor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlUPCategory.SelectedIndex = 0;
    }
    protected void btnProdImgSubmit_Click(object sender, EventArgs e)
    {
        obj = new DB();
        if(ddlUPRetailor.SelectedIndex !=0 && ddlUPCategory.SelectedIndex != 0 && ddlProdImage.SelectedIndex !=0)
        {
            if (Session["uid"].ToString() != null || Session["uid"].ToString() != "" && ddlProdImage.SelectedIndex != 0)
            {
                obj.EmpId = Session["uid"].ToString();
                obj.ProdImgCId = ddlUPCategory.SelectedValue;
                obj.ProdImgRId = ddlUPRetailor.SelectedValue;
                obj.ProdId = ddlProdImage.SelectedValue;
                if(rbtnGender.Visible)
                obj.ProdGender = rbtnGender.SelectedValue;
                int i = 0,f=1;
                foreach (UploadedFile file in fileupload.UploadedFiles)
                {
                    if(f<=5)
                    {
                    byte[] bytes = null;
                    bytes = new byte[file.ContentLength];
                    file.InputStream.Read(bytes, 0, bytes.Length);
                    i=obj.AddNewProdImgInfo(bytes);
                    if (i == 0)
                        break;
                    f++;
                }
                    else
                    {
                        break;
                    }
                }
                if(i != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Added Successfully !')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record not Inserted !')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select an item from the List !')", true);
        }
    }
    
    private void bind_imagegrid()
    {
        string query="";
        if(ddlUPCategory.SelectedIndex == 1)
        {
            query="select pimgid from productimage where cid=" + ddlUPCategory.SelectedValue + " and rid=" + ddlUPRetailor.SelectedValue + " and pid="+ddlProdImage.SelectedValue+" and gender='"+rbtnGender.SelectedValue+"' order by pimgid";
        }
        else
        {
            query="select pimgid from productimage where cid=" + ddlUPCategory.SelectedValue + " and rid=" + ddlUPRetailor.SelectedValue + " and pid="+ddlProdImage.SelectedValue+" order by pimgid";
        }
        DataSet ds = obj.fillDataSet(query);
        if(ds.Tables[0].Rows.Count > 1)
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
        DataSet ds = obj.fillDataSet("select pimage from productimage where pimgid="+id);
        if(ds.Tables[0].Rows.Count > 0)
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
            int i=obj.deleteImage(e.CommandArgument.ToString());
            if(i != 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted !')", true);
                bind_imagegrid();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Deletion failed !')", true);
            }
        }
    }
    protected void rbtnGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind_imagegrid();
    }
}