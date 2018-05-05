<%@ Page Title="My Orders" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="MyOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

    <script type="text/javascript">
        function f() {
            toastr.error('Error occured Info cannot be viewd try later !');
        }
    </script>
    <style>
        b#bOrderDate {
    float: right;
    margin-right: 11px;
}
        .btn-return {
            color: white;
            float: right;
            margin-top: -11%;
            background: #337ab7;
            border: none;
            padding: 6px;
            margin-right: 100px;
        }

        .btn-returned {
            color: white;
            float: right;
            margin-top: -11%;
            background: #f44336;
            border: none;
            padding: 6px;
            margin-right: 100px;
        }

        .btn-cancel {
            float: right;
            margin-top: -11%;
            border: none;
            padding: 6px;
        }

        .btn-canceled {
            color: white;
            float: right;
            margin-top: -11%;
            background: #f44336;
            border: none;
            padding: 6px;
        }

        .seprate {
            border-bottom: 2px dotted red;
        }
    </style>
    <script>
        $(function () {

            var count = 0;
            var id = "";
            $('.transId-class').each(function () {


                var transId = $(this).find('input[type=hidden]').val();
                if (count == 0) {
                    id = transId;
                    count++;
                }
                else {
                    if ((id != "" && transId == id)) {
                        //$(this).css("background", "green");
                        //$(this).css("border-bottom","2px dotted red;");
                        //$(this).parent().css("border-top", "2px dotted red;");
                        $(this).addClass('seprate');
                        count = 0;
                        id = "";
                    }
                }

            })


        })
    </script>
    <script runat="server">
        private bool cancelOrderVisible(object status)
        {
            var boolStatus = false;
            if (Convert.ToInt32(status) ==1)
            {
                boolStatus = true;
            }

            return boolStatus;
        }
        private bool canceledOrderVisible(object status)
        {
            var boolStatus = false;
            if (Convert.ToInt32(status) == 7)
            {
                boolStatus = true;
            }

            return boolStatus;
        }
        private bool returnProduct(object returnPolicy, object status)
        {
            var boolStatus = false;
            if (returnPolicy.ToString() == "true")
            {
                boolStatus = true;
            }

            return boolStatus;
        }
        private string productDetails(object title, object returnPolicy)
        {
            return Convert.ToString(title) + "        (" + Convert.ToString(returnPolicy) + ")";
        }
        private bool checkReturnPolicyDate(object date,object isReturnPolicy,object cancelStatus)
        {
            var returnProduct= false;
            var currentdate =  DateTime.Now;
            var orederdate = Convert.ToDateTime(date);
            var calcDate = currentdate - orederdate;
            if ((Convert.ToBoolean(isReturnPolicy) && Convert.ToInt16(cancelStatus) == 5)&& calcDate.Days<=15)
                 returnProduct = true;
            return returnProduct;
        }






    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="cart-container">
        <div class="cart-left">
            <div class="head">
                <asp:Label ID="lblCartNum" runat="server" Text="My Orders"></asp:Label>
            </div>
            <asp:Panel ID="pnlMsg" runat="server">

                <div class="msg">
                    <div class="msg-body">
                        You have not ordered yet any product.
                    <%--<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>--%>
                    </div>
                </div>


            </asp:Panel>

            <asp:Repeater ID="rptTrans" runat="server" OnItemDataBound="rptTrans_ItemDataBound">
                <ItemTemplate>
                    <p style="margin-left: 10px">
                        <b id="bOrederNumber">
                            Order No. : <asp:Label ID="lblTransid" runat="server" Text='<%# Eval("TransId") %>'></asp:Label></b>
                         <b id="bOrderDate">
                            Order Date : <asp:Label ID="lblDate" runat="server" Text='<%# Eval("EMTRYDATE","{0: dd-MM-yyyy}") %>'></asp:Label></b>
                    </p>
                    <asp:HiddenField ID="hdnTrans" runat="server" Value='<%# Eval("TransId") %>' />
                    <asp:Repeater ID="rptMyOrder" OnItemDataBound="rptMyOrder_ItemDataBound"
                        runat="server">

                        <ItemTemplate>
                            <asp:Panel CssClass="transId-class" runat="server">

                                <div class="boddy">
                                    <div class="boddy1">
                                        <a href="#" class="sheru">
                                            <img id="imgprod" runat="server" />
                                        </a>
                                        <div class="boddy11">
                                            <div class="boddy111">
                                                <asp:Label ID="lblHeaderTitle" CssClass="headerText" runat="server" Text='<%# productDetails(Eval("headertitle"),Eval("returnpolicy"))%>'></asp:Label>

                                                <asp:Label ID="lblpid" Visible="false" runat="server" Text='<%# Eval("prodid") %>'></asp:Label>
                                                <asp:Label ID="lblCartId" Visible="false" runat="server" Text='<%# Eval("CartId") %>'></asp:Label>
                                            </div>
                                            <div class="boddy112">
                                                Size :
                                    <asp:Label ID="lblSize" runat="server" Text='<%# Eval("size") %>'></asp:Label>
                                            </div>
                                            <div class="boddy113">
                                                <asp:Label ID="lblSellerName" runat="server" Text='<%# Eval("Org_Name") %>'></asp:Label>
                                            </div>
                                            <div class="boddy113">
                                                Brand :
                                                <asp:Label ID="lblBrand" runat="server" Text='<%# Eval("brand_title") %>'></asp:Label>
                                            </div>
                                            <div class="boddy113">
                                                Color :
                                                <asp:Label ID="lblColor" runat="server" Text='<%# Eval("colors") %>'></asp:Label>
                                            </div>
                                            <div class="boddy114">
                                                <div class="boddy1111">
                                                    ₹<asp:Label ID="lblSP" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label>
                                                </div>

                                            </div>
                                            <div class="boddy114">
                                                    Current Status :&nbsp;&nbsp;&nbsp; <asp:Label ID="Label3" runat="server" ForeColor="#337ab7" Text='<%# Eval("Delivery_Status") %>'></asp:Label>
                                            </div>

                                        </div>
                                        <div class="body12"></div>
                                        <asp:HiddenField ID="hdnOrderId" runat="server" Value='<%# Eval("CartId") %>' />
                                        <asp:Button ID="btnCancelOrder" Visible='<%#cancelOrderVisible(Eval("Status")) %>' CommandArgument='<%# Eval("CartId")+"~"+Eval("LId")+"~"+Eval("headertitle")+"~"+Eval("prodid") %>' OnCommand="btnCancelOrder_Command" CssClass="btn-primary btn-cancel" Text="Cancel Order" runat="server" />
                                        <asp:Button ID="Button1" Visible='<%#canceledOrderVisible(Eval("Status")) %>' CssClass="btn-canceled" Text="Canceled" runat="server" />
                                        <asp:Button ID="btnReturn" Visible='<%# checkReturnPolicyDate(Eval("status_date"),Eval("IsReturnPolicy"),Eval("Status"))%>' CommandArgument='<%# Eval("CartId")+"~"+Eval("LId")+"~"+Eval("headertitle")+"~"+Eval("prodid")+"~"+Eval("Address")+"~"+Eval("TransId") %>' CssClass="btn-return" Text="Return Product" runat="server" OnCommand="btnReturn_Command" />
                                        <asp:Button ID="Button2" Visible='<%# (Convert.ToInt32(Eval("ReturnStatus"))==1)?true:false%>' CssClass="btn-returned" Text="Returned" runat="server" />


                                    </div>
                                    <div class="boddy2">

                                        <div class="boddy22">
                                            <div class="boddy221">
                                                Quantity :
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("cquantity") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </asp:Panel>

                        </ItemTemplate>
                    </asp:Repeater>
                    <p style="margin-left: 10px">
                        <b>
                            Delivery Address :
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                       </b>
                   </p>
                </ItemTemplate>
                <SeparatorTemplate>
                    <tr>
                        <td colspan="2">
                            <hr class="seprate" />
                        </td>
                    </tr>
                </SeparatorTemplate>
            </asp:Repeater>


        </div>
    </div>


</asp:Content>

