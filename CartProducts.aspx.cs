using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;



public partial class CartProducts : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["sessionid"] != null && Session["uid"] != null)
            {
                obj = new DB();
                obj.EmpId = Session["uid"].ToString();
                //Session["sessionid"] = obj.LoginSession(Session["uid"].ToString());
                obj.UserSessionId = Session["sessionid"].ToString();
                //int i = obj.GetCartCount();
                //((Label)Master.FindControl("lblcountcart")).Text = (i).ToString();

                load_grid();
                ((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Logout";

                

            }
            else
            {
                lblNoRecord.Visible = true;
                gv_ProductList.Visible = false;
                btnPurchase.Visible = false;
            }
        }
    }

    private void load_grid()
    {
        obj=new DB();
        DataSet ds = obj.fillDataSet("select s.sessionid,p.pid,p.HeaderTitle,p.SellingPrice from ProductDescription as p inner join UserCartDetails as s on p.PId=s.ProdId  where p.Quantity > 0 and s.SessionId="+Session["sessionid"].ToString()+ " and buy_status=1");
        if(ds.Tables[0].Rows.Count > 0)
        {
            lblNoRecord.Visible = false;
            btnPurchase.Visible = true;
            gv_ProductList.Visible = true;
            gv_ProductList.DataSource = ds.Tables[0];
            gv_ProductList.DataBind();

        }
        else
        {
            lblNoRecord.Visible = true;
            btnPurchase.Visible = false;
            gv_ProductList.DataSource = null;
            gv_ProductList.Visible = false;
        }
    }

    protected void lnkRemove_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "DeleteCartItem")
        {
            if (Session["uid"] != null && Session["sessionid"] != null)
            {
                string[] commandArgs = ((LinkButton)sender).CommandArgument.ToString().Split(new char[] { ',' });
                string pid = commandArgs[0];
                string sessionid = commandArgs[1];
                obj = new DB();
                obj.UserSessionId = sessionid;
                obj.ProdId = pid;
                int i = obj.DeleteCartItem();
                //int ii = obj.GetCartCount();
                //((Label)Master.FindControl("lblcountcart")).Text = (Convert.ToInt16(((Label)Master.FindControl("lblcountcart")).Text)-1).ToString();

                if (i > 0)
                {
                    load_grid();
                }
                else
                {

                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    protected void btnPurchase_Click(object sender, EventArgs e)
    {
        int flag = 1;
        string[,] cartitems=new string[gv_ProductList.Rows.Count,5];
        for (int i = 0; i < gv_ProductList.Rows.Count; i++)
        {
            Label sessionid = (Label)gv_ProductList.Rows[i].FindControl("lblSessionId");
            Label pid = (Label)gv_ProductList.Rows[i].FindControl("lblpid");
            TextBox quantity = (TextBox)gv_ProductList.Rows[i].FindControl("txtQuantity");
            Label totalamt = (Label)gv_ProductList.Rows[i].FindControl("lblTotalPrice");
            Label sellingprice = (Label)gv_ProductList.Rows[i].FindControl("lblPriceOneProd");

            int a = 0;
            if (quantity.Text.Trim() != "" && int.TryParse(quantity.Text.Trim(),out a))
            {
                flag = 1;
                //do something
                cartitems[i,0]=sessionid.Text;
                cartitems[i,1]=pid.Text;
                cartitems[i,2]=quantity.Text;
                cartitems[i,3]=Convert.ToString((Convert.ToInt16(quantity.Text)*Convert.ToDecimal(sellingprice.Text)));
                cartitems[i, 4] = sellingprice.Text;
                continue;
            }
            else
            {
                flag = 0;
                break;
            }
        }
        if(flag != 0)
        {
            //onsuccess save cartitems into DB
            Session["allcartitems"]=cartitems;
            Response.Redirect("ConfirmOrder.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter all products with correct quantity !')", true);
        }
    }
}