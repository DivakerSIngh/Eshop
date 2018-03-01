using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class ProductList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new DB();
        if (!IsPostBack)
        {
            bind_grid();
            if (Session["uname"] != null && Session["uname"].ToString() != "")
            {
                lblname.Text = Session["uname"].ToString();
            }
        }
        if (Session["uid"] != null)
        {
            obj.EmpId = Session["uid"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    private void bind_grid()
    {
        DataSet ds = obj.fillDataSet("select pid,HeaderTitle,SellingPrice,CostPrice from productdescription order by pid ");
        gv_ProductList.DataSource = ds.Tables[0];
        gv_ProductList.DataBind();
    }
    protected void LinkButtonProd_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = (LinkButton)(sender);
        string pid = lnkbtn.CommandArgument;
        Session["Pid"] = pid;
        Session["uid"] = obj.EmpId;
        Response.Redirect("AddProduct.aspx");
    }
}