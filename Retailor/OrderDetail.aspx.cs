using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Retailor_OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString["Tid"]!=null)
            {
                string transid = Request.QueryString["Tid"].ToString();
                string rid = Request.QueryString["Rid"].ToString();
                bindRepeater(transid,rid);
            }
        }
    }

    private void bindRepeater(string tid,string rid)
    {
        DB obj = new DB();
        DataSet ds = new DataSet();
        ds = obj.getOrderDetail(tid,rid);
        if(ds.Tables[0].Rows.Count>0)
        {
            rptOrderDetail.DataSource = ds.Tables[0];
            rptOrderDetail.DataBind();
        }
    }
}