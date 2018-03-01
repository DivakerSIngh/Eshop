using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class LogisticList : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        obj=new DB();
        if(Session["uid"] != null)
        {
            obj.EmpId = Session["uid"].ToString();
            bind_grid();

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

    private void bind_grid()
    {
        DataSet ds = obj.fillDataSet("select lid,title from logisticinfo");
        gv_LogisticList.DataSource = ds.Tables[0];
        gv_LogisticList.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = (LinkButton)(sender);
        string lid = lnkbtn.CommandArgument;
        Session["Lid"] = lid;
        Session["uid"] = obj.EmpId;
        Response.Redirect("AddLogistic.aspx");
    }
}