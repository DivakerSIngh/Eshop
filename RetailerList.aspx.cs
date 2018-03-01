using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class RetailerList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj = new DB();
        if(!IsPostBack)
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
        DataSet ds = obj.fillDataSet("select rid,rname from retailerinfo");
        gv_RetailerList.DataSource = ds.Tables[0];
        gv_RetailerList.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = (LinkButton)(sender);
        string rid = lnkbtn.CommandArgument;
        Session["Rid"] = rid;
        Session["uid"] = obj.EmpId;
        Response.Redirect("AddRetailerInfo.aspx");
    }
}