using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_GenerateCoupon : System.Web.UI.Page
{
    DB obj,obj2;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        try
        {
            //obj = new DB();
            //obj.SendEmail();
            if(txtLimit.Text.Trim() != "")
            {
                
                int j = 0; string s1 = "", s2 = "";
                for(int i=1;i<=Convert.ToInt32(txtLimit.Text);i++)
                {
                    obj = new DB();
                    obj2 = new DB();
                    s1 = obj.Get8DigitRandomNumber1();
                    s2 = obj2.Get8DigitRandomNumber2();
                    j = obj.GenerateCouponCardIdforUnassignedUsers((s1 + s2));
                    if (j > 0)
                    {

                    }
                    else
                    {
                        --i;
                    }
                    obj = null;
                    obj2 = null;
                    
                }
            }
            else
            {

            }
            
        }
        catch (Exception ex)
        {

        }
        finally
        {
            obj = null;
            obj2 = null;
        }
    }
}