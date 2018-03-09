using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class ViewProducts : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new DB(); 

        if (!Page.IsPostBack)
        {
            BindBrand();
            rbtnPrice.SelectedIndex = -1;
            if ((Request.QueryString["cid"] != null && Request.QueryString["cid"].ToString() != "") || (Request.QueryString["subcid"] != null && Request.QueryString["subcid"].ToString() != "") || (Request.QueryString["gender"] != null && Request.QueryString["gender"].ToString() != "") || (Request.QueryString["search"] != null && Request.QueryString["search"].ToString() != ""))
            {
                BindListView();
            }
        }
        if (Session["loginid"] != null && Session["loginid"].ToString() != "")
        {

            

        
        }
        else
        {
        

        }

    }

    private void BindBrand()
    {
        var lst = obj.bindBrand();
        chkNBrandList.DataSource = lst;
        chkNBrandList.DataValueField = "id";
        chkNBrandList.DataTextField = "brandName";
        chkNBrandList.DataBind();
    }


    protected void btnAddToCart1_Command(object sender, CommandEventArgs e)
    {
        string pid = e.CommandArgument.ToString();
        Response.Redirect("SingleProdInfo.aspx?pid=" + pid);
    }
    protected void lvProd_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (lvProd.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        this.BindListView();
    }
    private void BindListView(string brandId=null)
    {
        try
        {
            string cid = null, subcid = null, gender = null, search = null ;
            if (Request.QueryString["cid"] != null && Request.QueryString["cid"].ToString() != "")
            {
                cid=Request.QueryString["cid"].ToString();
            }
            if (Request.QueryString["subcid"] != null && Request.QueryString["subcid"].ToString() != "")
            {
                subcid=Request.QueryString["subcid"].ToString();
            }
            if (Request.QueryString["gender"] != null && Request.QueryString["gender"].ToString() != "")
            {
                gender=Request.QueryString["gender"].ToString();
            }

            if (Request.QueryString["search"] != null && Request.QueryString["search"].ToString() != "")
            {
                search = Request.QueryString["search"].ToString();
            }



            if (cid != null || subcid != null || gender != null || search != null)
            {
                obj = new DB();
                DataSet ds = obj.GetProducts(subcid,search,cid,gender,brandId);

                string pid = "";
                for (int i = 0; i < ds.Tables[0].Rows.Count;i++ )
                {
                    pid += ds.Tables[0].Rows[i]["pid"].ToString() + ",";
                }
                pid = pid.Substring(0, pid.Length-1);
                Session["pid"] = pid;


                    lvProd.DataSource = ds.Tables[0];
                lvProd.DataBind();
                //get cid for recommended products list
                string ccid = "";
                foreach (ListViewItem item in lvProd.Items)
                {
                    Label mylabel = (Label)item.FindControl("lblcid");
                    ccid = mylabel.Text;
                    if(ccid != "")
                    {
                        break;
                    }
                }
                if (ccid != "")
                {
                    DataSet dss = obj.GetProductsRecommended(cid);
                    lvProdRecommend.DataSource = dss.Tables[0];
                    lvProdRecommend.DataBind();
                }
                else
                {
                    lvProdRecommend.DataSource = null;
                    lvProdRecommend.DataBind();
                }
            }
            else
            {
                obj = new DB();
                DataSet ds = obj.GetProducts(subcid, search, cid, gender, brandId);
                string pid = "";
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    pid += ds.Tables[0].Rows[i]["pid"].ToString() + ",";
                }
                pid = pid.Substring(0, pid.Length - 1);
                Session["pid"] = pid;


                lvProd.DataSource = ds.Tables[0];
                lvProd.DataBind();

                //lvProd.DataSource =null;
                //lvProd.DataBind();
            }
        }
        catch(Exception ex)
        {

        }
        finally { obj = null; }
    }
    
    protected void btnViewProdfromList_Command(object sender, CommandEventArgs e)
    {
        string pid = e.CommandArgument.ToString();
        Response.Redirect("SingleProdInfo.aspx?pid=" + pid);
    }
    protected void rbtnPrice_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            obj = new DB();
            if (Session["pid"].ToString() != "")
            {
                
                    if (rbtnPrice.SelectedValue == "a")
                    {
                        string qry = "select pd.pid,case when len(headertitle) <= 15 then headertitle else (left(HeaderTitle,15)+'...') end as headertitle,pd.sellingprice,pd.costprice,convert(varchar,cast(pd.discount as money))as discount,pd.cid,pd.SubCId,rinfo.RRank,rinfo.UserId from productdescription as pd inner join  RetailerInfo as rinfo on pd.UserId = rinfo.UserId where cast(pd.quantity as bigint) > 0 and pd.pid in (" + Session["pid"].ToString() + ") and cast(sellingprice as bigint) between 0 and 1000";
                        DataSet ds1 = obj.fillDataSet(qry);
                        lvProd.DataSource = ds1.Tables[0];
                        lvProd.DataBind();
                    }
                
                else
                    if(rbtnPrice.SelectedValue == "b")
                    {
                        string qry2 = "select pd.pid,case when len(headertitle) <= 15 then headertitle else (left(HeaderTitle,15)+'...') end as headertitle,pd.sellingprice,pd.costprice,convert(varchar,cast(pd.discount as money))as discount,pd.cid,pd.SubCId,rinfo.RRank,rinfo.UserId from productdescription as pd inner join  RetailerInfo as rinfo on pd.UserId = rinfo.UserId where cast(pd.quantity as bigint) > 0 and pd.pid in (" + Session["pid"].ToString() + ") and cast(sellingprice as bigint) between 1000 and 3000";
                        DataSet dsmax = obj.fillDataSet(qry2);
                        lvProd.DataSource = dsmax.Tables[0];
                        lvProd.DataBind();
                    }
                else
                    if(rbtnPrice.SelectedValue == "c")
                    {
                        string qry3 = "select pd.pid,case when len(headertitle) <= 15 then headertitle else (left(HeaderTitle,15)+'...') end as headertitle,pd.sellingprice,pd.costprice,convert(varchar,cast(pd.discount as money))as discount,pd.cid,pd.SubCId,rinfo.RRank,rinfo.UserId from productdescription as pd inner join  RetailerInfo as rinfo on pd.UserId = rinfo.UserId where cast(pd.quantity as bigint) > 0 and pd.pid in (" + Session["pid"].ToString() + ") and cast(sellingprice as bigint) between 3000 and 5000";
                        DataSet dsmax3 = obj.fillDataSet(qry3);
                        lvProd.DataSource = dsmax3.Tables[0];
                        lvProd.DataBind();
                    }
                else
                    if(rbtnPrice.SelectedValue == "d")
                    {
                        string qry4 = "select pd.pid,case when len(headertitle) <= 15 then headertitle else (left(HeaderTitle,15)+'...') end as headertitle,pd.sellingprice,pd.costprice,convert(varchar,cast(pd.discount as money))as discount,pd.cid,pd.SubCId,rinfo.RRank,rinfo.UserId from productdescription as pd inner join  RetailerInfo as rinfo on pd.UserId = rinfo.UserId where cast(pd.quantity as bigint) > 0 and pd.pid in (" + Session["pid"].ToString() + ") and cast(sellingprice as bigint) between 5000 and 10000";
                        DataSet dsmax4 = obj.fillDataSet(qry4);
                        lvProd.DataSource = dsmax4.Tables[0];
                        lvProd.DataBind();
                    }
                
            }
        }
        catch(Exception ex)
        {

        }
    }

    protected void chkNBrandList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedItems = String.Join(",", chkNBrandList.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Value));
        BindListView(selectedItems);
    }

    protected void RadSlider1_ValueChanged(object sender, EventArgs e)
    {

    }
}