<%@ Page Title="Wishlist" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="WishList.aspx.cs" Inherits="WishList" %>

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
            <div class="head"><asp:Label ID="lblCartNum" runat="server" Text=""></asp:Label></div>
            <asp:Panel ID="pnlMsg" runat="server">

                <div class="msg">
                <div class="msg-body">
            
                    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

            </asp:Panel>


                  <asp:Repeater ID="rptWishList" OnItemDataBound="rptWishList_ItemDataBound"
                runat="server">

                <ItemTemplate>
            <div class="boddy">
                <div class="boddy1">
                    <a href="#" class="sheru">
                        <img  id="imgprod" runat="server"/>
                    </a>
                    <div class="boddy11">
                        <div class="boddy111">
                            <asp:Label ID="lblHeaderTitle" runat="server" Text='<%# Eval("headertitle") %>' ></asp:Label>
                            
                            <asp:Label ID="lblpid" Visible="false" runat="server" Text='<%# Eval("pid") %>'></asp:Label>
                            <asp:Label ID="lblwishlistId" Visible="false" runat="server" Text='<%# Eval("wishlistid") %>'></asp:Label>
                        </div>
                        <div class="boddy112">
                          Size :  <asp:Label ID="lblSize" runat="server" Text='<%# Eval("size") %>'></asp:Label>
                        </div>
                        <%--<div class="boddy113">
                        
                        </div>--%>
                        <div class="boddy114">
                            <div class="boddy1111">
                                ₹<asp:Label ID="lblSP" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label>
                            </div>
                            <div class="boddy1112">
                                ₹<asp:Label ID="lblCP" runat="server" Text='<%# Eval("costprice") %>'></asp:Label>
                            </div>
                            <div class="boddy1113">
                                <asp:Label ID="lblDiscount" runat="server" Text='<%# System.Convert.ToString(Eval("discount")).Substring(0,4) %>'></asp:Label>
                                <span class="percent">% Off</span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="body12"></div>
                    
                    
                </div>
                <div class="boddy2">
                    <%--   <div class="boddy21">
                        <div class="boddy211">
                           <asp:LinkButton ID="btnDecreQty" OnCommand="btnDecreQty_Command" CommandArgument='<%# Eval("CartId") %>' class="button1"   runat="server">-</asp:LinkButton>
                          <button class="button1">-</button>--%>
                           <%--  <div class="boddy2111">
                                <asp:TextBox ID="txtQuantity" runat="server" CssClass="input1" value="1" TextMode="Number" MaxLength="3" min="1"></asp:TextBox>
                            </div>
                            <asp:LinkButton ID="btnIncreQty" class="button2" CommandArgument='<%# Eval("CartId") %>' OnCommand="btnIncreQty_Command"  runat="server">+</asp:LinkButton>
                           <button >+</button>
                        </div>
                    </div>--%>
                    <div class="boddy22">
                        <div class="boddy221">
                            <asp:LinkButton ID="btnAddCart" CommandArgument='<%# Eval("wishlistid") %>'  runat="server" OnCommand="btnAddCart_Command">Move to Cart</asp:LinkButton>
                        </div>
                        <div class="boddy222">
                            <asp:LinkButton ID="btnRemove" runat="server" CommandArgument='<%# Eval("wishlistid") %>' OnCommand="btnRemove_Command">Remove</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

                             </ItemTemplate>
                </asp:Repeater>



            <div class="foot">
                <div class="foot1">
                    <div class="foot11">
                       <a href="/">
                           
                           <asp:LinkButton CssClass="footbut1 footbut11 footbut111" ID="btnContinueShopping" OnCommand="btnContinueShopping_Command"  runat="server"><i class="fa fa-chevron-left" aria-hidden="true"></i>
                               <span>Continue Shopping</span></asp:LinkButton>
                           
                       </a> 
                       <%--<div class="footbut">
                           <asp:LinkButton CssClass="footbut1 footbut11 footbut2" ID="btnPlaceOrder" CommandArgument='<%# Eval("CartId") %>'  runat="server">Place Order</asp:LinkButton>
                           
                       </div>--%>
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
                                <div>Price (<asp:Label ID="lblQuantity" runat="server" ></asp:Label> item)</div>
                                <div><asp:Label ID="lblPriceAmt" runat="server" ></asp:Label></div>
                            </div>
                            <div class="third-cart-right22">
                                <div class="third-cart-right21">
                                    <div>Amount Payable</div>
                                    <div><asp:Label ID="lblTotAmt" runat="server" ></asp:Label></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fourth-cart-right">
                        
                        <%--<asp:LinkButton ID="btnUseCoupon" OnCommand="btnUseCoupon_Command" runat="server">Apply Coupon</asp:LinkButton>
                        
                        <asp:Panel ID="pnlApplyCoupon" runat="server">


                            <asp:RadioButtonList ID="rbtnCouponType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem class="radio-inline">Gift Voucher</asp:ListItem>
                                <asp:ListItem class="radio-inline">Premium Card</asp:ListItem>
                            </asp:RadioButtonList>

                            <asp:TextBox ID="txtCouponId" runat="server"></asp:TextBox>
                            <asp:LinkButton ID="btnApplyCoupon" runat="server" OnCommand="btnApplyCoupon_Command" >Apply Coupon</asp:LinkButton>


                        </asp:Panel>
                        --%>
                        
                        
                        
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

    
    


</ContentTemplate>
            </asp:UpdatePanel>



</asp:Content>

