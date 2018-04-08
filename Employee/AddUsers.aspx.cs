using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_AddUsers : System.Web.UI.Page
{
    DB obj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginid"] != null && Session["loginid"].ToString() != "" && Session["mode"].ToString() == "E")
        {
            hdnLoginId.Value = Convert.ToString(Session["loginid"]);
            if (!IsPostBack)
            {

            }
        }
        else
        {
            Response.Redirect("~/PanelLogin.aspx?mode=E");
        }
      
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtMobile.Text.Trim() != "")
            {
                obj = new DB();
                string pwd = obj.CreatePassword();
                string mob = txtMobile.Text;
                var i = obj.CreateUserInfo(mob, pwd, Session["loginid"].ToString());
                if (!string.IsNullOrEmpty(i))
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.success('Login Password Created Successfully !');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.error('Login Password cannot be created try later !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "Toast Message", "toastr.warning('Please enter mobile number !');", true);
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


    [WebMethod]
    public static string addUser(string mobile, string loginId)
    {
        string pwd = DB.GeneratePassword();
        var logdetails =new DB().CreateUserInfo(mobile, pwd, loginId);
        if (!string.IsNullOrEmpty(logdetails))
        {
            string msg = "Registered Successfully.Your UserId : " + logdetails + " and Password : " + pwd;
            new DB().SendMessage(mobile, msg);
        }

        return getUser();
    }

    [WebMethod]
    public static string updateUser(string mobile, string loginId)
    {
        var db = new DB();
        db.UpdateEmailUser(loginId, mobile);
        return getUser();
    }

    [WebMethod]
    public static string deleteUser(string mobile, string loginId)
    {
        var db = new DB();
        db.DeleteUser(loginId, mobile);
        return getUser();
    }


    [WebMethod]
    public static string getUser()
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        ArrayList objs = new ArrayList();
        con = new SqlConnection(DB.constr);
        cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandType = CommandType.StoredProcedure;

        cmd.CommandText = "Select * from User_LoginInfo";
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();


        while (dr.Read())
        {
            objs.Add(new
            {
                UserId = dr["UserId"],
                Mobile = dr["Mobile"],
                UPwd = dr["UPwd"],
                Registration_Mode = dr["RegistrationMode"],
                RegistrationType = dr["RegistraionType"],

            });

        }

        var searialize = new JavaScriptSerializer();
        return searialize.Serialize(objs);
    }
}