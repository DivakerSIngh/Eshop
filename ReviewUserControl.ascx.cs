using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReviewUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (hdnSearch.Value.Trim() != "")
            Response.Redirect("ViewProducts.aspx?search=" + hdnSearch.Value);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(userControlProduct.Value))
        {
            var product = userControlProduct.Value;
            new DB().saveReview(Convert.ToInt32(product.Split('~')[0]),
                product.Split('~')[1],
                Convert.ToInt32(txtrating.Text),
                 Convert.ToString(txtReview.Text),
                product.Split('~')[3],
               1);
            Response.Redirect(Request.Url.ToString());
           // Response.Redirect("Default.aspx");
        }else
        {
            if (hdnSearch.Value.Trim() != "")
                Response.Redirect("ViewProducts.aspx?search=" + hdnSearch.Value);
        }
       

    }
}