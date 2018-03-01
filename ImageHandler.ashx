<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;


public class ImageHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");


      if (context.Request.QueryString["idsingle"] != null)
            {
                string id = context.Request.QueryString["idsingle"].ToString();
                

                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["SConStr"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);

                SqlDataAdapter da = new SqlDataAdapter("select top 1 pimage from productimage where pid="+id, con);
                DataSet ds = new DataSet();
                da.Fill(ds);


                //DataSet ds = obj.fillDataSet("");
                if (ds.Tables[0].Rows.Count > 0)
                    context.Response.BinaryWrite((Byte[])ds.Tables[0].Rows[0]["pimage"]);
                else
                    context.Response.WriteFile("~/images/no_image.png");
                context.Response.End();
                ds.Clear();
            }


            if (context.Request.QueryString["idall"] != null)
            {
                string id = context.Request.QueryString["idall"].ToString();


                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["SConStr"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);

                SqlDataAdapter da = new SqlDataAdapter("select pimage from productimage where pimgid=" + id, con);
                DataSet ds = new DataSet();
                da.Fill(ds);


                //DataSet ds = obj.fillDataSet("");
                if (ds.Tables[0].Rows.Count > 0)
                    context.Response.BinaryWrite((Byte[])ds.Tables[0].Rows[0]["pimage"]);
                else
                    context.Response.WriteFile("~/images/no_image.png");
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