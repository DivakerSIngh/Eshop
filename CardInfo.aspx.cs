using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CardInfo : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();

            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {
                if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString() != "")
                {
                    if (Request.QueryString["type"].ToString() == "P")
                    {
                        pnlPremiumCard.Visible = true;
                        pnlGiftVoucher.Visible = false;
                        string[] str = Session["loginid"].ToString().Split(',');
                        DataSet ds = obj.GetPreCardInfo(str[0]);
                        if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["CCardId"].ToString() != "")
                        {
                            string s1 = "", s2 = "", s3 = "", s4 = "", s = ds.Tables[0].Rows[0]["CCardId"].ToString();
                            s1 = ds.Tables[0].Rows[0]["CCardId"].ToString().Substring(0, 4);
                            s2 = ds.Tables[0].Rows[0]["CCardId"].ToString().Substring(4, 4);
                            s3 = ds.Tables[0].Rows[0]["CCardId"].ToString().Substring(8, 4);
                            s4 = ds.Tables[0].Rows[0]["CCardId"].ToString().Substring(12, 4);
                            lblp1.Text = s1;
                            lblp2.Text = s2;
                            lblp3.Text = s3;
                            lblp4.Text = s4;
                            lblName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                            lblStatus.Text = ds.Tables[0].Rows[0]["UType"].ToString();
                            pnlCardShow.Visible = true;
                            pnlFreeUser.Visible = false;
                        }
                        else
                        {
                            pnlCardShow.Visible = false;
                            pnlFreeUser.Visible = true;

                        }

                    }
                    else
                    {
                        pnlPremiumCard.Visible = false;
                        pnlGiftVoucher.Visible = true;
                        string[] str = Session["loginid"].ToString().Split(',');
                        DataSet ds = obj.GetGiftVoucherInfo(str[0]);
                        DataSet dss = obj.GetGiftVoucherCount(str[0]);
                        lblQty.Text = dss.Tables[0].Rows[0]["Qty"].ToString();
                        rptGiftVoucherList.DataSource = ds.Tables[0];
                        rptGiftVoucherList.DataBind();
                        pnlGiftList.Visible = false;
                        btnViewGiftCard.Visible = true;
                    }
                }
                else
                {
                    Server.Transfer("Default.aspx");
                }
            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }

    }
    protected void btnViewGiftCard_Click(object sender, EventArgs e)
    {
        pnlGiftList.Visible = true;
        btnViewGiftCard.Visible = false;
    }
    protected void btnPremium_Click(object sender, EventArgs e)
    {
        try
        {
            obj = new DB();
            string s = ddlsize.SelectedValue.ToString() ;
            int i = 0;
            string[] str = Session["loginid"].ToString().Split(',');
            
            i = obj.UpdateTshirtInfo(str[0], s);
            if (i > 0)
            {
                //string[] str = Session["loginid"].ToString().Split(',');
                Session["loginid"] = str[0] + ",,Premium";
                Response.Redirect("https://www.payumoney.com/paybypayumoney/#/7635AD18145CB644F5BA064AF9854819");
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
        }
    }
    protected void lbtnUsegiftVoucher_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewProducts.aspx?cid=1");
    }
}