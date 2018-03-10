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
        .btn-returned{
            color: white;
    float: right;
    margin-top: -11%;
    background: #337ab7;
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
       .btn-canceled{
           color: white;
    float: right;
    margin-top: -11%;
    background: #f44336;
    border: none;
    padding: 6px;
       }
    </style>
    <script runat="server">
        private bool cancelOrderVisible(object status)
        {
            var boolStatus = false;
            if (Convert.ToInt32(status) < 4)
            {
            boolStatus = true;
            }

            return boolStatus;
        }
         private bool canceledOrderVisible(object status)
        {
            var boolStatus = false;
            if (Convert.ToInt32(status) == 5)
            {
              boolStatus = true;
            }

            return boolStatus;
        }
         private bool returnProduct(object status)
        {
            var boolStatus = false;
            if (status.ToString() == "true")
            {
              boolStatus = true;
            }

            return boolStatus;
        }
          private string productDetails(object title,object returnPolicy)
        {
            return Convert.ToString(title)+"        ("+ Convert.ToString(returnPolicy)+")";
        }

        
        
      
        

        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="cart-container">
        <div class="cart-left">
            <div class="head">
                <asp:Label ID="lblCartNum" runat="server" Text="My Orders"></asp:Label></div>
            <asp:Panel ID="pnlMsg" runat="server">

                <div class="msg">
                    <div class="msg-body">
                        You have not ordered yet any product.
                    <%--<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>--%>
                    </div>
                </div>


            </asp:Panel>


            <asp:Repeater ID="rptMyOrder" OnItemDataBound="rptMyOrder_ItemDataBound"
                runat="server">

                <ItemTemplate>
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
                                <div class="boddy114">
                                    <div class="boddy1111">
                                        ₹<asp:Label ID="lblSP" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label>
                                    </div>
                                    
                                </div>

                            </div>
                            <div class="body12"></div>
                            <asp:HiddenField ID="hdnOrderId" runat="server" Value='<%# Eval("CartId") %>' />
                            <asp:Button ID="btnCancelOrder" Visible='<%#cancelOrderVisible(Eval("Status")) %>' CommandArgument='<%# Eval("CartId") %>' OnCommand="btnCancelOrder_Command" CssClass="btn-primary btn-cancel" Text="Cancel Order" runat="server" />
                             <asp:Button ID="Button1" Visible='<%#canceledOrderVisible(Eval("Status")) %>'  CssClass="btn-canceled" Text="Canceled" runat="server" />
                             <asp:Button ID="btnReturn" Visible='<%# returnProduct(Eval("IsReturnPolicy"))%>' CommandArgument='<%# Eval("CartId") %>'  CssClass="btn-returned" Text="Return Product" runat="server" OnCommand="btnReturn_Command" />
                             

                        </div>
                        <div class="boddy2">
                            
                            <div class="boddy22">
                                <div class="boddy221">
                                    Quantity : <asp:Label ID="Label1" runat="server" Text='<%# Eval("cquantity") %>'></asp:Label>
                                </div>
                                <div class="boddy222">
                                    
                                </div>
                            </div>
                        </div>
                       
                    </div>

                </ItemTemplate>
            </asp:Repeater>



        </div>
    </div>


</asp:Content>

