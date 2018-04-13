using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;
using RestSharp;
using RestSharp.Authenticators;
using System.Collections;

/// <summary>
/// Summary description for DB
/// </summary>
public class DB
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    public string EmpId
    {
        get;
        set;
    }

    public int BrandId
    {
        get;
        set;
    }

    public string Color
    {
        get;
        set;
    }
    public bool isReturnPolicy
    {
        get;
        set;
    }
    public decimal Wieght
    {
        get;
        set;
    }
    public string Dimension
    {
        get;
        set;
    }
    public string logtitle
    {
        get;
        set;
    }

    public string logaddress
    {
        get;
        set;
    }

    public string logmobile
    {
        get;
        set;
    }

    public string logemail
    {
        get;
        set;
    }

    public string logdescription
    {
        get;
        set;
    }

    public string logpincodelist
    {
        get;
        set;
    }

    public string logLId
    {
        get;
        set;
    }

    public string RetId
    {
        get;
        set;
    }
    public string RetName
    {
        get;
        set;
    }
    public string RetDescription
    {
        get;
        set;
    }
    public string RetMobile
    {
        get;
        set;
    }

    public string RetEmail
    {
        get;
        set;
    }

    public string RetAddress
    {
        get;
        set;
    }


    public string ProdId
    {
        get;
        set;
    }

    public string ProdTitle
    {
        get;
        set;
    }
    public string ProdCP
    {
        get;
        set;
    }
    public string ProdSP
    {
        get;
        set;
    }

    public string ProdDiscount
    {
        get;
        set;
    }
    public string ProdQuantity
    {
        get;
        set;
    }
    public string ProdDesc
    {
        get;
        set;
    }
    public string PMeasurementFlag
    {
        get;
        set;
    }
    public string ProdAllSize
    {
        get;
        set;
    }
    public string ProdTitle1
    {
        get;
        set;
    }
    public string ProdValue1
    {
        get;
        set;
    }
    public string ProdTitle2
    {
        get;
        set;
    }
    public string ProdValue2
    {
        get;
        set;
    }
    public string ProdTitle3
    {
        get;
        set;
    }
    public string ProdValue3
    {
        get;
        set;
    }
    public string ProdTitle4
    {
        get;
        set;
    }
    public string ProdValue4
    {
        get;
        set;
    }
    public string ProdTitle5
    {
        get;
        set;
    }
    public string ProdValue5
    {
        get;
        set;
    }
    public string ProdTitle6
    {
        get;
        set;
    }
    public string ProdValue6
    {
        get;
        set;
    }
    public string ProdTitle7
    {
        get;
        set;
    }
    public string ProdValue7
    {
        get;
        set;
    }
    public string ProdTitle8
    {
        get;
        set;
    }
    public string ProdValue8
    {
        get;
        set;
    }
    public string ProdTitle9
    {
        get;
        set;
    }
    public string ProdValue9
    {
        get;
        set;
    }
    public string ProdTitle10
    {
        get;
        set;
    }
    public string ProdValue10
    {
        get;
        set;
    }

    public string ProdCId
    {
        get;
        set;
    }


    public string ProdRId
    {
        get;
        set;
    }

    public string ProdImgCId
    {
        get;
        set;
    }

    public string ProdImgRId
    {
        get;
        set;
    }

    public string ProdImgId
    {
        get;
        set;
    }

    public string ProdGender
    {
        get;
        set;
    }

    public string UserCartProdId
    {
        get;
        set;
    }

    public string UserSessionId
    {
        get;
        set;
    }

    public string ProdSize
    {
        get;
        set;
    }

    public string LogisticId
    {
        get;
        set;
    }

    public string Pincode
    {
        get;
        set;
    }

    public string UserMobile
    {
        get;
        set;
    }


    public string UserAddress
    {
        get;
        set;
    }


    public string PriceOneProd
    {
        get;
        set;
    }

    public string TotalPrice
    {
        get;
        set;
    }

    public string UserName
    {
        get;
        set;
    }

    public string UserEmail
    {
        get;
        set;
    }

    public string PaymentMode
    {
        get;
        set;
    }

    public string TransactionId
    {
        get;
        set;
    }

    public string UserPassword
    {
        get;
        set;
    }

    public string OTP
    {
        get;
        set;
    }

    public static string constr = "";

    public DB()
    {
        //
        // TODO: Add constructor logic here
        //
        constr = ConfigurationManager.ConnectionStrings["SConStr"].ConnectionString;

    }

    public SqlConnection GetConnection()
    {
        SqlConnection con = new SqlConnection(constr);

        con.Open();
        return con;

    }

    public DataSet fillDataSet(string query)
    {
        SqlConnection con = new SqlConnection(constr);
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        try
        {

            da.Fill(ds);


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int AddNewLogistic()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AddNewLogistic";

            cmd.Parameters.AddWithValue("@Title", logtitle);
            cmd.Parameters.AddWithValue("@LAddress", logaddress);
            cmd.Parameters.AddWithValue("@LMobile1", logmobile);
            cmd.Parameters.AddWithValue("@LEmailAddress1", logemail);
            cmd.Parameters.AddWithValue("@LDescription", logdescription);
            cmd.Parameters.AddWithValue("@PincodeList", logpincodelist);
            cmd.Parameters.AddWithValue("@lloginId", EmpId);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public int UpdateLogistic()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateLogisticInfo";

            cmd.Parameters.AddWithValue("@Title", logtitle);
            cmd.Parameters.AddWithValue("@LAddress", logaddress);
            cmd.Parameters.AddWithValue("@LMobile1", logmobile);
            cmd.Parameters.AddWithValue("@LEmailAddress1", logemail);
            cmd.Parameters.AddWithValue("@LDescription", logdescription);
            cmd.Parameters.AddWithValue("@PincodeList", logpincodelist);
            cmd.Parameters.AddWithValue("@UpdationEmpId", EmpId);
            cmd.Parameters.AddWithValue("@LId", logLId);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }


    public int AddNewRetailerInfo()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AddNewRetailerInfo";

            cmd.Parameters.AddWithValue("@RName", RetName);
            cmd.Parameters.AddWithValue("@RMobile1", RetMobile);
            cmd.Parameters.AddWithValue("@REmail1", RetEmail);
            cmd.Parameters.AddWithValue("@RDescription", RetDescription);
            cmd.Parameters.AddWithValue("@EntryBy_EmpId", EmpId);
            cmd.Parameters.AddWithValue("@RAddress", RetAddress);

            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }


    public int UpdateRetailerInfo()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateRetailerInfo";

            cmd.Parameters.AddWithValue("@RName", RetName);
            cmd.Parameters.AddWithValue("@REmail1", RetEmail);
            cmd.Parameters.AddWithValue("@RMobile1", RetMobile);
            cmd.Parameters.AddWithValue("@RDescription", RetDescription);
            cmd.Parameters.AddWithValue("@RAddress", RetAddress);
            cmd.Parameters.AddWithValue("@UpdateBy_EmpId", EmpId);
            cmd.Parameters.AddWithValue("@RId", RetId);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }


    public int AddNewProdInfo(string subcid, string gender)
    {
        int i, id = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AddNewProductInfo";

            cmd.Parameters.AddWithValue("@HeaderTitle", ProdTitle);
            cmd.Parameters.AddWithValue("@SellingPrice", ProdSP);
            cmd.Parameters.AddWithValue("@CostPrice", ProdCP);
            cmd.Parameters.AddWithValue("@PDescription", ProdDesc);
            cmd.Parameters.AddWithValue("@Quantity", ProdQuantity);
            cmd.Parameters.AddWithValue("@Discount", ProdDiscount);


            cmd.Parameters.AddWithValue("@Brand_Id", BrandId);
            cmd.Parameters.AddWithValue("@colors", Color);
            cmd.Parameters.AddWithValue("@IsReturnPolicy", isReturnPolicy);
            cmd.Parameters.AddWithValue("@weight", Wieght);
            cmd.Parameters.AddWithValue("@dimension", Dimension);

            cmd.Parameters.AddWithValue("@Title1", ProdTitle1);
            cmd.Parameters.AddWithValue("@Value1", ProdValue1);
            cmd.Parameters.AddWithValue("@Title2", ProdTitle2);
            cmd.Parameters.AddWithValue("@Value2", ProdValue2);
            cmd.Parameters.AddWithValue("@Title3", ProdTitle3);
            cmd.Parameters.AddWithValue("@Value3", ProdValue3);
            cmd.Parameters.AddWithValue("@Title4", ProdTitle4);
            cmd.Parameters.AddWithValue("@Value4", ProdValue4);
            cmd.Parameters.AddWithValue("@Title5", ProdTitle5);
            cmd.Parameters.AddWithValue("@Value5", ProdValue5);
            cmd.Parameters.AddWithValue("@Title6", ProdTitle6);
            cmd.Parameters.AddWithValue("@Value6", ProdValue6);
            cmd.Parameters.AddWithValue("@Title7", ProdTitle7);
            cmd.Parameters.AddWithValue("@Value7", ProdValue7);
            cmd.Parameters.AddWithValue("@Title8", ProdTitle8);
            cmd.Parameters.AddWithValue("@Value8", ProdValue8);
            cmd.Parameters.AddWithValue("@Title9", ProdTitle9);
            cmd.Parameters.AddWithValue("@Value9", ProdValue9);
            cmd.Parameters.AddWithValue("@Title10", ProdTitle10);
            cmd.Parameters.AddWithValue("@Value10", ProdValue10);
            cmd.Parameters.AddWithValue("@MFlag", (PMeasurementFlag));
            cmd.Parameters.AddWithValue("@Measurement", ProdAllSize != null ? ProdAllSize : (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@UserId", EmpId);
            cmd.Parameters.AddWithValue("@CId", ProdCId);
            cmd.Parameters.AddWithValue("@SubCid", subcid);
            cmd.Parameters.AddWithValue("@gender", gender);
            SqlParameter outputParam = cmd.Parameters.Add("@Product_Id", SqlDbType.Int);
            outputParam.Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            id = Convert.ToInt32(outputParam.Value);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return id;
    }



    public int UpdateProdInfo(string subcid, string gender)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateProductInfo";
            cmd.Parameters.AddWithValue("@HeaderTitle", ProdTitle);
            cmd.Parameters.AddWithValue("@SellingPrice", ProdSP);
            cmd.Parameters.AddWithValue("@CostPrice", ProdCP);
            cmd.Parameters.AddWithValue("@PDescription", ProdDesc);
            cmd.Parameters.AddWithValue("@Quantity", ProdQuantity);
            cmd.Parameters.AddWithValue("@Discount", ProdDiscount);

            cmd.Parameters.AddWithValue("@Brand_Id", BrandId);
            cmd.Parameters.AddWithValue("@colors", Color);
            cmd.Parameters.AddWithValue("@IsReturnPolicy", isReturnPolicy);
            cmd.Parameters.AddWithValue("@weight", Wieght);
            cmd.Parameters.AddWithValue("@dimension", Dimension);


            cmd.Parameters.AddWithValue("@Title1", ProdTitle1);
            cmd.Parameters.AddWithValue("@Value1", ProdValue1);
            cmd.Parameters.AddWithValue("@Title2", ProdTitle2);
            cmd.Parameters.AddWithValue("@Value2", ProdValue2);
            cmd.Parameters.AddWithValue("@Title3", ProdTitle3);
            cmd.Parameters.AddWithValue("@Value3", ProdValue3);
            cmd.Parameters.AddWithValue("@Title4", ProdTitle4);
            cmd.Parameters.AddWithValue("@Value4", ProdValue4);
            cmd.Parameters.AddWithValue("@Title5", ProdTitle5);
            cmd.Parameters.AddWithValue("@Value5", ProdValue5);
            cmd.Parameters.AddWithValue("@Title6", ProdTitle6);
            cmd.Parameters.AddWithValue("@Value6", ProdValue6);
            cmd.Parameters.AddWithValue("@Title7", ProdTitle7);
            cmd.Parameters.AddWithValue("@Value7", ProdValue7);
            cmd.Parameters.AddWithValue("@Title8", ProdTitle8);
            cmd.Parameters.AddWithValue("@Value8", ProdValue8);
            cmd.Parameters.AddWithValue("@Title9", ProdTitle9);
            cmd.Parameters.AddWithValue("@Value9", ProdValue9);
            cmd.Parameters.AddWithValue("@Title10", ProdTitle10);
            cmd.Parameters.AddWithValue("@Value10", ProdValue10);
            cmd.Parameters.AddWithValue("@MFlag", PMeasurementFlag);
            cmd.Parameters.AddWithValue("@Measurement", (PMeasurementFlag != "0" ? ProdAllSize : ""));
            cmd.Parameters.AddWithValue("@UpdationBy_EmpId", EmpId);
            cmd.Parameters.AddWithValue("@pid", ProdId);
            cmd.Parameters.AddWithValue("@CId", ProdCId);
            cmd.Parameters.AddWithValue("@SubCid", subcid);
            cmd.Parameters.AddWithValue("@gender", gender);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public int deleteMeasurement(string pid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            string str = string.Format("delete ProductMeasurementMapping where productId=" + pid);
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            i = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public int AddNewProdImgInfo(byte[] bytes)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AddNewProductImgInfo";

            cmd.Parameters.AddWithValue("@PId", ProdId);

            cmd.Parameters.AddWithValue("@PImage", bytes);
            cmd.Parameters.AddWithValue("@EmpId", EmpId);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public int ErrorLog(string query)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Clear();
            cmd.CommandText = query;

            //cmd.Parameters.AddWithValue("@PId", ProdId);

            //cmd.Parameters.AddWithValue("@PImage", bytes);
            //cmd.Parameters.AddWithValue("@EmpId", EmpId);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public int deleteImage(string id)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_DeleteImageInfo";

            cmd.Parameters.AddWithValue("@PImgId", id);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public string LoginSession(string uid)
    {
        int i = 0; string s = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UserLoginSession";

            cmd.Parameters.AddWithValue("@EmpId", EmpId);
            cmd.Parameters.Add("@SessionId", SqlDbType.NVarChar, 100).Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            s = cmd.Parameters["@SessionId"].Value.ToString();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return s;
    }

    public int LogoutSession(string sessionid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UserLogoutSession";

            cmd.Parameters.AddWithValue("@SessionId", sessionid);

            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }


    private int CheckCartProductDuplicate(string pid, string userid,string size="")
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_CheckCartDuplicacy", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@prodid", pid);
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            da.SelectCommand.Parameters.AddWithValue("@size", size);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                i = 1;
            }
            else
                i = 0;

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;
    }


    public int AddNewCartProdInfo(string pid, string userid, string rid, string amt, string size = "", string costprice = "", string discount = "", string qty = "", string deleveryamt = "", string lid = "")
    {
        int i = 0;
        try
        {
            i = CheckCartProductDuplicate(pid, userid,size);
            if (i == 0)
            {
                i = 0;
                con = new SqlConnection(DB.constr);
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.CommandText = "EShop_AddNewCartProductInfo";

                cmd.Parameters.AddWithValue("@prodid", pid);
                cmd.Parameters.AddWithValue("@rid", rid);
                //cmd.Parameters.AddWithValue("@PImage", bytes);
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@amt", amt);
                cmd.Parameters.AddWithValue("@size", size);
                cmd.Parameters.AddWithValue("@damt", deleveryamt);
                cmd.Parameters.AddWithValue("@costprice", costprice);
                cmd.Parameters.AddWithValue("@discount", discount);
                cmd.Parameters.AddWithValue("@qty", qty);
                cmd.Parameters.AddWithValue("@lid", lid);

                con.Open();
                i = cmd.ExecuteNonQuery();
            }
            else
            {
                i = 0;
            }

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }


    public int UpdateUserNewAddress(string userid, string name, string mobile, string uaddress, string city, string ustate, string pincode, string landmark, string totamt, string deliveryamt)
    {
        int i = 0;
        try
        {
            string add = name + "?" + mobile + "?" + uaddress + "?" + city + "?" + ustate + "?" + pincode + "?" + landmark;
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateDeliveryAddress";

            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@address", add);

            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;
    }


    public int UpdateQuantityInCartInfo(string cartid, string quantity, string amt)
    {
        int i = 0;
        try
        {

            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateCartInfoQuantity";

            cmd.Parameters.AddWithValue("@cartid", cartid);
            cmd.Parameters.AddWithValue("@amt", amt);
            cmd.Parameters.AddWithValue("@qty", quantity);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;
    }


    private int CheckWishlistProductDuplicate(string pid, string userid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_CheckWishListDuplicacy", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@prodid", pid);
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                i = 1;
            }
            else
                i = 0;

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;
    }

    public DataSet GetUserInfoforCheckout(string userid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetUserInfoforCheckOut", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            ds = new DataSet();
            da.Fill(ds);


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public int AddNewProdInfotoWishlist(string pid, string userid, string rid, string amt, string size)
    {
        int i = 0;
        try
        {
            i = CheckWishlistProductDuplicate(pid, userid);
            if (i == 0)
            {
                i = 0;
                con = new SqlConnection(DB.constr);
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.CommandText = "EShop_AddNewProductInfotoWishList";

                cmd.Parameters.AddWithValue("@prodid", pid);
                cmd.Parameters.AddWithValue("@rid", rid);
                //cmd.Parameters.AddWithValue("@PImage", bytes);
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@amt", amt);
                cmd.Parameters.AddWithValue("@size", size);

                con.Open();
                i = cmd.ExecuteNonQuery();
            }
            else
            {
                i = 0;
            }

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }



    public int GetCartCount(string userid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetCartCount", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                i = Convert.ToInt32(ds.Tables[0].Rows[0]["number"].ToString());
            }
            else
                i = 0;

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public DataSet CheckLocationAvailability()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetPinCodeList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            ds = new DataSet();
            da.Fill(ds);


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public int DeleteCartItem()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_DeleteCartItem";


            cmd.Parameters.AddWithValue("@sessionid", UserSessionId);
            cmd.Parameters.AddWithValue("@pid", ProdId);

            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;

    }


    public string Transaction_DetailsInfo()
    {
        int i = 0; string s = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_Transaction_DetailInfo";

            cmd.Parameters.AddWithValue("@sessionid", UserSessionId);
            cmd.Parameters.AddWithValue("@uid", EmpId);
            cmd.Parameters.AddWithValue("@prodid", ProdId);
            cmd.Parameters.AddWithValue("@sellingprice", ProdSP);
            cmd.Parameters.AddWithValue("@pincode", Pincode);
            cmd.Parameters.AddWithValue("@logisticid", LogisticId);
            cmd.Parameters.AddWithValue("@umobile", UserMobile);
            cmd.Parameters.AddWithValue("@uaddress", UserAddress);
            cmd.Parameters.AddWithValue("@quantity", ProdQuantity);
            cmd.Parameters.AddWithValue("@username", UserName);
            cmd.Parameters.AddWithValue("@paymode", PaymentMode);
            cmd.Parameters.AddWithValue("@email", UserEmail != "" ? UserEmail : "not mentioned");

            cmd.Parameters.AddWithValue("@totalprice", TotalPrice);

            cmd.Parameters.Add("@transactionid", SqlDbType.NVarChar, 100).Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            s = cmd.Parameters["@transactionid"].Value.ToString();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return s;
    }

    //public int Transaction_Confirmation(string uemail, string sessionid)
    //{
    //    int i = 0;
    //    try
    //    {
    //        con = new SqlConnection(DB.constr);
    //        cmd = new SqlCommand();
    //        cmd.Connection = con;
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Clear();
    //        cmd.CommandText = "EShop_TransactionConfrimation";

    //        cmd.Parameters.AddWithValue("@transactionid", TransactionId);
    //        cmd.Parameters.AddWithValue("@sessionid", sessionid);

    //        con.Open();
    //        i = cmd.ExecuteNonQuery();
    //        if (i > 0)
    //        {
    //            get_details_for_mail(TransactionId, uemail);
    //        }


    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //    finally
    //    {
    //        con.Close();
    //    }

    //    return i;
    //}

    private void get_details_for_mail(string tid, string uemail)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetLogisticEmail", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@transcationid", tid);
            //da.SelectCommand.Parameters.AddWithValue("@empid", EmpId);


            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string size = ds.Tables[0].Rows[0]["size"].ToString();
                if (size == "" || size == null)
                    size = "";
                send_mail_to_logistic(ds.Tables[0].Rows[0]["TransactionId"].ToString(), ds.Tables[0].Rows[0]["username"].ToString(), ds.Tables[0].Rows[0]["UMobile"].ToString(), ds.Tables[0].Rows[0]["UAddress"].ToString(), ds.Tables[0].Rows[0]["LEmailAddress1"].ToString(), ds.Tables[0].Rows[0]["Quantity"].ToString(), ds.Tables[0].Rows[0]["ProdId"].ToString(), ds.Tables[0].Rows[0]["SellingPrice"].ToString(), ds.Tables[0].Rows[0]["Pincode"].ToString(), ds.Tables[0].Rows[0]["TotalPrice"].ToString(), ds.Tables[0].Rows[0]["paymentmode"].ToString(), size, ds.Tables[0].Rows[0]["rid"].ToString(), ds.Tables[0].Rows[0]["CId"].ToString(), ds.Tables[0].Rows[0]["RName"].ToString(), ds.Tables[0].Rows[0]["RAddress"].ToString(), ds.Tables[0].Rows[0]["REmail1"].ToString(), ds.Tables[0].Rows[0]["RMobile1"].ToString(), ds.Tables[0].Rows[0]["HeaderTitle"].ToString());
                send_mail_to_customer(ds.Tables[0].Rows[0]["TransactionId"].ToString(), ds.Tables[0].Rows[0]["username"].ToString(), ds.Tables[0].Rows[0]["UMobile"].ToString(), ds.Tables[0].Rows[0]["UAddress"].ToString(), ds.Tables[0].Rows[0]["LEmailAddress1"].ToString(), ds.Tables[0].Rows[0]["Quantity"].ToString(), ds.Tables[0].Rows[0]["ProdId"].ToString(), ds.Tables[0].Rows[0]["SellingPrice"].ToString(), ds.Tables[0].Rows[0]["Pincode"].ToString(), ds.Tables[0].Rows[0]["TotalPrice"].ToString(), ds.Tables[0].Rows[0]["paymentmode"].ToString(), size, ds.Tables[0].Rows[0]["rid"].ToString(), ds.Tables[0].Rows[0]["CId"].ToString(), ds.Tables[0].Rows[0]["RName"].ToString(), ds.Tables[0].Rows[0]["RAddress"].ToString(), ds.Tables[0].Rows[0]["REmail1"].ToString(), ds.Tables[0].Rows[0]["RMobile1"].ToString(), ds.Tables[0].Rows[0]["HeaderTitle"].ToString(), uemail);
                send_mail_to_retailor(ds.Tables[0].Rows[0]["TransactionId"].ToString(), ds.Tables[0].Rows[0]["username"].ToString(), ds.Tables[0].Rows[0]["UMobile"].ToString(), ds.Tables[0].Rows[0]["UAddress"].ToString(), ds.Tables[0].Rows[0]["LEmailAddress1"].ToString(), ds.Tables[0].Rows[0]["Quantity"].ToString(), ds.Tables[0].Rows[0]["ProdId"].ToString(), ds.Tables[0].Rows[0]["SellingPrice"].ToString(), ds.Tables[0].Rows[0]["Pincode"].ToString(), ds.Tables[0].Rows[0]["TotalPrice"].ToString(), ds.Tables[0].Rows[0]["paymentmode"].ToString(), size, ds.Tables[0].Rows[0]["rid"].ToString(), ds.Tables[0].Rows[0]["CId"].ToString(), ds.Tables[0].Rows[0]["RName"].ToString(), ds.Tables[0].Rows[0]["RAddress"].ToString(), ds.Tables[0].Rows[0]["REmail1"].ToString(), ds.Tables[0].Rows[0]["RMobile1"].ToString(), ds.Tables[0].Rows[0]["HeaderTitle"].ToString());
            }

        }
        catch (Exception ex)
        {

        }

    }

    public string createEmailBodyforRegistrationUPwd(string userid, string pwd)
    {

        string body = string.Empty;
        //using streamreader for reading my htmltemplate   
        // string path = HttpContext.Current.Server.MapPath("~/files/sample.html");
        //string content = System.IO.File.ReadAllText(path);
        using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/MailForRegistration.html")))
        {

            body = reader.ReadToEnd();

        }

        body = body.Replace("{username}", userid); //replacing the required things  
        body = body.Replace("{password}", pwd);


        return body;

    }


    public string createEmailBodyforGiftCard(string CardNum, string uname)
    {

        string body = string.Empty;
        //using streamreader for reading my htmltemplate   
        // string path = HttpContext.Current.Server.MapPath("~/files/sample.html");
        //string content = System.IO.File.ReadAllText(path);
        using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/MailForGiftCard.html")))
        {

            body = reader.ReadToEnd();

        }

        // body = body.Replace("{name}", uname); //replacing the required things  
        body = body.Replace("{card}", CardNum);


        return body;

    }

    public string createEmailBodyforPremiumCard(string CardNum, string uname)
    {
        string body = string.Empty;
        try
        {
            //using streamreader for reading my htmltemplate   
            // string path = HttpContext.Current.Server.MapPath("~/files/sample.html");
            //string content = System.IO.File.ReadAllText(path);
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/MailForPremiumCard.html")))
            {

                body = reader.ReadToEnd();

            }

            body = body.Replace("{name}", uname); //replacing the required things  

            //string[] cardsnum = CardNum.Split(',');
            string c1 = CardNum.Substring(0, 4);
            string c2 = CardNum.Substring(4, 4);
            string c3 = CardNum.Substring(8, 4);
            string c4 = CardNum.Substring(12, 4);
            body = body.Replace("{card1}", c1);
            body = body.Replace("{card2}", c2);
            body = body.Replace("{card3}", c3);
            body = body.Replace("{card4}", c4);


            return body;
        }
        catch (Exception)
        {

        }
        return body;
    }

    public string createEmailBodyforConfirmOrder(string tid, string billingaddress, string grandtotalamt, DataSet ds, string deliveryamt, string couponamt,string Pay_Mode)
    {

        string body = string.Empty;
        string prodrow = string.Empty;
        //using streamreader for reading my htmltemplate   
        // string path = HttpContext.Current.Server.MapPath("~/files/sample.html");
        //string content = System.IO.File.ReadAllText(path);
        using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/MailforConfirmOrder.html")))
        {

            body = reader.ReadToEnd();

        }



        //replacing the required things  

        body = body.Replace("{Address}", billingaddress);
        body = body.Replace("{Date}", tid);
        body = body.Replace("{Date1}", DateTime.Now.ToShortDateString());
        body = body.Replace("{TotalAmount}", grandtotalamt);
        body = body.Replace("{Delivery}", deliveryamt);
        body = body.Replace("{Pay_Mode}", Pay_Mode);

        string div = "";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            prodrow = "";
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/ProductRow.html")))
            {

                prodrow = reader.ReadToEnd();

            }
            prodrow = prodrow.Replace("{Qty}", ds.Tables[0].Rows[i]["OrderedQty"].ToString());
            prodrow = prodrow.Replace("{ProductName}", ds.Tables[0].Rows[i]["HeaderTitle"].ToString());
            prodrow = prodrow.Replace("{Price}", ds.Tables[0].Rows[i]["TotalAmount"].ToString());
            div += prodrow;
        }


        body = body.Replace("{div}", div);


        return body;

    }

    public string createEmailBodyforRetailerndLogistic(string tid, string raddress, string name, string qty, string prodname, string mobile, string pid, string email, string price, string city, string landmark, string pincode, string state, string billingaddress)
    {

        string body = string.Empty;
        string a = raddress + "," + landmark + "," + city + "," + state + "," + pincode;
        //using streamreader for reading my htmltemplate   
        // string path = HttpContext.Current.Server.MapPath("~/files/sample.html");
        //string content = System.IO.File.ReadAllText(path);
        using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/MailforRetailerndLogistic.html")))
        {

            body = reader.ReadToEnd();

        }



        //replacing the required things  

        body = body.Replace("{Address}", a);
        body = body.Replace("{Date}", DateTime.Now.ToShortDateString());
        body = body.Replace("{Id}", tid);
        body = body.Replace("{Mobile}", mobile);
        body = body.Replace("{email}", email);
        body = body.Replace("{Pid}", pid);
        body = body.Replace("{Qty}", qty);
        body = body.Replace("{ProductName}", prodname);
        body = body.Replace("{Price}", price);
        body = body.Replace("{Name}", name);
        body = body.Replace("{billingaddress}", billingaddress);



        return body;

    }


    private void send_mail_to_logistic(string tid, string uname, string umobile, string uaddress, string log_email, string quantity, string pid, string sp, string pincode, string totalprice, string paymentmode, string size, string rid, string cid, string rname, string raddress, string remail, string rmobile, string headertitle)
    {
        try
        {
            MailMessage message = new MailMessage();

            //    string emailid = ds.Tables[0].Rows[0]["LEmailAddress1"].ToString();

            message.From = new MailAddress("svm01sri@gmail.com");
            message.To.Add(new MailAddress(log_email));

            //  message.IsBodyHtml = true;
            // string ff = FreeTextBox1.Text;
            message.Subject = "Alert : New Order placed Info ";// +DateTime.Now.ToShortDateString();
            message.BodyEncoding = System.Text.Encoding.UTF8;


            // string msg = createEmailBodyforLogistic(tid, headertitle, sp, quantity, totalprice, size, uname, umobile, pincode, uaddress, paymentmode, rname, raddress, rmobile, remail);
            //msg = "\n\n Order Related Information : \n\n";
            //msg += "Transaction Id : "+tid+"\n";
            //msg += "Product Id : " + pid + "\n";
            //msg += "Product Name : " + headertitle + "\n";
            //msg += "Product Selling Price : " + sp + "\n";
            //msg += "Product Quantity Ordered : " + quantity + "\n";
            //msg += "Product Total Price : " + totalprice + "\n";
            //if(size != "")
            //    msg += "Product Size : " + size + "\n";
            ////msg += "Product Name : " + headertitle + "\n";

            //msg += "\n\n Customer Info : "  + "\n";

            //msg += "Customer Name : " + uname + "\n";
            //msg += "Customer Mobile : " + umobile + "\n";
            //msg += "Delivery Pincode : " +pincode + "\n";
            //msg += "Delivery Adderss : " + uaddress + "\n";
            //msg += "Payment Mode : " + paymentmode + "\n";

            //msg += "\n\n Retailer Info : " + "\n";
            //msg += "Retailer Name : " + rname + "\n";
            //msg += "Retailer Address : " + raddress + "\n";
            //msg += "Retailer Mobile : " + rmobile + "\n";
            //msg += "Retailer EMail Address : " + remail + "\n";

            message.Body = "";//msg;//facname + ',' + "\n\n" + "Your leave application has been" + ' ' + status + "ed on " + DateTime.Now.ToShortDateString() + "\n\n" + "By HR.\n\n Reason : " + txtReason.Text;
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("svm01sri@gmail.com", "shivam_123");
            smtp.Timeout = 20000;

            smtp.Send(message);

        }
        catch (Exception ex)
        {

        }
    }


    private string createEmailBodyforRetailor(string tid, string pname, string sp, string quantity, string totamt, string size, string cname, string cmobile, string cpincode, string caddress, string paymentmode, string rname, string raddress, string rmobile, string remail)
    {

        string body = string.Empty;
        //using streamreader for reading my htmltemplate   
        // string path = HttpContext.Current.Server.MapPath("~/files/sample.html");
        //string content = System.IO.File.ReadAllText(path);
        using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/MailForRetailor.html")))
        {

            body = reader.ReadToEnd();

        }

        body = body.Replace("{transactionid}", tid); //replacing the required things  
        body = body.Replace("{productname}", pname);
        body = body.Replace("{sp}", sp);
        body = body.Replace("{quantity}", quantity);
        body = body.Replace("{totalamount}", totamt);


        body = body.Replace("{size}", size);
        body = body.Replace("{cname}", cname); //replacing the required things  
        body = body.Replace("{cmobile}", cmobile);
        body = body.Replace("{cpincode}", cpincode);
        body = body.Replace("{caddress}", caddress);
        body = body.Replace("{paymentmode}", paymentmode);

        body = body.Replace("{rname}", rname);
        body = body.Replace("{rmobile}", rmobile); //replacing the required things  
        body = body.Replace("{raddress}", raddress);
        body = body.Replace("{remail}", remail);


        return body;

    }


    private void send_mail_to_retailor(string tid, string uname, string umobile, string uaddress, string log_email, string quantity, string pid, string sp, string pincode, string totalprice, string paymentmode, string size, string rid, string cid, string rname, string raddress, string remail, string rmobile, string headertitle)
    {
        try
        {
            MailMessage message = new MailMessage();

            //    string emailid = ds.Tables[0].Rows[0]["LEmailAddress1"].ToString();

            message.From = new MailAddress("svm01sri@gmail.com");
            message.To.Add(new MailAddress(remail));

            //  message.IsBodyHtml = true;
            // string ff = FreeTextBox1.Text;
            message.Subject = "Alert : New Order placed Info ";// +DateTime.Now.ToShortDateString();
            message.BodyEncoding = System.Text.Encoding.UTF8;
            string msg = createEmailBodyforRetailor(tid, headertitle, sp, quantity, totalprice, size, uname, umobile, pincode, uaddress, paymentmode, rname, raddress, rmobile, remail);
            //msg = "\n\n Order Related Information : \n\n";
            //msg += "Transaction Id : " + tid + "\n";
            //msg += "Product Id : " + pid + "\n";
            //msg += "Product Name : " + headertitle + "\n";
            //msg += "Product Selling Price : " + sp + "\n";
            //msg += "Product Quantity Ordered : " + quantity + "\n";
            //msg += "Product Total Price : " + totalprice + "\n";
            //if (size != "")
            //    msg += "Product Size : " + size + "\n";
            ////msg += "Product Name : " + headertitle + "\n";

            //msg += "\n\n Customer Info : " + "\n";

            //msg += "Customer Name : " + uname + "\n";
            //msg += "Customer Mobile : " + umobile + "\n";
            //msg += "Delivery Pincode : " + pincode + "\n";
            //msg += "Delivery Adderss : " + uaddress + "\n";
            //msg += "Payment Mode : " + paymentmode + "\n";

            //msg += "\n\n Retailer Info : " + "\n";
            //msg += "Retailer Name : " + rname + "\n";
            //msg += "Retailer Address : " + raddress + "\n";
            //msg += "Retailer Mobile : " + rmobile + "\n";
            //msg += "Retailer EMail Address : " + remail + "\n";

            message.Body = msg;//facname + ',' + "\n\n" + "Your leave application has been" + ' ' + status + "ed on " + DateTime.Now.ToShortDateString() + "\n\n" + "By HR.\n\n Reason : " + txtReason.Text;
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("svm01sri@gmail.com", "shivam_123");
            smtp.Timeout = 20000;

            smtp.Send(message);

        }
        catch (Exception ex)
        {

        }
    }


    private string createEmailBodyforCustomer(string tid, string pname, string sp, string quantity, string totamt, string size, string cname, string cmobile, string cpincode, string caddress, string paymentmode)
    {

        string body = string.Empty;
        //using streamreader for reading my htmltemplate   
        // string path = HttpContext.Current.Server.MapPath("~/files/sample.html");
        //string content = System.IO.File.ReadAllText(path);
        using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/MailForCustomer.html")))
        {

            body = reader.ReadToEnd();

        }

        body = body.Replace("{transactionid}", tid); //replacing the required things  
        body = body.Replace("{productname}", pname);
        body = body.Replace("{sp}", sp);
        body = body.Replace("{quantity}", quantity);
        body = body.Replace("{totalamount}", totamt);


        body = body.Replace("{size}", size);
        body = body.Replace("{cname}", cname); //replacing the required things  
        body = body.Replace("{cmobile}", cmobile);
        body = body.Replace("{cpincode}", cpincode);
        body = body.Replace("{caddress}", caddress);
        body = body.Replace("{paymentmode}", paymentmode);

        //body = body.Replace("{rname}", rname);
        //body = body.Replace("{rmobile}", rmobile); //replacing the required things  
        //body = body.Replace("{raddress}", raddress);
        //body = body.Replace("{remail}", remail);


        return body;

    }


    private void send_mail_to_customer(string tid, string uname, string umobile, string uaddress, string log_email, string quantity, string pid, string sp, string pincode, string totalprice, string paymentmode, string size, string rid, string cid, string rname, string raddress, string remail, string rmobile, string headertitle, string uemail)
    {
        try
        {
            MailMessage message = new MailMessage();

            //    string emailid = ds.Tables[0].Rows[0]["LEmailAddress1"].ToString();

            message.From = new MailAddress("svm01sri@gmail.com");
            message.To.Add(new MailAddress(uemail));

            //  message.IsBodyHtml = true;
            // string ff = FreeTextBox1.Text;
            message.Subject = "Alert : Order Confirmation Mail";// +DateTime.Now.ToShortDateString();
            message.BodyEncoding = System.Text.Encoding.UTF8;
            string msg = createEmailBodyforCustomer(tid, headertitle, sp, quantity, totalprice, size, uname, umobile, pincode, uaddress, paymentmode);

            //msg += "Thanks for Shopping with us and below is your order confirmation summary.\n\n";

            //msg = "\n\n Order Related Information : \n\n";
            //msg += "Transaction Id : " + tid + "\n";
            ////msg += "Product Id : " + pid + "\n";
            //msg += "Product Name : " + headertitle + "\n";
            //msg += "Product Selling Price : " + sp + "\n";
            //msg += "Product Quantity Ordered : " + quantity + "\n";
            //msg += "Product Total Price : " + totalprice + "\n";
            //if (size != "")
            //    msg += "Product Size : " + size + "\n";
            ////msg += "Product Name : " + headertitle + "\n";

            //msg += "\n\n Customer Info : " + "\n";

            //msg += "Customer Name : " + uname + "\n";
            //msg += "Customer Mobile : " + umobile + "\n";
            //msg += "Delivery Pincode : " + pincode + "\n";
            //msg += "Delivery Adderss : " + uaddress + "\n";
            //msg += "Payment Mode : " + paymentmode + "\n";

            //msg += "\n\n Retailer Info : " + "\n";
            //msg += "Retailer Name : " + rname + "\n";
            //msg += "Retailer Address : " + raddress + "\n";
            //msg += "Retailer Mobile : " + rmobile + "\n";
            //msg += "Retailer EMail Address : " + remail + "\n";

            message.Body = msg;//facname + ',' + "\n\n" + "Your leave application has been" + ' ' + status + "ed on " + DateTime.Now.ToShortDateString() + "\n\n" + "By HR.\n\n Reason : " + txtReason.Text;
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();

            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("svm01sri@gmail.com", "shivam_123");
            smtp.Timeout = 20000;

            smtp.Send(message);

        }
        catch (Exception ex)
        {

        }
    }

    public DataSet GetOrderSummaryRecent()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_TransactionSummary", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@sessionid", UserSessionId);
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public DataSet GetOrderSummaryAll()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetAllTransactionSummary", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@uid", EmpId);
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public int NewRegistration()
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_NewRegistration";

            cmd.Parameters.AddWithValue("@username", UserName);
            cmd.Parameters.AddWithValue("@userpwd", UserPassword);
            cmd.Parameters.AddWithValue("@email", UserEmail);

            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }


    public DataSet GetProducts(int flag)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProducts", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            if (flag == 0)
                da.SelectCommand.Parameters.AddWithValue("@pid", ProdId);
            da.SelectCommand.Parameters.AddWithValue("@flag", flag);
            //da.SelectCommand.Parameters.AddWithValue("@flag", flag);
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public DataSet GetRecommendedProducts(string cid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetRecommendedProducts", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            //if (flag == 0)
            da.SelectCommand.Parameters.AddWithValue("@cid", cid);
            //  da.SelectCommand.Parameters.AddWithValue("@flag", flag);
            //  da.SelectCommand.Parameters.AddWithValue("@search", search);
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;

    }

    public DataSet GetProducts(int flag, string search)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProducts", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            if (flag == 0)
                da.SelectCommand.Parameters.AddWithValue("@pid", ProdId);
            da.SelectCommand.Parameters.AddWithValue("@flag", flag);
            da.SelectCommand.Parameters.AddWithValue("@search", search);
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public DataSet GetProducts(string subcid = null, string search = null, string cid = null, string gender = null,string brandIds=null)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProducts", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@subcid", subcid);//if flag =0 them subcid = cid is used
            da.SelectCommand.Parameters.AddWithValue("@gender", gender);
            da.SelectCommand.Parameters.AddWithValue("@search", search);
            da.SelectCommand.Parameters.AddWithValue("@cid", cid);
            da.SelectCommand.Parameters.AddWithValue("@brandId", brandIds);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public DataSet GetProductsRecommended(string cid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetRecommendedProducts", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@cid", cid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public DataSet GetProtducsInfo(string pid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProductsInfo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@pid", pid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }



    public int AddEmployeeInfo(string euname, string epwd, string ename, string eaddress, string eemailid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AddEmployee";

            cmd.Parameters.AddWithValue("@Euname", euname);
            cmd.Parameters.AddWithValue("@Epwd", epwd);
            cmd.Parameters.AddWithValue("@Empname", ename);
            cmd.Parameters.AddWithValue("@EmpAddress", eaddress);
            cmd.Parameters.AddWithValue("@EmpEmailId", eemailid);
            //  cmd.Parameters.AddWithValue("@RAddress", RetAddress);

            con.Open();
            i = cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }


    public DataSet GetEmpLoginDetails(string empid = null)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_ViewEmpLoginInfo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            if (empid != null)
                da.SelectCommand.Parameters.AddWithValue("@empid", empid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public string CreatePassword()
    {
        int length = 8;
        const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            res.Append(valid[rnd.Next(valid.Length)]);
        }
        return res.ToString();
    }

    public static string GeneratePassword()
    {
        int length = 8;
        const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            res.Append(valid[rnd.Next(valid.Length)]);
        }
        return res.ToString();
    }

    public string CreateGiftVoucherId()
    {
        int length = 4;
        const string valid = "ABCDE123FGHIJ456KLMNOPQRS789TUVWXYZ0";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            res.Append(valid[rnd.Next(valid.Length)]);
        }
        return res.ToString();
    }

    public int UpdateEmployeeInfo(string euname, string epwd, string ename, string eaddress, string eemailid, string empid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateEmployeeInfo";

            cmd.Parameters.AddWithValue("@Euname", euname);
            cmd.Parameters.AddWithValue("@Epwd", epwd);
            cmd.Parameters.AddWithValue("@Empname", ename);
            cmd.Parameters.AddWithValue("@EmpAddress", eaddress);
            cmd.Parameters.AddWithValue("@EmpEmailId", eemailid);
            cmd.Parameters.AddWithValue("@EmpId", empid);
            //  cmd.Parameters.AddWithValue("@RAddress", RetAddress);

            con.Open();
            i = cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public int DeleteEmployeeInfo(string empid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_DeleteEmpLoginInfo";

            cmd.Parameters.AddWithValue("@EmpId", empid);
            //  cmd.Parameters.AddWithValue("@RAddress", RetAddress);

            con.Open();
            i = cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }

    public string CreateLogisticInfo(string mobile, string pwd, string empid)
    {
        int i = 0; string logdetails = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "CreateLogistic_LoginInfo";

            cmd.Parameters.AddWithValue("@empid", empid);
            cmd.Parameters.AddWithValue("@mobile", mobile);
            cmd.Parameters.AddWithValue("@pwd", pwd);
            cmd.Parameters.Add("@logdetails", SqlDbType.VarChar, 10).Direction = ParameterDirection.Output;
            con.Open();
            i = cmd.ExecuteNonQuery();
            //con.Close();
            logdetails = cmd.Parameters["@logdetails"].Value.ToString();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return logdetails;
    }

    public static string AddRetailorInfo(string mobile, string pwd, string empid, string regmode, string regtype)
    {
        var conSta = new SqlConnection(ConfigurationManager.ConnectionStrings["SConStr"].ConnectionString);
       var cmd = new SqlCommand();
        int i = 0; string logdetails = "";
        try
        {
            cmd = new SqlCommand();
            cmd.Connection = conSta;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "CreateRetailor_LoginInfo";

            cmd.Parameters.AddWithValue("@empid", empid);
            cmd.Parameters.AddWithValue("@mobile", mobile);
            cmd.Parameters.AddWithValue("@pwd", pwd);
            cmd.Parameters.AddWithValue("@regmode", regmode);
            cmd.Parameters.AddWithValue("@regtype", regtype);
            cmd.Parameters.Add("@logdetails", SqlDbType.VarChar, 10).Direction = ParameterDirection.Output;

            conSta.Open();
            i = cmd.ExecuteNonQuery();
            //con.Close();
            logdetails = cmd.Parameters["@logdetails"].Value.ToString();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            conSta.Close();
        }

        return logdetails;
    }

    public string CreateRetailorInfo(string mobile, string pwd, string empid, string regmode, string regtype)
    {
        int i = 0; string logdetails = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "CreateRetailor_LoginInfo";

            cmd.Parameters.AddWithValue("@empid", empid);
            cmd.Parameters.AddWithValue("@mobile", mobile);
            cmd.Parameters.AddWithValue("@pwd", pwd);
            cmd.Parameters.AddWithValue("@regmode", regmode);
            cmd.Parameters.AddWithValue("@regtype", regtype);
            cmd.Parameters.Add("@logdetails", SqlDbType.VarChar, 10).Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            //con.Close();
            logdetails = cmd.Parameters["@logdetails"].Value.ToString();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return logdetails;
    }

    public string CreateUserInfo(string mobile, string pwd, string empid)
    {
        string logdetails = "";
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "CreateUser_LoginInfo";

            cmd.Parameters.AddWithValue("@empid", empid);
            cmd.Parameters.AddWithValue("@mobile", mobile);
            cmd.Parameters.AddWithValue("@pwd", pwd);
            cmd.Parameters.Add("@logdetails", SqlDbType.VarChar, 10).Direction = ParameterDirection.Output;
            con.Open();
            i = cmd.ExecuteNonQuery();
            logdetails = cmd.Parameters["@logdetails"].Value.ToString();
            //con.Close();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return logdetails;
    }

    public Dictionary<string, string> VerifyLoginInfo(string mobile, string pwd, string mode)
    {
        var reponse = new Dictionary<string, string>();
        string i = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AdminLogin";

            cmd.Parameters.AddWithValue("@mob", mobile);
            cmd.Parameters.AddWithValue("@pwd", pwd);
            cmd.Parameters.AddWithValue("@flag", mode);
            cmd.Parameters.Add("@loginid", SqlDbType.VarChar, 10).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@userType", SqlDbType.VarChar, 10).Direction = ParameterDirection.Output;

            con.Open();
            cmd.ExecuteNonQuery();
            i = cmd.Parameters["@loginid"].Value.ToString();
            reponse.Add("loginid", i);
            reponse.Add("userType", cmd.Parameters["@userType"].Value.ToString());
            //con.Close();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return reponse;
    }

    public DataSet GetLogisticDetails(string lid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetLogisticDetails", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@lid", lid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public DataSet GetLogisticList(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetLogisticList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@loginid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public DataSet GetRetailerList(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetRetailerList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public DataSet GetRetailerDetails(string rid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@rid", rid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public int AddRetailerInfo(string rname, string raddress, string city, string state, string landmark, string pincode, string district, string rcategory, 
        string rtype, string orgname, string orgregnumber, string email, string mobile, string tinnum, string staxnum, string accholdername, string accnumber, 
        string bname, string ifsc, string pan, string loginid, string gender, string size, string gst, string refid,
        byte[] doc1, byte[] doc2, byte[] doc3, byte[] doc4)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AddRetailerRegistrationDetails";
            cmd.Parameters.AddWithValue("@RName", rname);
            cmd.Parameters.AddWithValue("@RAddress", raddress);
            cmd.Parameters.AddWithValue("@City", city);
            cmd.Parameters.AddWithValue("@RState", state);
            cmd.Parameters.AddWithValue("@Landmark", landmark);
            cmd.Parameters.AddWithValue("@Pincode", pincode);
            cmd.Parameters.AddWithValue("@District", district);
            cmd.Parameters.AddWithValue("@RCategory", rcategory);
            cmd.Parameters.AddWithValue("@RetailerType", rtype);
            cmd.Parameters.AddWithValue("@Org_Name", orgname);
            cmd.Parameters.AddWithValue("@Org_RegistrationNumber", orgregnumber);
            cmd.Parameters.AddWithValue("@Org_Email", email);
            cmd.Parameters.AddWithValue("@Org_Mobile", mobile);
            cmd.Parameters.AddWithValue("@Org_TIN_Number", tinnum);
            cmd.Parameters.AddWithValue("@ServiceTax_Number", staxnum);
            cmd.Parameters.AddWithValue("@Acc_HolderName", accholdername);
            cmd.Parameters.AddWithValue("@Acc_Number", accnumber);
            cmd.Parameters.AddWithValue("@BankName", bname);
            cmd.Parameters.AddWithValue("@IFSC_Code", ifsc);
            cmd.Parameters.AddWithValue("@PAN", pan);
            cmd.Parameters.AddWithValue("@userid", loginid);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@size", size);
            cmd.Parameters.AddWithValue("@gst", gst);
            cmd.Parameters.AddWithValue("@refid", refid);

            cmd.Parameters.AddWithValue("@doc1", doc1);
            cmd.Parameters.AddWithValue("@doc2", doc2);
            cmd.Parameters.AddWithValue("@doc3", doc3);
            cmd.Parameters.AddWithValue("@doc4", doc4);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;


    }


    public int UpdateRetailerInfo(string rname, string raddress, string city, string state, string landmark, string pincode, string district, string rcategory, string rtype, string orgname, string orgregnumber, string email, string mobile, string tinnum, string staxnum, string accholdername, string accnumber, string bname, string ifsc, string pan, string loginid, string rid, string gst, string gender, string refid
        , byte[] doc1, byte[] doc2, byte[] doc3, byte[] doc4
        )
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateRetailerRegistrationDetails";
            cmd.Parameters.AddWithValue("@RName", rname);
            cmd.Parameters.AddWithValue("@RAddress", raddress);
            cmd.Parameters.AddWithValue("@City", city);
            cmd.Parameters.AddWithValue("@RState", state);
            cmd.Parameters.AddWithValue("@Landmark", landmark);
            cmd.Parameters.AddWithValue("@Pincode", pincode);
            cmd.Parameters.AddWithValue("@District", district);
            cmd.Parameters.AddWithValue("@RCategory", rcategory);
            cmd.Parameters.AddWithValue("@RetailerType", rtype);
            cmd.Parameters.AddWithValue("@Org_Name", orgname);
            cmd.Parameters.AddWithValue("@Org_RegistrationNumber", orgregnumber);
            cmd.Parameters.AddWithValue("@Org_Email", email);
            cmd.Parameters.AddWithValue("@Org_Mobile", mobile);
            cmd.Parameters.AddWithValue("@Org_TIN_Number", tinnum);
            cmd.Parameters.AddWithValue("@ServiceTax_Number", staxnum);
            cmd.Parameters.AddWithValue("@Acc_HolderName", accholdername);
            cmd.Parameters.AddWithValue("@Acc_Number", accnumber);
            cmd.Parameters.AddWithValue("@BankName", bname);
            cmd.Parameters.AddWithValue("@IFSC_Code", ifsc);
            cmd.Parameters.AddWithValue("@PAN", pan);
            cmd.Parameters.AddWithValue("@userid", loginid);
            cmd.Parameters.AddWithValue("@rid", rid);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@gst", gst);
            cmd.Parameters.AddWithValue("@refid", refid);
            cmd.Parameters.AddWithValue("@doc1", doc1);
            cmd.Parameters.AddWithValue("@doc2", doc2);
            cmd.Parameters.AddWithValue("@doc3", doc3);
            cmd.Parameters.AddWithValue("@doc4", doc4);
            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;


    }

    public DataSet GetSubCategoryList(string cid, string gender)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetSubCategoryList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@cid", cid);
            if (!string.IsNullOrEmpty(gender))
                da.SelectCommand.Parameters.AddWithValue("@Gender", gender);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public DataSet GetProductListforRetailer(string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProductListForRetailer", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }
    

    public DataSet GetProductDetailforUpdation(string pid, string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProductDetailsForUpdation", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            da.SelectCommand.Parameters.AddWithValue("@pid", pid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public List<string> getMeasurementByProductId(string productId)
    {
        List<string> lst = new List<string>();
        try
        {
            con = new SqlConnection(DB.constr);
            string str = string.Format(" select measurementTitle+'~'+measurementQuantity+'~'+measurementPrice+'~'+measurementSellingPrice as measurement from ProductMeasurementMapping where productId=" + productId);
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lst.Add(Convert.ToString(dr["measurement"]));
            }
                

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return lst;
    }
  


    public DataSet GetProdListforRetailer(string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProductListForRetailor", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public string ChangeLogisticPwd(string oldpwd, string newpwd, string loginid)
    {
        int i = 0; string logdetails = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_ChangeLogisticPwd";

            cmd.Parameters.AddWithValue("@loginid", loginid);
            cmd.Parameters.AddWithValue("@oldpwd", oldpwd);
            cmd.Parameters.AddWithValue("@newpwd", newpwd);

            cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
                logdetails = cmd.Parameters["@flag"].Value.ToString();
            else
                logdetails = "0";
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return logdetails;
    }


    public string ChangeRetailerPwd(string oldpwd, string newpwd, string loginid)
    {
        int i = 0; string logdetails = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_ChangeRetailerPwd";

            cmd.Parameters.AddWithValue("@loginid", loginid);
            cmd.Parameters.AddWithValue("@oldpwd", oldpwd);
            cmd.Parameters.AddWithValue("@newpwd", newpwd);

            cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
                logdetails = cmd.Parameters["@flag"].Value.ToString();
            else
                logdetails = "0";
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return logdetails;
    }


    public string UserRegistrationInfo(string mobile, string upwd, string regmode, string regtype, string usertype, string name, string email, string address, string city, string state, string pincode, string landmark, string referalid, string gender, string size)
    {
        int i = 0; string logdetails = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_RegisterUserInfo";

            cmd.Parameters.AddWithValue("@mobile", mobile);
            cmd.Parameters.AddWithValue("@pwd", upwd);
            cmd.Parameters.AddWithValue("@RegModeflag", regmode);
            cmd.Parameters.AddWithValue("@RegType", regtype);
            cmd.Parameters.AddWithValue("@usertype", usertype);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@pincode", pincode);
            cmd.Parameters.AddWithValue("@landmark", landmark);
            cmd.Parameters.AddWithValue("@referalid", referalid);
            cmd.Parameters.AddWithValue("@size", size);
            cmd.Parameters.AddWithValue("@gender", gender);


            cmd.Parameters.Add("@logdetails", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
                logdetails = cmd.Parameters["@logdetails"].Value.ToString();
            else
                logdetails = "";
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return logdetails;
    }


    public string GenerateOTP()
    {
        string[] saAllowedCharacters = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };

        string sOTP = String.Empty;

        string sTempChars = String.Empty;

        Random rand = new Random();

        for (int i = 0; i < 4; i++)
        {

            int p = rand.Next(0, saAllowedCharacters.Length);

            sTempChars = saAllowedCharacters[rand.Next(0, saAllowedCharacters.Length)];

            sOTP += sTempChars;

        }

        return sOTP;

    }


    public string Get8DigitRandomNumber1()
    {
        Random rnd = new Random();
        int myRandomNo = rnd.Next(10000000, 99999999); // creates a 8 digit random no.
        return myRandomNo.ToString();
    }

    public string Get8DigitRandomNumber2()
    {
        Random rnd = new Random();
        int myRandomNo = rnd.Next(10000000, 99999999); // creates a 8 digit random no.
        return myRandomNo.ToString();
    }

    public int GenerateCouponCardIdforUnassignedUsers(string cardid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GenerateCouponCardIdUnAssignedUsers";
            cmd.Parameters.AddWithValue("@ccardid", cardid);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }


    public string AddRetailerInfo_UsingExcelSheet(string org_mobile, string rname, string raddress, string city, string state, string landmark, string pincode, string district, string rcategory, string rtype, string orgname, string orgregnumber, string email, string mobile, string tinnum, string staxnum, string accholdername, string accnumber, string bname, string ifsc, string pan, string loginid, string pwd, string empid, string regmode, string regtype)
    {
        int i = 0; string logdetails = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_RegisterRetailerInfoUsing_Excel";
            cmd.Parameters.AddWithValue("@RName", rname);
            cmd.Parameters.AddWithValue("@RAddress", raddress);
            cmd.Parameters.AddWithValue("@City", city);
            cmd.Parameters.AddWithValue("@RState", state);
            cmd.Parameters.AddWithValue("@Landmark", landmark);
            cmd.Parameters.AddWithValue("@Pincode", pincode);
            cmd.Parameters.AddWithValue("@District", district);
            cmd.Parameters.AddWithValue("@RCategory", rcategory);
            cmd.Parameters.AddWithValue("@RetailerType", rtype);
            cmd.Parameters.AddWithValue("@Org_Name", orgname);
            cmd.Parameters.AddWithValue("@Org_RegistrationNumber", orgregnumber);
            cmd.Parameters.AddWithValue("@Org_Email", email);
            cmd.Parameters.AddWithValue("@Org_Mobile", org_mobile);
            cmd.Parameters.AddWithValue("@Org_TIN_Number", tinnum);
            cmd.Parameters.AddWithValue("@ServiceTax_Number", staxnum);
            cmd.Parameters.AddWithValue("@Acc_HolderName", accholdername);
            cmd.Parameters.AddWithValue("@Acc_Number", accnumber);
            cmd.Parameters.AddWithValue("@BankName", bname);
            cmd.Parameters.AddWithValue("@IFSC_Code", ifsc);
            cmd.Parameters.AddWithValue("@PAN", pan);
            cmd.Parameters.AddWithValue("@userid", loginid);
            cmd.Parameters.AddWithValue("@empid", empid);
            cmd.Parameters.AddWithValue("@mobile", mobile);
            cmd.Parameters.AddWithValue("@pwd", pwd);
            cmd.Parameters.AddWithValue("@regmode", regmode);
            cmd.Parameters.AddWithValue("@regtype", regtype);
            cmd.Parameters.Add("@logdetails", SqlDbType.VarChar, 30).Direction = ParameterDirection.Output;


            con.Open();
            i = cmd.ExecuteNonQuery();
            if (i > 0)
                logdetails = cmd.Parameters["@logdetails"].Value.ToString();
            else
                logdetails = "";



        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return logdetails;


    }


    public void SendOTP(string mobile, string otp)
    {
        ///Send SMS using C#

        //Your authentication key
        string authKey = "164615APsBVgXXyt5964c8bf";
        //Multiple mobiles numbers separated by comma
        string mobileNumber = mobile;
        //Sender ID,While using route4 sender id should be 6 characters long.
        string senderId = "VILGRS";
        //Your message to send, Add URL encoding here.
        string message = HttpUtility.UrlEncode("Your unique verification code for Villagers Registration is : " + otp);

        //Prepare you post parameters
        StringBuilder sbPostData = new StringBuilder();
        sbPostData.AppendFormat("authkey={0}", authKey);
        sbPostData.AppendFormat("&mobiles={0}", mobileNumber);
        sbPostData.AppendFormat("&message={0}", message);
        sbPostData.AppendFormat("&sender={0}", senderId);
        sbPostData.AppendFormat("&route={0}", "default");
        sbPostData.AppendFormat("&otp={0}", otp);

        try
        {
            //Call Send SMS API
            string sendSMSUri = "https://control.msg91.com/api/sendotp.php";
            //Create HTTPWebrequest
            HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(sendSMSUri);
            //Prepare and Add URL Encoded data
            UTF8Encoding encoding = new UTF8Encoding();
            byte[] data = encoding.GetBytes(sbPostData.ToString());
            //Specify post method
            httpWReq.Method = "POST";
            httpWReq.ContentType = "application/x-www-form-urlencoded";
            httpWReq.ContentLength = data.Length;
            using (Stream stream = httpWReq.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }
            //Get the response
            HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream());
            string responseString = reader.ReadToEnd();

            //Close the response
            reader.Close();
            response.Close();
        }
        catch (SystemException ex)
        {

        }

    }

    public void SendMessage(string mobile, string msg)
    {
        ///Send SMS using C#

        //Your authentication key
        string authKey = "164615APsBVgXXyt5964c8bf";
        //Multiple mobiles numbers separated by comma
        string mobileNumber = mobile;
        //Sender ID,While using route4 sender id should be 6 characters long.
        string senderId = "VILGRS";
        //Your message to send, Add URL encoding here.
        string message = HttpUtility.UrlEncode(msg);

        //Prepare you post parameters
        StringBuilder sbPostData = new StringBuilder();
        sbPostData.AppendFormat("authkey={0}", authKey);
        sbPostData.AppendFormat("&mobiles={0}", mobileNumber);
        sbPostData.AppendFormat("&message={0}", message);
        sbPostData.AppendFormat("&sender={0}", senderId);
        sbPostData.AppendFormat("&route={0}", "4");
        //sbPostData.AppendFormat("&otp={0}", "0987");

        try
        {
            //Call Send SMS API
            string sendSMSUri = "https://control.msg91.com/api/sendhttp.php";
            //Create HTTPWebrequest
            HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(sendSMSUri);
            //Prepare and Add URL Encoded data
            UTF8Encoding encoding = new UTF8Encoding();
            byte[] data = encoding.GetBytes(sbPostData.ToString());
            //Specify post method
            httpWReq.Method = "POST";
            httpWReq.ContentType = "application/x-www-form-urlencoded";
            httpWReq.ContentLength = data.Length;
            using (Stream stream = httpWReq.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }
            //Get the response
            HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream());
            string responseString = reader.ReadToEnd();

            //Close the response
            reader.Close();
            response.Close();
        }
        catch (SystemException ex)
        {

        }

    }

    //public void Send(string Subject, string To, string Body)
    //{
    //    RestClient client = new RestClient();
    //    client.BaseUrl = new Uri("https://api.mailgun.net/v2");
    //    client.Authenticator = new HttpBasicAuthenticator("api", Properties.Settings.Default.APIKEY.ToString());
    //    RestRequest request = new RestRequest();
    //    request.Resource = "domaingoeshere.comororg/messages";
    //    request.AddParameter("from", "YOUR APP <yourapp@example.com>");
    //    request.AddParameter("to", To);
    //    request.AddParameter("subject", Subject);
    //    request.AddParameter("text", Body);
    //    request.Method = Method.POST;
    //    client.Execute(request);
    //}

    public void SendEmail(string toemailid, string body, string subject)
    {
        try
        {

            //string msg = createEmailBodyforRegistrationUPwd(uid, pwd);
            SendSimpleMessagRegistratione(toemailid, body, subject);
            //}
            //else
            //{
            //    SendSimpleMessage(toemailid, body, subject).Content.ToString();
            //}
        }
        catch (Exception ex)
        {

        }

    }



    public static IRestResponse SendSimpleMessage(string touseremailid, string body, string subject)
    {

        RestClient client = new RestClient();
        client.BaseUrl = new Uri("https://api.mailgun.net/v3");
        client.Authenticator =
            new HttpBasicAuthenticator("api",
                                        "key-1af08f68460c7a0f1b5b0c68406f05d2");
        RestRequest request = new RestRequest();
        request.AddParameter("domain", "www.skynexindia.com", ParameterType.UrlSegment);
        request.Resource = "{domain}/messages";
        request.AddParameter("from", "skynexindia@gmail.com");

        request.AddParameter("to", touseremailid);
        request.AddParameter("to", "TeamSkynex@www.skynexindia.com");
        request.AddParameter("subject", subject);
        request.AddParameter("text", body);
        request.Method = Method.POST;
        return client.Execute(request);

    }

    public static IRestResponse SendSimpleMessagRegistratione(string touseremailid, string body, string subject)
    {

        RestClient client = new RestClient();
        client.BaseUrl = new Uri("https://api.mailgun.net/v3");
        client.Authenticator =
            new HttpBasicAuthenticator("api",
                                        "key-1af08f68460c7a0f1b5b0c68406f05d2");
        RestRequest request = new RestRequest();
        request.AddParameter("domain", "www.skynexindia.com", ParameterType.UrlSegment);
        request.Resource = "{domain}/messages";
        request.AddParameter("from", "skynexindia@gmail.com");

        request.AddParameter("to", touseremailid);
        request.AddParameter("to", "TeamSkynex@www.skynexindia.com");
        request.AddParameter("subject", subject);
        request.AddParameter("text", "this is a test mail.");
        request.AddParameter("html", body);
        request.Method = Method.POST;
        return client.Execute(request);

    }


    public DataSet GetUserInfo(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetUserInfo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@loginid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public Dictionary<string, string> ValidateUserLoginDetails(string userid, string pwd)
    {
        var retruenObject = new Dictionary<string, string>();
        int i = 0; string logdetails = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_ValidateUserLoginDetails";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@pwd", pwd);


            cmd.Parameters.Add("@loginid", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@userType", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;


            con.Open();
            i = cmd.ExecuteNonQuery();
            // if (i > 0)
            logdetails = cmd.Parameters["@loginid"].Value.ToString();
            //else
            //    logdetails = "";
            retruenObject.Add("loginid", logdetails);
            retruenObject.Add("userType", cmd.Parameters["@userType"].Value.ToString());
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return retruenObject;

    }

    public DataSet GetInfo(string query)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter(query, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.SelectCommand.Parameters.Clear();
            //            da.SelectCommand.Parameters.AddWithValue("@prodid", prodid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetProductImage(string prodid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProductImageList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@prodid", prodid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    //public DataSet GetRecommendedProductInfo()
    //{
    //    try
    //    {
    //        con = new SqlConnection(DB.constr);
    //        da = new SqlDataAdapter("EShop_GetProductImageList", con);
    //        da.SelectCommand.CommandType = CommandType.StoredProcedure;
    //        da.SelectCommand.Parameters.Clear();
    //        da.SelectCommand.Parameters.AddWithValue("@prodid", prodid);

    //        ds = new DataSet();
    //        da.Fill(ds);

    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //    finally
    //    {
    //        con.Close();
    //    }
    //    return ds;
    //}


    public DataSet GetCartAllProductList(string userid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetAllCartProductList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int DeleteProductfromCart(string cartid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_DeleteProductfromCart";
            cmd.Parameters.AddWithValue("@cartid", cartid);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public int MoveProductfromCarttoWishlist(string cartid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_MoveItemfromCarttoWishList";
            cmd.Parameters.AddWithValue("@cartid", cartid);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;

    }


    public DataSet CheckRetailerInfoCompleteness(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_CheckRetailerInfoCompleteness", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }


    public DataSet CheckUserMobileNumDuplicacy(string mobile)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_CheckUserMobileNumDuplicacy", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@mob", mobile);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet CheckMobileNumDuplicacy(string mobile, string mode)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_CheckAdminNumDuplicacy", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@mob", mobile);
            da.SelectCommand.Parameters.AddWithValue("@mode", mode);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }


    public string TransactionConfirmation(string userid, string camt, string damt, string ttype, string ttypeid, string status, string bal, string receiveramt = null, string qty = null)
    {
        int i = 0;
        string tid = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_TransactionConfrimation";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@camt", camt);
            cmd.Parameters.AddWithValue("@damt", damt);
            cmd.Parameters.AddWithValue("@ttype", ttype);
            cmd.Parameters.AddWithValue("@ttypeid", ttypeid);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@bal", bal);
            cmd.Parameters.AddWithValue("@ReceiverAmt", receiveramt);
            cmd.Parameters.AddWithValue("@qty", qty);
            cmd.Parameters.Add("@tid", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
            con.Open();
            i = cmd.ExecuteNonQuery();
            tid = cmd.Parameters["@tid"].Value.ToString();

        }
        catch (Exception ex)
        {
            i = 0;
            tid = "";
        }
        finally
        {
            con.Close();
        }
        return tid;

    }

    public DataSet GetUserTypeAndBalance(string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetUserTypeAndBalance", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();


            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public string FreeUserGiftVoucher(string userid, string name, string amt)
    {
        int i = 0; string gvid = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_FreeUserGiftVoucher";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@amt", amt);
            string pwd = CreateGiftVoucherId();
            cmd.Parameters.AddWithValue("@id", pwd);
            cmd.Parameters.Add("@gvid", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;


            con.Open();
            i = cmd.ExecuteNonQuery();
            gvid = cmd.Parameters["@gvid"].Value.ToString();
        }
        catch (Exception ex)
        {
            gvid = "";
        }
        finally
        {
            con.Close();
        }
        return gvid;

    }

    public string CouponAssignPreUser(string userid)
    {
        int i = 0; string cardid = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShopAssignCouponToUser";
            cmd.Parameters.AddWithValue("@userid", userid);
            string s1 = "", s2 = "";
            s1 = Get8DigitRandomNumber1();
            s2 = Get8DigitRandomNumber2();
            cardid = s1 + s2;
            cmd.Parameters.AddWithValue("@cardid", cardid);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            cardid = "";
        }
        finally
        {
            con.Close();
        }
        return i > 0 ? cardid : "";

    }

    public int ReferToNewUser(string userid, string mob)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_ReferredToNewUser";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mob", mob);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public DataSet GetUserReferralRecordInfo(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetReferralRecord", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetUserPassbookRecordInfo(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetTransactionLog", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }


    public DataSet GetUserReferralList(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetReferralList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetUserPassbookInfo(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetPassbookInfo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int ChangeUserPassword(string userid, string pwd)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_ChangePassword";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@pwd", pwd);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public DataSet GetUserPassword(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetUserPassword", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public string TransferToBankInfo(string userid, string acc_number, string ifsc, string accholdername, string amt)
    {
        int i = 0; string id = "";
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_TransferToBankInfo";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@acc_number", acc_number);
            cmd.Parameters.AddWithValue("@ifsccode", ifsc);
            cmd.Parameters.AddWithValue("@acc_holdername", accholdername);
            cmd.Parameters.AddWithValue("@amt", amt);
            cmd.Parameters.Add("@id", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();

            id = cmd.Parameters["@id"].Value.ToString();

        }
        catch (Exception ex)
        {
            id = "";
        }
        finally
        {
            con.Close();
        }
        return id;

    }

    

         public void UpdateEmailRetailer(string userid, string mobile)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateMobileOfRetailer";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mobile", mobile);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
       

    }

    public void UpdateEmailUser(string userid, string mobile)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateMobileOfUser";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mobile", mobile);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }


    }


    public void UpdateEmailLogistic(string userid, string mobile)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateMobileOfLogistic";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mobile", mobile);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }


    }

    public void DeleteRetailer(string userid, string mobile)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_DeleteRetailer";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mobile", mobile);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }


    }

    public void DeleteUser(string userid, string mobile)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_DeleteUser";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mobile", mobile);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }


    }

    public void DeleteLogistic(string userid, string mobile)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_DeleteLogistic";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mobile", mobile);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }


    }
    public int UpdateEmail(string userid, string email)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateEmail";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@email", email);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }


    public int UpdateMobile(string userid, string mobile)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateMobile";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@mobile", mobile);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public DataSet GetCartInfoQtyNdAmt(string loginid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("Eshop_GetCartInfoQtyNdAmt", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", loginid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetCartCouponCountInfo(string userid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetCartCouponInfoCount", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet VerifyCoupon(string userid, string cardid, string flag)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_VerifyCoupon", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            da.SelectCommand.Parameters.AddWithValue("@couponid", cardid);
            da.SelectCommand.Parameters.AddWithValue("@flag", flag);
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int ApplyCouponIDonCart(string userid, string cardid, string amt)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_ApplyCoupononCartitems";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@cardid", cardid);
            cmd.Parameters.AddWithValue("@amt", amt);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public int DeleteTransferToBankRequest(string bankid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "DeleteTransferToBankRequest";
            cmd.Parameters.AddWithValue("@tbankid", bankid);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }


    public DataSet CheckImageDuplicacy(string userid, string pid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_CheckProductImageDuplicacy", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            da.SelectCommand.Parameters.AddWithValue("@pid", pid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int UpdateRetailerPassword(string userid, string pwd)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateRetailerPassword";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@rpwd", pwd);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public DataSet GetRetailerPassword(string userid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetRetailerPassword", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetCartProdQty(string cartid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetCartProductQty", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@cartid", cartid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public DataSet GetPreCardInfo(string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetPreCardInfo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public DataSet GetGiftVoucherInfo(string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetGiftVoucherInfo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public DataSet GetGiftVoucherCount(string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetGiftVoucherCount", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public int UpdateTshirtInfo(string userid, string size)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateTShirtSize";
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@size", size);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }

    public DataSet GetWishlistProd(string userid)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetWishlistProd", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }


    public int RemoveProdfromWishlist(string wid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_RemoveProdFromWishList";
            cmd.Parameters.AddWithValue("@wid", wid);
            // cmd.Parameters.AddWithValue("@size", size);

            con.Open();
            i = cmd.ExecuteNonQuery();



        }
        catch (Exception ex)
        {
            i = 0;
        }
        finally
        {
            con.Close();
        }
        return i;

    }


    public DataSet GetWishlistInfo(string wid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetWishlistInfoforCartTransfer", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            //da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            da.SelectCommand.Parameters.AddWithValue("@wid", wid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetAllPincodeListfromLogistic()
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetAllLogisticPincodeList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            //da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            //da.SelectCommand.Parameters.AddWithValue("@wid", wid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetAllCartIdandQty(string userid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetAllCartIdandQty", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            //da.SelectCommand.Parameters.AddWithValue("@wid", wid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetRetailerMailndMobile(string cid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetAllCartIdandQty", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", cid);
            //da.SelectCommand.Parameters.AddWithValue("@wid", wid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }


    public DataSet GetAllMyOrderList(string userid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetAllMyOrderList", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet getDeliveryAmt(string logistic_id, double wt, double distance)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_Logistic_Rate", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@Lid", logistic_id);
            da.SelectCommand.Parameters.AddWithValue("@wt", wt);
            da.SelectCommand.Parameters.AddWithValue("@distance", distance);
            da.SelectCommand.Parameters.AddWithValue("@Action", 1);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }


    public DataSet GetReatilerEmailndMobileInfo(string cartid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetRetailerInfoforMail", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@cartid", cartid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public DataSet GetLogisticEmailndMobileInfo(string lid)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetLogisticInfoforMail", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@lid", lid);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int UpdateUserProfileInfo(string pincode, string city, string state, string uaddress, string landmark, string userid)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateUserProfile";
            cmd.Parameters.AddWithValue("@pincode", pincode);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@uadd", uaddress);
            cmd.Parameters.AddWithValue("@land", landmark);
            cmd.Parameters.AddWithValue("@userid", userid);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;


    }

    public int UpdateUserProfileImg(string userid, byte[] bytes)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateUserProfileImg";
            cmd.Parameters.AddWithValue("@img", bytes);
            cmd.Parameters.AddWithValue("@userid", userid);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;


    }


    public int UpdateUserProfileAdhar(string userid, byte[] bytes)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //da = new SqlDataAdapter("EShop_GetRetailerDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateUserProfileAdhar";
            cmd.Parameters.AddWithValue("@img", bytes);
            cmd.Parameters.AddWithValue("@userid", userid);

            con.Open();
            i = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;


    }
    #region Retailer Panel
    public DataSet GetProtducsInfoRebind(Int64 id)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetProducts_Rebind", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();

            da.SelectCommand.Parameters.AddWithValue("@id", id);

            ds = new DataSet();
            da.Fill(ds);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;


    }

    public List<Brand> bindBrand()
    {
        List<Brand> lst = new List<Brand>();
        try
        {

            con = new SqlConnection(DB.constr);
            string str = "select Brand_Id,Brand_Title from Brand_Category";
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var brand = new Brand()
                {
                    id = Convert.ToInt32(dr["Brand_Id"]),
                    brandName = Convert.ToString(dr["Brand_Title"])
                };
                lst.Add(brand);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return lst;
    }
    public List<Retailer> bindRetailer()
    {
        List<Retailer> lst = new List<Retailer>();
        try
        {
            con = new SqlConnection(DB.constr);
            string str = "SELECT b.UserId, a.RName FROM RetailerInfo a right join Retailer_LoginInfo b on a.UserId=b.UserId where b.RStatus='Y' and a.RName is not null";
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var retailer = new Retailer()
                {
                    USERID = Convert.ToString(dr["UserId"]),
                    USER_NAME = Convert.ToString(dr["RName"])
                };
                lst.Add(retailer);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return lst;
    }




    public int updateStatusToReadyToDispatch(string transactionId, int status)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "updateStatusToReadyToDispatch";
            cmd.Parameters.AddWithValue("@transactionId", transactionId);
            cmd.Parameters.AddWithValue("@status", status);
            con.Open();
            i = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return i;


    }

    public static List<Retailer> getAllOrderListForReatiler(string id, int action,string fromdate,string todate, int status = 0)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<Retailer> retailerList = new List<Retailer>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetAllOrders";
            cmd.Parameters.AddWithValue("@RID", id);
            cmd.Parameters.AddWithValue("@LID", null);
            cmd.Parameters.AddWithValue("@STATUS", status);
            cmd.Parameters.AddWithValue("@ACTION", action);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var reatailer = new Retailer()
                {
                    ADDRESS = Convert.ToString(dr["ADDRESS"]),
                    CART_ID = Convert.ToString(dr["CART_ID"]),
                    COSTPRICE = Convert.ToString(dr["COSTPRICE"]),
                    DELIVERY_AMOUNT = Convert.ToString(dr["DELIVERY_AMOUNT"]),
                    MEASUREMENT = Convert.ToString(dr["MEASUREMENT"]),
                    PRODUCT_DECSRIPTION = Convert.ToString(dr["PRODUCT_DECSRIPTION"]),
                    PRODUCT_ID = Convert.ToString(dr["PRODUCT_ID"]),
                    PRODUCT_TITLE = Convert.ToString(dr["PRODUCT_TITLE"]),
                    QUANTITY = Convert.ToString(dr["QUANTITY"]),
                    SELLINGPRICE = Convert.ToString(dr["SELLINGPRICE"]),
                    TRANSACTION_ID = Convert.ToString(dr["TRANSACTION_ID"]),
                    USERID = Convert.ToString(dr["USERID"]),
                    USER_ADDRESS = Convert.ToString(dr["USER_ADDRESS"]),
                    USER_CITY = Convert.ToString(dr["USER_CITY"]),
                    USER_EMAIL_ID = Convert.ToString(dr["USER_EMAIL_ID"]),
                    USER_GENDER = Convert.ToString(dr["USER_GENDER"]),
                    USER_NAME = Convert.ToString(dr["USER_NAME"]),
                    USER_PINCODE = Convert.ToString(dr["USER_PINCODE"]),
                    USER_STATE = Convert.ToString(dr["USER_STATE"]),
                    STATUS = Convert.ToString(dr["STATUS"]),
                    TRANSACTION_DATE = Convert.ToString(dr["TRANSACTION_DATE"])

                };
                retailerList.Add(reatailer);

            }
            return retailerList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return retailerList;


    }

    public static List<Retailer> getPaymentStatus(string id, int action, string fromdate, string todate, int status = 0,string sortBy="1")
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<Retailer> retailerList = new List<Retailer>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetAllOrders";
            cmd.Parameters.AddWithValue("@RID", id);
            cmd.Parameters.AddWithValue("@LID", null);
            cmd.Parameters.AddWithValue("@STATUS", status);
            cmd.Parameters.AddWithValue("@ACTION", action);
            cmd.Parameters.AddWithValue("@SORTBY", sortBy);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var reatailer = new Retailer()
                {
                    ADDRESS = Convert.ToString(dr["ADDRESS"]),
                    CART_ID = Convert.ToString(dr["CART_ID"]),
                    COSTPRICE = Convert.ToString(dr["COSTPRICE"]),
                    DELIVERY_AMOUNT = Convert.ToString(dr["DELIVERY_AMOUNT"]),
                    MEASUREMENT = Convert.ToString(dr["MEASUREMENT"]),
                    PRODUCT_DECSRIPTION = Convert.ToString(dr["PRODUCT_DECSRIPTION"]),
                    PRODUCT_ID = Convert.ToString(dr["PRODUCT_ID"]),
                    PRODUCT_TITLE = Convert.ToString(dr["PRODUCT_TITLE"]),
                    QUANTITY = Convert.ToString(dr["QUANTITY"]),
                    SELLINGPRICE = Convert.ToString(dr["SELLINGPRICE"]),
                    TRANSACTION_ID = Convert.ToString(dr["TRANSACTION_ID"]),
                    USERID = Convert.ToString(dr["USERID"]),
                    USER_ADDRESS = Convert.ToString(dr["USER_ADDRESS"]),
                    USER_CITY = Convert.ToString(dr["USER_CITY"]),
                    USER_EMAIL_ID = Convert.ToString(dr["USER_EMAIL_ID"]),
                    USER_GENDER = Convert.ToString(dr["USER_GENDER"]),
                    USER_NAME = Convert.ToString(dr["USER_NAME"]),
                    USER_PINCODE = Convert.ToString(dr["USER_PINCODE"]),
                    USER_STATE = Convert.ToString(dr["USER_STATE"]),
                    STATUS = Convert.ToString(dr["STATUS"]),
                    TRANSACTION_DATE = Convert.ToString(dr["TRANSACTION_DATE"]),
                    RETAILOR_PAY_STATUS = Convert.ToString(dr["RETAILOR_PAY_STATUS"]),
                    RETAILOR_PAY_MODE = Convert.ToString(dr["RETAILOR_PAY_MODE"]),
                    RETAILOR_PAY_TRANSACTION_NO = Convert.ToString(dr["RETAILOR_PAY_TRANSACTION_NO"]),



                };
                retailerList.Add(reatailer);

            }
            return retailerList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return retailerList;


    }

    public static List<Retailer> getRetalerPaymentStatus(string id, int action)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<Retailer> retailerList = new List<Retailer>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetAllOrders";
            cmd.Parameters.AddWithValue("@RID", id);
            cmd.Parameters.AddWithValue("@LID", null);
            cmd.Parameters.AddWithValue("@STATUS", null);
            cmd.Parameters.AddWithValue("@ACTION", action);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var reatailer = new Retailer()
                {
                    
                    TRANSACTION_ID = Convert.ToString(dr["TRANSACTION_ID"]),
                    RETAILOR_PAY_STATUS = Convert.ToString(dr["RETAILOR_PAY_STATUS"]),

                };
                retailerList.Add(reatailer);

            }
            return retailerList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return retailerList;


    }

    public static List<Retailer> getRetalerPassbook(string id, int action)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<Retailer> retailerList = new List<Retailer>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetAllOrders";
            cmd.Parameters.AddWithValue("@RID", id);
            cmd.Parameters.AddWithValue("@LID", null);
            cmd.Parameters.AddWithValue("@STATUS", null);
            cmd.Parameters.AddWithValue("@ACTION", action);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var reatailer = new Retailer()
                {

                    TRANSACTION_ID = Convert.ToString(dr["TRANSACTION_ID"]),
                    RETAILOR_PAY_DATE = Convert.ToString(dr["RETAILOR_PAY_DATE"]),
                    RETAILOR_PAY_AMOUNT = Convert.ToString(dr["RETAILOR_PAY_AMOUNT"]),

                };
                retailerList.Add(reatailer);

            }
            return retailerList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return retailerList;


    }

    public static List<Logistic> getAllOrderListForLogistic(string id, int action, int status = 0)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<Logistic> logisticList = new List<Logistic>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetAllOrders";
            cmd.Parameters.AddWithValue("@RID", null);
            cmd.Parameters.AddWithValue("@LID", id);
            cmd.Parameters.AddWithValue("@STATUS", status);
            cmd.Parameters.AddWithValue("@ACTION", action);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var logistic = new Logistic()
                {
                    DELIVERY_ADDRESS = Convert.ToString(dr["DELIVERY_ADDRESS"]),
                    CART_ID = Convert.ToString(dr["CART_ID"]),
                    //COSTPRICE = Convert.ToString(dr["COSTPRICE"]),
                    //DELIVERY_AMOUNT = Convert.ToString(dr["DELIVERY_AMOUNT"]),
                    //MEASUREMENT = Convert.ToString(dr["MEASUREMENT"]),
                    //PRODUCT_DECSRIPTION = Convert.ToString(dr["PRODUCT_DECSRIPTION"]),
                    PRODUCT_ID = Convert.ToString(dr["PRODUCT_ID"]),
                    //PRODUCT_TITLE = Convert.ToString(dr["PRODUCT_TITLE"]),
                    ITEM_QTY = Convert.ToString(dr["QUANTITY"]),
                    //SELLINGPRICE = Convert.ToString(dr["SELLINGPRICE"]),
                    TRANSACTION_ID = Convert.ToString(dr["TRANSACTION_ID"]),
                    //USERID = Convert.ToString(dr["USERID"]),
                    //USER_ADDRESS = Convert.ToString(dr["USER_ADDRESS"]),
                    //USER_CITY = Convert.ToString(dr["USER_CITY"]),
                    //USER_EMAIL_ID = Convert.ToString(dr["USER_EMAIL_ID"]),
                    //USER_GENDER = Convert.ToString(dr["USER_GENDER"]),
                    //USER_NAME = Convert.ToString(dr["USER_NAME"]),
                    DELIVERY_PINCODE = Convert.ToString(dr["USER_PINCODE"]),
                    //USER_STATE = Convert.ToString(dr["USER_STATE"]),
                    STATUS = Convert.ToString(dr["STATUS"]),
                    RETAILER_ID = Convert.ToString(dr["RID"]),
                    R_NAME = Convert.ToString(dr["R_NAME"]),
                    R_ADDRESS = Convert.ToString(dr["R_ADDRESS"]),
                    SHIPPING_CHRG = Convert.ToString(dr["SHIPPING_CHRG"]),
                    R_EMAIL = Convert.ToString(dr["R_EMAIL"]),
                    R_PHONE = Convert.ToString(dr["R_PHONE"])


                };
                logisticList.Add(logistic);

            }
            return logisticList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return logisticList;


    }

    public static List<SalesReprot> saleReport(string userId, string year, int type)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<SalesReprot> retailerList = new List<SalesReprot>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetMonthReport";
            cmd.Parameters.AddWithValue("@RID", userId);
            cmd.Parameters.AddWithValue("@Year", year);
            cmd.Parameters.AddWithValue("@Action", type);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var reatailer = new SalesReprot()
                {
                    QUANTITY = Convert.ToString(dr["QUANTITY"]),
                    SALESMONTH = Convert.ToString(dr["SALESMONTH"]),
                    TOTALSALES = Convert.ToString(dr["TOTALSALES"]),
                    //TOTALSALES_LOGISTIC = Convert.ToString(dr["TOTALSALES_LOGISTIC"]),
                    SALESYEAR = Convert.ToString(dr["SALESYEAR"]),

                };
                retailerList.Add(reatailer);

            }
            return retailerList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return retailerList;


    }

    public static List<SalesReprot> saleReportAll(string year, int type)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<SalesReprot> retailerList = new List<SalesReprot>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetMonthReport";
            cmd.Parameters.AddWithValue("@Year", year);
            cmd.Parameters.AddWithValue("@Action", type);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var reatailer = new SalesReprot()
                {
                    // QUANTITY = Convert.ToString(dr["QUANTITY"]),
                    SALESMONTH = Convert.ToString(dr["SALESMONTH"]),
                    TOTALSALES = Convert.ToString(dr["TOTALSALES"]),
                    TOTALSALES_LOGISTIC = Convert.ToString(dr["TOTALSALES_LOGISTIC"]),
                    SALESYEAR = Convert.ToString(dr["SALESYEAR"]),

                };
                retailerList.Add(reatailer);

            }
            return retailerList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return retailerList;


    }

    public static ArrayList getBudgeCount()
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<SalesReprot> retailerList = new List<SalesReprot>();
        ArrayList objs = new ArrayList();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_GetAllOrders";
            cmd.Parameters.AddWithValue("@ACTION", 6);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

           
            while (dr.Read())
            {
                objs.Add(new
                {
                    TOTAL_RETAILER_FREE = dr["TOTAL_RETAILER_FREE"],
                    TOTAL_RETAILER_PREMIUM = dr["TOTAL_RETAILER_PREMIUM"],
                    TOTAL_LOGISTIC = dr["TOTAL_LOGISTIC"],
                    TOTAL_ORDER = dr["TOTAL_ORDER"],
                    TOTAL_USER_FREE = dr["TOTAL_USER_FREE"],
                    RETURNED_ORDER = dr["RETURNED_ORDER"],
                    DELIVERED_ORDER = dr["DELIVERED_ORDER"],
                    TOTAL_USER_PREMIUM = dr["TOTAL_USER_PREMIUM"]
                });
               
            }
            return objs;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return objs;


    }

    public static List<Retailer> updateStatus(int id, int status = 0)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        List<Retailer> retailerList = new List<Retailer>();
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_UpdateOrderStatus";
            cmd.Parameters.AddWithValue("@CART_ID ", id);
            cmd.Parameters.AddWithValue("@STATUS", status);
            con.Open();
            cmd.ExecuteNonQuery();

            return retailerList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return retailerList;


    }
    public int AddProdMeasurment(int productId, string title, string quantity, string price, string sellingPrice)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "addProductMeasurement";
            cmd.Parameters.AddWithValue("@productId", productId);
            cmd.Parameters.AddWithValue("@measurementTitle", title);
            cmd.Parameters.AddWithValue("@measurementQuantity", quantity);
            cmd.Parameters.AddWithValue("@measurementPrice", price);
            cmd.Parameters.AddWithValue("@measurementSellingPrice", sellingPrice);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return i;
    }
    public int addNewBrand(string brandName)
    {
        int i, id = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_AddBrand";
            cmd.Parameters.AddWithValue("@brandName", brandName);

            SqlParameter outputParam = cmd.Parameters.Add("@brandId", SqlDbType.Int);
            outputParam.Direction = ParameterDirection.Output;

            con.Open();
            i = cmd.ExecuteNonQuery();
            id = Convert.ToInt32(outputParam.Value);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

        return id;
    }


    public void saveReview(int productId,string userID,int rating,string review,string userName,int action=1)
    {

        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "ESHOP_PRODUCT_REVIEW";
            cmd.Parameters.AddWithValue("@PRODUCT_ID", productId);
            cmd.Parameters.AddWithValue("@USER_ID", userID);
            cmd.Parameters.AddWithValue("@RATING", rating);
            cmd.Parameters.AddWithValue("@REVIEW", review);
            cmd.Parameters.AddWithValue("@USERNAME", userName);
            cmd.Parameters.AddWithValue("@ACTION", action);

            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }

      
    }
    public string getLastPurchaseProductId(string userId,string status="Y")
    {


        string productId = "";
        try
        {
            con = new SqlConnection(DB.constr);

            string str = status=="Y"?
                string.Format("select top 1 c.ProdId +'~'+c.UserId +'~'+p.HeaderTitle+'~'+u.Name as product from Cart_Info c inner join ProductDescription p on p.PId=c.ProdId inner join User_Info u on u.UserId=c.UserId where c.status=5 and c.UserId='" + userId + "' and c.PaymentStatus='"+ status + "'  order by CartId desc")
                : string.Format("select top 1 c.ProdId +'~'+c.UserId +'~'+p.HeaderTitle+'~'+u.Name as product from Cart_Info c inner join ProductDescription p on p.PId=c.ProdId inner join User_Info u on u.UserId=c.UserId where c.status=5 and c.UserId='" + userId + "' order by CartId desc");
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
                productId = Convert.ToString(dr["product"]);

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return productId;
    }
    public bool statusToCheckReview(string userId,int productId)
    {
        var returnId = "";
        try
        {
            con = new SqlConnection(DB.constr);
            string str = string.Format("select top 1 id from Product_Review where user_id='"+ userId + "' and product_id="+ productId);
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
                returnId = Convert.ToString(dr["id"]);

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return string.IsNullOrEmpty(returnId) ? true : false; ;
    }
    public bool cancelOrder(int cardId,int status=5,int type=1)
    {
       
        try
        {
            con = new SqlConnection(DB.constr);

            string str = type==1? string.Format("update cart_info set status="+status+" where cartId="+cardId) 
                : string.Format("update cart_info set ReturnStatus=" + status + " where cartId=" + cardId);
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return true;
    }
    public List<Review> getAllReview(string productId)
    {
        List<Review> lst = new List<Review>();
    
        try
        {
            con = new SqlConnection(DB.constr);
            string str = string.Format("select p.review,p.user_name,p.rating,pd.HeaderTitle from Product_Review p inner join ProductDescription pd on p.product_id=pd.PId where p.product_id="+Convert.ToInt32(productId));
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var review = new Review()
                {
                    rating = Convert.ToInt32(dr["rating"]),
                    review = Convert.ToString(dr["review"]),
                    user_name = Convert.ToString(dr["user_name"]),
                    productName = Convert.ToString(dr["HeaderTitle"]),
                    
                };
                lst.Add(review);
            }
              

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return lst;
    }
    public List<Brand> getAllBrands(string brandName)
    {


        List<Brand> lst = new List<Brand>();
        try
        {

            con = new SqlConnection(DB.constr);
            string str = string.Format("select Brand_Id,Brand_Title from Brand_Category where Brand_Title like '{0}%'", brandName);
            cmd = new SqlCommand(str);
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var brand = new Brand()
                {
                    id = Convert.ToInt32(dr["Brand_Id"]),
                    brandName = Convert.ToString(dr["Brand_Title"])
                };
                lst.Add(brand);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return lst;




    }

    public DataTable getdt(string query)
    {
        DataTable dt = new DataTable();
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter(query, con);
            da.SelectCommand.CommandType = CommandType.Text;
            da.SelectCommand.Parameters.Clear();
            da.Fill(dt);

        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return dt;
    }

    public int Update_Retailer_Payment(string Rid, string transaction_id, string RETAILOR_PAY_TRANSACTION_NO, DateTime RETAILOR_PAY_DATE, string RETAILOR_PAY_AMOUNT, string RETAILOR_PAY_STATUS, string RETAILOR_PAY_MODE)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "ESHOP_UPDATE_RETAILER_PAYMENT";
            cmd.Parameters.AddWithValue("@RETAILOR_PAY_TRANSACTION_NO", RETAILOR_PAY_TRANSACTION_NO);
            cmd.Parameters.AddWithValue("@RETAILOR_PAY_DATE", RETAILOR_PAY_DATE);
            cmd.Parameters.AddWithValue("@RETAILOR_PAY_AMOUNT", RETAILOR_PAY_AMOUNT);
            cmd.Parameters.AddWithValue("@RETAILOR_PAY_STATUS", RETAILOR_PAY_STATUS);
            cmd.Parameters.AddWithValue("@RETAILOR_PAY_MODE", RETAILOR_PAY_MODE);
            cmd.Parameters.AddWithValue("@TRANSACTION_ID", transaction_id);
            cmd.Parameters.AddWithValue("@RID", Rid);
            cmd.Parameters.AddWithValue("@ACTION", 1);
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;
    }

    public int Update_RLE_Status(int action, string status, string id)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "ESHOP_UPDATE_RLE_STATUS";
            cmd.Parameters.AddWithValue("@ACTION", action);
            cmd.Parameters.AddWithValue("@STATUS", status);
            cmd.Parameters.AddWithValue("@ID", id);
           
            con.Open();
            i = cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;
    }

    public DataSet getLatitudeLongitude(string UserPincode,string RetailerPincode)
    {
        try
        {
            con = new SqlConnection(DB.constr);
            da = new SqlDataAdapter("EShop_GetLatitudeLongitude", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Clear();
            da.SelectCommand.Parameters.AddWithValue("@USERPIN", UserPincode);
            da.SelectCommand.Parameters.AddWithValue("@RPIN", RetailerPincode);
            ds = new DataSet();
            da.Fill(ds);
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    public int pushLatitudeLongitude(string Pincode, decimal latitude,decimal longitude)
    {
        int i = 0;
        try
        {
            con = new SqlConnection(DB.constr);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.CommandText = "EShop_PushLatitudeLongitude";
            cmd.Parameters.AddWithValue("@PINCODE", Pincode);
            cmd.Parameters.AddWithValue("@LATITUDE", latitude);
            cmd.Parameters.AddWithValue("@LONGITUDE", longitude);
            con.Open();
            i = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
        return i;
    }
    #endregion


}
public enum Status
{
    OrderPlaced = 1,
    ReadyToDispatch = 2,
    Picked = 3,
    OutForDelievery = 4,
    Delievered = 5,
    UnDelievered = 6,
    Cancel = 7
}