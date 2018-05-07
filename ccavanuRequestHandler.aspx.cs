using CCA.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ccavanuRequestHandler : System.Web.UI.Page
{
    CCACrypto ccaCrypto = new CCACrypto();
    string workingKey = "6495FC57F155EE0E038A040E4A5EDB08";//put in the 32bit alpha numeric key in the quotes provided here 	
    string ccaRequest = "";
    public string strEncRequest = "";
    public string strAccessCode = "AVDC77FE85AM47CDMA";// put the access key in the quotes provided here.
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            foreach (string name in Request.Form)
            {
                if (name != null)
                {
                    if (!name.StartsWith("_"))
                    {
                        ccaRequest = ccaRequest + name + "=" + Request.Form[name] + "&";
                        /* Response.Write(name + "=" + Request.Form[name]);
                          Response.Write("</br>");*/
                    }
                }
            }
            strEncRequest = ccaCrypto.Encrypt(ccaRequest, workingKey);
        }
    }
}