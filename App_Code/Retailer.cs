using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Retailer
/// </summary>
public  class Retailer
{
    public string TRANSACTION_ID { get; set; }
    public string PRODUCT_ID { get; set; }
    public string PRODUCT_TITLE { get; set; }
    public string PRODUCT_DECSRIPTION { get; set; }
    public string COSTPRICE { get; set; }
    public string SELLINGPRICE { get; set; }
    public string MEASUREMENT { get; set; }
    public string QUANTITY { get; set; }
    public string USERID { get; set; }
    public string DELIVERY_AMOUNT { get; set; }

    public string ADDRESS { get; set; }
    public string USER_NAME { get; set; }
    public string USER_GENDER { get; set; }
    public string USER_ADDRESS { get; set; }
    public string USER_CITY { get; set; }
    public string USER_STATE { get; set; }
    public string USER_PINCODE { get; set; }
    public string USER_EMAIL_ID { get; set; }
    public string CART_ID { get; set; }
    public string STATUS { get; set; }

    public string TRANSACTION_DATE { get; set; }
    public string RETAILOR_PAY_STATUS { get; set; }
    public string RETAILOR_PAY_DATE { get; set; }
    public string RETAILOR_PAY_AMOUNT { get; set; }
    public string RETAILOR_PAY_MODE { get; set; }
    public string RETAILOR_PAY_TRANSACTION_NO { get; set; }
}

public class Measurment
{
    public int id { get; set; }
    public int productId { get; set; }
    public string title { get; set; }
    public string quantity { get; set; }
    public string mrp { get; set; }
    public string sellingPrice { get; set; }
}
public class Brand
{
    public int id { get; set; }
    public string brandName { get; set; }


}

public class Review
{
   
    
public int rating { get; set; }
    
public string review { get; set; }
    
public string user_name { get; set; }
    
    
public string productName { get; set; }
    

}


public class SalesReprot
{
    public string SALESYEAR { get; set; }
    public string SALESMONTH { get; set; }
    public string TOTALSALES { get; set; }
    public string TOTALSALES_LOGISTIC { get; set; }
    public string QUANTITY { get; set; }
}

public class Logistic
{
    public string TRANSACTION_ID { get; set; }
    public string PRODUCT_ID { get; set; }
    public string RETAILER_ID { get; set; }
    public string R_NAME { get; set; }
    public string R_ADDRESS { get; set; }
    public string DELIVERY_ADDRESS { get; set; }
    public string DELIVERY_PINCODE { get; set; }
    public string ITEM_QTY { get; set; }
    public string SHIPPING_CHRG { get; set; }
    public string R_EMAIL { get; set; }
    public string R_PHONE { get; set; }
    public string CART_ID { get; set; }
    public string STATUS { get; set; }
    
}