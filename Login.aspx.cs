﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    string constr;
    DB obj;

    protected void Page_Load(object sender, EventArgs e)
    {
        //btnLogin.OnClientClick = ClientScript.GetPostBackEventReference(btnLogin, "") + "; this.value='Logging in...';this.disabled = true;";
        if (!IsPostBack)
        {
            btnLogin.Text = "Login";
            btnLogin.Enabled = true;
            if (Session["loginid"] != null && Session["loginid"].ToString() != "")
            {

            }
            else
            {
                ((LinkButton)Master.FindControl("btnMyOrder")).Visible = false;
                ((LinkButton)Master.FindControl("lnkbtnLogin")).Text = "Login";
            }
        }
        //    if (Request.QueryString["pid"] != null && Request.QueryString["cid"] != null && Request.QueryString["rid"] != null)
        //    {
        //        Session["pid"] = Request.QueryString["pid"].ToString();
        //        Session["cid"] = Request.QueryString["cid"].ToString();
        //        Session["rid"] = Request.QueryString["rid"].ToString();
        //        obj.ProdCId = Request.QueryString["cid"].ToString();
        //        obj.ProdId = Request.QueryString["pid"].ToString();
        //        obj.ProdRId = Request.QueryString["rid"].ToString();
        //    }
        //    else
        //        if(Request.QueryString["pid"] != null)
        //        {
        //            Session["pid"] = Request.QueryString["pid"];
        //        }
        //    else
        //            if (Request.QueryString["cartlist"] != null)
        //            {

        //            }
        //}
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var userObject = new Dictionary<string, string>();
        try
        {

            if (txtPwd.Value.Trim() != "" && txtUName.Value.Trim() != "")
            {
                btnLogin.Text = "Checking...";
                btnLogin.Enabled = false;
                obj = new DB();
                userObject = obj.ValidateUserLoginDetails(txtUName.Value, txtPwd.Value);
                if (userObject.ContainsKey("loginid") && userObject.ContainsKey("userType"))
                {
                    //string loginid = userObject.TryGetValue("loginid",out loginid);
                    if (!string.IsNullOrEmpty(userObject["loginid"].ToString()) && !string.IsNullOrEmpty(userObject["userType"].ToString()))
                    {
                        Session["loginid"] = userObject["loginid"];
                        Session["userType"] = userObject["userType"];

                        if (Request.QueryString["pid"] != null)
                        {
                            Response.Redirect("SingleProdInfo.aspx?pid=" + Request.QueryString["pid"].ToString() + "&p=" + Request.QueryString["p"].ToString() + "&r=" + Request.QueryString["r"].ToString() + "&l=" + Request.QueryString["l"].ToString() + "");
                        }
                        else
                        {
                            Response.Redirect("Default.aspx");
                        }
                    }
                    else
                    {
                        btnLogin.Text = "Login";
                        btnLogin.Enabled = true;
                        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Invalid UserId or Password !');", true);
                    }
                   
                }               
                else
                {
                    btnLogin.Text = "Login";
                    btnLogin.Enabled = true;
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Invalid UserId or Password !');", true);
                }
            }
            else
            {
                btnLogin.Text = "Login";
                btnLogin.Enabled = true;
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Field cannot be left empty !');", true);
            }
        }
        catch (Exception ex)
        { }
        finally
        {

            obj = null;
        }

    }
}