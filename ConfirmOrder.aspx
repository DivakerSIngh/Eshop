﻿<%@ Page Title="Confirm Order" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="ConfirmOrder.aspx.cs" Inherits="ConfirmOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

       <script type="text/javascript">
           function f() {
               toastr.error('Error occured Info cannot be viewd try later !');
           }
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>

        <asp:UpdatePanel ID="updatepnl" runat="server">
<ContentTemplate>
    
    
    <div class="cart-container">
        <div class="cart-left">
            <div class="head"><asp:Label ID="lblCartNum" runat="server" Text="My Cart(0)"></asp:Label></div>
            <%--<div class="msg">
                <div class="msg-body">
                    We're sorry! Only <asp:Label ID="lblAvailableQuantity" runat="server" Text="2"></asp:Label> units of Samsung Galaxy J3 Pro (Gold, 16 GB) for each customer.
                    <%--<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                </div>
            </div>--%>
            <div class="boddy">

                
                  <asp:Repeater ID="rptCartProds" OnItemDataBound="rptCartProds_ItemDataBound"
                runat="server">

                <ItemTemplate>

                <div class="boddy1">
                    <a href="#" class="sheru">
                        <img id="imgprod" runat="server"/>
                    </a>
                    <div class="boddy11">
                        <div class="boddy111">
                            <asp:Label ID="lblHeaderTitle" runat="server" Text='<%# Eval("headertitle") %>'></asp:Label>
                            <asp:Label ID="lblpid" Visible="false" runat="server" Text='<%# Eval("prodid") %>'></asp:Label>
                            <asp:Label ID="lblCartId" Visible="false" runat="server" Text='<%# Eval("CartId") %>'></asp:Label>
                        </div>
                        <div class="boddy112">
                            <asp:Label ID="lblSize" runat="server" Text='<%# Eval("size") %>'></asp:Label>
                        </div>
                        <div class="boddy113">
                            <asp:Label ID="lblSellerName" runat="server" Text='<%# Eval("Org_Name") %>'></asp:Label>
                        </div>
                        <div class="boddy114">
                            <div class="boddy1111">
                                ₹<asp:Label ID="lblSP" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label>
                            </div>
                            <div class="boddy1112">
                                ₹<asp:Label ID="lblCP" runat="server" Text='<%# Eval("costprice") %>'></asp:Label>
                            </div>
                            
                        </div>
                        
                    </div>
                    <div class="body12"></div>
                    
                    
                </div>

                <div class="boddy2" style="margin-bottom:36px;">
                    <div class="boddy21">
                        <div class="boddy211" >
                            
                            <div class="boddy2111" style="border:none">
                                <%--<asp:Label ID="lblqty" runat="server" Text='<%# Eval("cquantity") %>'></asp:Label>--%>
                            </div>
                            
                        </div>
                    </div>
                    <div class="boddy22">
                        <div class="boddy221" style="cursor:auto;color:blue">
                            <asp:Label ID="lblDiscount" runat="server" Text='<%# System.Convert.ToString(Eval("Discount")).Substring(0,4) %>'></asp:Label>
                                <span class="percent">% Off</span>
                        </div>
                        <div class="boddy222" style="cursor:auto;color:blue">
                            <asp:Label ID="lblquanty" runat="server" Text='<%# Eval("cquantity") %>'></asp:Label> * <asp:Label ID="Label2" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label>
                                <span class="percent"> = <asp:Label ID="lbltotsp" runat="server" Text='<%# Eval("totalamount") %>' ></asp:Label></span>
                        </div>
                    </div>
                </div>

                    </ItemTemplate>
                      </asp:Repeater>

            </div>
            <div class="foot">
                <div class="foot1">
                    <div class="foot11"> 
                        <div class="footbut">
                            
                                   <%-- <asp:LinkButton ID="btnMakePayment"  class="footbut1 footbut11 footbut2" OnCommand="btnMakePayment_Command" runat="server">Make Payment</asp:LinkButton>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cart-right">
            <div class="first-cart-right">
                <div class="sec-cart-right">
                    <div class="third-cart-right">
                        <div class="third-cart-right1">
                            <span>Price Detail</span>
                        </div>
                        <div class="third-cart-right2">
                            <div class="third-cart-right21">
                                <div>Price (<asp:Label ID="lblQuantity" runat="server" Text="1"></asp:Label> item)</div>
                                <div>₹<asp:Label ID="lblPriceAmt" runat="server" ></asp:Label></div>
                            </div>
                            <div class="third-cart-right21">
                                <div>Delivery Charges</div>
                                <div>
                                   
                                    <asp:Label ID="lblDeliveryCharge" runat="server" ></asp:Label>
                                     
                                </div>
                            </div>
                            <div class="third-cart-right21">
                                <div style="color:blue"><asp:Label ID="lblCouponInfo" runat="server" ></asp:Label></div>
                            </div>
                            <div class="third-cart-right22">
                                <div class="third-cart-right21">
                                    <div>Amount Payable</div>
                                    <div>₹<asp:Label ID="lblTotAmt" runat="server" ></asp:Label></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fourth-cart-right">
                        <img src="images/370988-200.png" class="safe-img"/>
                        <span class="safe-des">
                            <span>
                                Safe and Secure Payments. Easy returns. 100% Authentic products.
                            </span>
                        </span>
                        
                    </div>
                </div>
            </div>
            
            
            
            
        </div>
    </div>

    <div class="cart-container" style="padding-top:0">
        <div class="cart-left">
            <div class="head">
                <h3 class="heading">Choose Payment Mode</h3>
            </div>
            <div class="boddy table-mine">
                <asp:RadioButtonList ID="rbtnAddress" OnSelectedIndexChanged="rbtnAddress_SelectedIndexChanged" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="C">COD</asp:ListItem>
                    <asp:ListItem Value="W" style="padding-left:15%">Wallet Payment</asp:ListItem>
                    <asp:ListItem Value="N">Card/Net Banking</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="foot">
                <div class="foot1">
                    <div class="foot11"> 
                        <div class="footbut">
                            <asp:LinkButton ID="btnPayment" CommandArgument="" CssClass="footbut1 footbut11 footbut2" style="text-align: center" OnCommand="btnPayment_Command" OnClientClick="return textChange(this);" runat="server">Make Payment</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </div>
    <script>
        function textChange(elmt) {
            $(elmt).text('Processing...').attr('class', 'footbut1 footbut11 footbut2 disabled');
            return true;
        }
    </script>

    <%--<asp:Label ID="lblCartNum" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblHeaderTitle" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblSize" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblSellerName" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblSP" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblCP" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblDiscount" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblQuantity" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblPriceAmt" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblTotAmt" runat="server" Text="Label"></asp:Label>--%>
     
     <%--<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>--%>




    
    



    </ContentTemplate>
            </asp:UpdatePanel>


    

</asp:Content>

