using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class SingleProduct : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new DB();

        if (Session["uid"] != null && Session["sessionid"] != null)
        {
            obj.EmpId = Session["uid"].ToString();
            obj.UserSessionId = Session["sessionid"].ToString();
            if(Request.QueryString["pid"] != null)
            {
                string p = Request.QueryString["pid"].ToString();
                Session["pid"]=Request.QueryString["pid"].ToString();
            }

        }
        else
        {
          //  Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            if (Request.QueryString["pid"] != null)
            {
                Session["pid"] = Request.QueryString["pid"].ToString();
            }

            if (Session["uid"] != null && Session["sessionid"] != null)
            {

                obj.EmpId = Session["uid"].ToString();
                //Session["sessionid"] = obj.LoginSession(Session["uid"].ToString());
                obj.UserSessionId = Session["sessionid"].ToString();


                //int i=obj.GetCartCount();
                //((Label)Master.FindControl("lblcountcart")).Text = (i).ToString();
                
                //((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Logout";

            


        
            }
            else
            {
            //    Response.Redirect("Login.aspx");

            }

            load_image();
        }
    }
    protected void imgProduct_Command(object sender, CommandEventArgs e)
    {
        if(e.CommandName == "displayImage")
        {
            string pimgid = e.CommandArgument.ToString();
            ImgFullView.ImageUrl = "SingleProductHandler.ashx?pimgid="+pimgid;
        }
    }

    private void load_image()
    {
        try
        {
            obj = new DB();
            //if (obj.ProdId != null)
            //{
            DataSet ds = obj.fillDataSet("select pdesc.PId,pdesc.CId,pdesc.CostPrice,pdesc.Discount,pdesc.HeaderTitle,pdesc.MFlag,pdesc.Measurement,pdesc.rid,pdesc.PDescription,pdesc.SellingPrice,pimg.PImage,pimg.PImgId from productdescription as pdesc inner join productimage as pimg on pdesc.PId=pimg.PId and pdesc.CId=pimg.CId and pdesc.rid=pimg.RId where pdesc.pid=" + Session["pid"].ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlImageList.DataSource = ds.Tables[0];
                dlImageList.DataBind();
                dlImageList.Visible = true;
                ImgFullView.ImageUrl = "SingleProductHandler.ashx?pimgid=" + ds.Tables[0].Rows[0]["PImgId"];

                ddlPrdoDescription.DataSource = (obj.fillDataSet("select top 1 pdesc.PId,pdesc.CId,pdesc.CostPrice,pdesc.Discount,pdesc.HeaderTitle,pdesc.MFlag,pdesc.Measurement,pdesc.rid,pdesc.PDescription,pdesc.SellingPrice,pimg.PImage,pimg.PImgId from productdescription as pdesc inner join productimage as pimg on pdesc.PId=pimg.PId and pdesc.CId=pimg.CId and pdesc.rid=pimg.RId where pdesc.pid=" + Session["pid"].ToString())).Tables[0];
                ddlPrdoDescription.DataBind();

                ddlProdDetail.DataSource = (obj.fillDataSet("select PDescription,Title1,Value1,Title2,Value2,Title3,Value3,Title4,Value4,Title5,Value5,Title6,Value6,Title7,Value7,Title8,Value8,Title9,Value9,Title10,Value10 from productdescription where PId=" + Session["pid"].ToString())).Tables[0];
                ddlProdDetail.DataBind();

                string cid = ds.Tables[0].Rows[0]["cid"].ToString();
                DataSet dsrecom = null;
                if (cid != null && cid != "")
                {
                    lblcid.Text = cid;
                    dsrecom = obj.GetRecommendedProducts(cid);
                }
                if (dsrecom.Tables[0].Rows.Count > 0)
                {
                    ImageButton1.Visible = true;
                    ImageButton2.Visible = true;
                    pnlRecomProdList.Visible = false;
                    dlRecomProd.DataSource = get_recommended_prodlist(dsrecom, 'f');
                    dlRecomProd.DataBind();
                }
                else
                {
                    pnlRecomProdList.Visible = true;
                    ImageButton1.Visible = false;
                    ImageButton2.Visible = false;
                }
    
            }
            else
            {
                ds = obj.fillDataSet("select pdesc.PId,pdesc.CId,pdesc.CostPrice,pdesc.Discount,pdesc.HeaderTitle,pdesc.MFlag,pdesc.Measurement,pdesc.rid,pdesc.PDescription,pdesc.SellingPrice,pimgid=0 from productdescription as pdesc where pdesc.pid=" + Session["pid"].ToString());
                if(ds.Tables[0].Rows.Count > 0)
                {
                    dlImageList.DataSource = ds.Tables[0];
                    dlImageList.DataBind();
                    dlImageList.Visible = false;
                    ImgFullView.ImageUrl = "SingleProductHandler.ashx?id=0";

                    

                    ddlPrdoDescription.DataSource = (obj.fillDataSet("select top 1 pdesc.PId,pdesc.CId,pdesc.CostPrice,pdesc.Discount,pdesc.HeaderTitle,pdesc.MFlag,pdesc.Measurement,pdesc.rid,pdesc.PDescription,pdesc.SellingPrice from productdescription as pdesc where pdesc.pid=" + Session["pid"].ToString())).Tables[0];
                    ddlPrdoDescription.DataBind();

                    ddlProdDetail.DataSource = (obj.fillDataSet("select PDescription,Title1,Value1,Title2,Value2,Title3,Value3,Title4,Value4,Title5,Value5,Title6,Value6,Title7,Value7,Title8,Value8,Title9,Value9,Title10,Value10 from productdescription where PId=" + Session["pid"].ToString())).Tables[0];
                    ddlProdDetail.DataBind();

                    string cid = ds.Tables[0].Rows[0]["cid"].ToString();
                    DataSet dsrecom = null;
                    if (cid != null && cid != "")
                    {
                        
                        lblcid.Text = cid;
                        dsrecom = obj.GetRecommendedProducts(cid);
                    }
                    if (dsrecom.Tables[0].Rows.Count > 0)
                    {
                        ImageButton1.Visible = true;
                        ImageButton2.Visible = true;
                        pnlRecomProdList.Visible = false;
                        dlRecomProd.DataSource = get_recommended_prodlist(dsrecom, 'f');
                        dlRecomProd.DataBind();
                    }
                    else
                    {
                        pnlRecomProdList.Visible = true;
                        ImageButton1.Visible = false;
                        ImageButton2.Visible = false;
                    }
    
                }
            }
        }
        catch(Exception ex)
        {

        }
    }

    protected void btnAddToCart_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            if (Session["uid"] != null && Session["sessionid"] != null)
            {
            string[] commandArgs = ((Button)sender).CommandArgument.ToString().Split(new char[] { ',' });
            string pid = commandArgs[0];
            string cid = commandArgs[1];
            string rid = commandArgs[2];

            Button btnAddToCart = (Button)sender;
            DataListItem item = (DataListItem)btnAddToCart.NamingContainer;
            var ddlsize = (DropDownList)item.FindControl("ddlsize");
            
        

            DB obj = new DB();
            obj.UserSessionId = Session["sessionid"].ToString();
            obj.EmpId = Session["uid"].ToString();
            obj.ProdCId = cid;
            obj.ProdRId = rid;
            obj.ProdId = pid;

                if(ddlsize.Visible == true)
            obj.ProdSize = ddlsize.SelectedValue;

            //int i = obj.AddNewCartProdInfo();
            //if (i > 0)
            //{
            //    ((Label)Master.FindControl("lblcountcart")).Text = (Convert.ToInt32(((Label)Master.FindControl("lblcountcart")).Text) + 1).ToString();
            //    //Button btncart = ddlPrdoDescription.FindControl("btnAddToCart") as Button;
            //    //btncart.Enabled = false;
            //}
            }
            else
            {
                Response.Redirect("Login.aspx?pid=" + Session["pid"]);
            }
        }
    }
    
    protected void btnCheckLocation_Click1(object sender, ImageClickEventArgs e)
    {
        obj = new DB();
        obj.UserSessionId = Session["sessionid"].ToString();
        obj.EmpId = Session["uid"].ToString();

        DataSet ds = obj.CheckLocationAvailability();

        ImageButton BtnCheckPincode = (ImageButton)sender;
        DataListItem item = (DataListItem)BtnCheckPincode.NamingContainer;
        var txtPincode = (TextBox)item.FindControl("txtLocation");
        var btnavailable = (ImageButton)item.FindControl("btnAvailable");
        int flag = 0;
        if (txtPincode.Text.Trim() != "")
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string[] pincodelist = ds.Tables[0].Rows[i]["pincodelist"].ToString().Split(',');
                if (pincodelist.Contains(txtPincode.Text))
                {
                    //change 
                    BtnCheckPincode.Visible = false;
                    btnavailable.Visible = true;
                    btnavailable.Enabled = false;
                    txtPincode.Enabled = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Service Available !')", true);
                    flag = 1;
                    break;
                }

            }

            if (flag == 0)
            {
                txtPincode.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Service Not Available in the Provided Pincode.Please check another Location !')", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enter any Pincode !')", true);
        }
    }
    
    protected void ddlPrdoDescription_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var myDropDownList = e.Item.FindControl("ddlsize") as DropDownList;
            //int currentItemID = int.Parse(this.ddlPrdoDescription.DataKeys[e.Item.ItemIndex].ToString());

            if (Session["pid"] != null)
            {
                DataSet ds = obj.fillDataSet("select MFlag,Measurement from productdescription where PId="+Session["pid"]);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["MFlag"].ToString() != "0")
                    {
                        myDropDownList.Visible = true;
                        string[] sizelist = ds.Tables[0].Rows[0]["Measurement"].ToString().Split(',');

                        
                        for (int i = 0; i < sizelist.Length; i++)
                        {
                            myDropDownList.Items.Add(new ListItem(sizelist[i],sizelist[i]));
                        }
                            myDropDownList.DataSource = null; //GetDDLDataSource(currentItemID);
                        myDropDownList.DataBind();
                    }
                    else
                        myDropDownList.Visible = false;
                }
            }
        }
    }


    protected void btnRecomAddToCart_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
         //   if (Session["uid"] != null && Session["sessionid"] != null)
           // {
                string[] commandArgs = ((Button)sender).CommandArgument.ToString().Split(new char[] { ',' });
                string pid = commandArgs[0];
                string cid = commandArgs[1];
                string rid = commandArgs[2];

                //Button btnAddToCart = (Button)sender;
                //DataListItem item = (DataListItem)btnAddToCart.NamingContainer;
                //var ddlsize = (DropDownList)item.FindControl("ddlsize");



                if (Session["sessionid"] != null)
                {
                    Response.Redirect("SingleProduct.aspx?pid=" + pid);

                    //DB obj = new DB();
                    //obj.UserSessionId = Session["sessionid"].ToString();
                    //obj.EmpId = Session["uid"].ToString();
                    //obj.ProdCId = cid;
                    //obj.ProdRId = rid;
                    //obj.ProdId = pid;
                    //int i = obj.AddNewCartProdInfo();
                    //    if (i > 0)
                    //        ((Label)Master.FindControl("lblcountcart")).Text = (Convert.ToInt32(((Label)Master.FindControl("lblcountcart")).Text) + 1).ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx?pid=" + pid + "&cid=" + cid + "&rid=" + rid);
                }
            
            //else
            //{
            //    Response.Redirect("Login.aspx");
            //}
        }
    }

    private DataSet get_recommended_prodlist(DataSet ds, char flag)
    {
        DataSet dss = new DataSet();

        if (flag == 'f')
        {
            if (lblleftindex.Text == "" && lblrightindex.Text == "")
            {
                lblleftindex.Text = "0";
                if (ds.Tables[0].Rows.Count > 4)
                {
                    lblrightindex.Text = "3";
                }
                else
                {
                    lblrightindex.Text = (ds.Tables[0].Rows.Count - 1).ToString();
                }
            }
            else
            {
                int max = ds.Tables[0].Rows.Count;
                if ((Convert.ToInt32(lblrightindex.Text) + 3) <= max)
                {
                    lblleftindex.Text = lblrightindex.Text;
                    lblrightindex.Text = (Convert.ToInt32(lblrightindex.Text) + 3).ToString();
                }
                else
                {
                    lblleftindex.Text = lblrightindex.Text;
                    lblrightindex.Text = (max - 1).ToString();
                }
            }
        }
        else
        {
            int min = 0;
            if ((Convert.ToInt32(lblleftindex.Text) - 3) >= min)
            {
                lblrightindex.Text = lblleftindex.Text;
                lblleftindex.Text = (Convert.ToInt32(lblleftindex.Text) - 3).ToString();
            }
            else
            {
                if (ds.Tables[0].Rows.Count >= 4)
                {
                    lblrightindex.Text = "3";
                    lblleftindex.Text = "0";
                }
                else
                {
                    lblleftindex.Text = "0";
                    lblrightindex.Text = (ds.Tables[0].Rows.Count - 1).ToString();
                }
            }

        }

        dss = ds.Clone();

        for (int i = Convert.ToInt32(lblleftindex.Text); i <= Convert.ToInt32(lblrightindex.Text); i++)
        {
            dss.Tables[0].ImportRow(ds.Tables[0].Rows[i]);
        }



        //for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        //{
        //    if (ds1.Tables[0].Rows[i].ItemArray[0].ToString() != "SomeValue")
        //    {

        //    }
        //}

        return dss;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = obj.GetRecommendedProducts(lblcid.Text);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ImageButton1.Visible = true;
            ImageButton2.Visible = true;
            pnlRecomProdList.Visible = false;
            dlRecomProd.DataSource = get_recommended_prodlist(ds, 'r');
            dlRecomProd.DataBind();
        }
        else
        {
            ImageButton1.Visible = false;
            ImageButton2.Visible = false;
            pnlRecomProdList.Visible = true;
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        DataSet ds = obj.GetRecommendedProducts(lblcid.Text);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ImageButton1.Visible = true;
            ImageButton2.Visible = true;
            pnlRecomProdList.Visible = false;
            dlRecomProd.DataSource = get_recommended_prodlist(ds, 'f');
            dlRecomProd.DataBind();
        }
        else
        {
            pnlRecomProdList.Visible = true;
            ImageButton1.Visible = false;
            ImageButton2.Visible = false;
        }
    }
}