<%@ WebHandler Language="C#" Class="SingleProductHandler" %>

using System;
using System.Web;

public class SingleProductHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        if (context.Request.QueryString["id"] != null)
        {
            string id = context.Request.QueryString["id"].ToString();
            DB obj = new DB();
            System.Data.DataSet ds = obj.fillDataSet("select pimage from productimage where pimgid =" + id);
            if (ds.Tables[0].Rows.Count > 0)
                context.Response.BinaryWrite((Byte[])ds.Tables[0].Rows[0]["pimage"]);
            else
                context.Response.WriteFile("~/images/no_image.png");
            context.Response.End();
            ds.Clear();
        }

        if (context.Request.QueryString["pimgid"] != null)
        {
            string id = context.Request.QueryString["pimgid"].ToString();
            DB obj = new DB();
            System.Data.DataSet ds = obj.fillDataSet("select pimage from productimage where pimgid =" + id);
            if (ds.Tables[0].Rows.Count > 0)
                context.Response.BinaryWrite((Byte[])ds.Tables[0].Rows[0]["pimage"]);

            context.Response.End();
            ds.Clear();
        }

        if (context.Request.QueryString["UserDp"] != null)
        {
            string id = context.Request.QueryString["UserDp"].ToString();
            
            DB obj = new DB();
            System.Data.DataSet ds = obj.fillDataSet("select Img from user_info where userid='" + id+"'");
            if (ds.Tables[0].Rows.Count > 0)
                context.Response.BinaryWrite((Byte[])ds.Tables[0].Rows[0]["Img"]);
            else
                context.Response.WriteFile("~/images/new-user-image-default.png");
            context.Response.End();
            ds.Clear();
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}