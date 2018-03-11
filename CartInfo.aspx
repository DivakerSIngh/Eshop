<%@ Page Title="Cart Info" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="CartInfo.aspx.cs" Inherits="CartInfo" %>

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


            </asp:Panel>
              

                  <asp:Repeater ID="rptCart" OnItemDataBound="rptCart_ItemDataBound"
                runat="server">

                <ItemTemplate>
            <div class="boddy">
                <div class="boddy1">
                    <a href="#" class="sheru">
                        <img  id="imgprod" runat="server"/>
                    </a>
                    <div class="boddy11">
                        <div class="boddy111">
                            <a href="SingleProdInfo.aspx?pid=<%# Eval("prodid") %>"><asp:Label ID="lblHeaderTitle" CssClass="headerText" runat="server" Text='<%# Eval("headertitle") %>' ></asp:Label></a>
                            <asp:Label ID="lblAvailableQuantity" CssClass="myQuant" style="display: none"  runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                            <asp:Label ID="lblpid" Visible="false" runat="server" Text='<%# Eval("prodid") %>'></asp:Label>
                            <asp:Label ID="lblCartId" Visible="false" runat="server" Text='<%# Eval("CartId") %>'></asp:Label>
                        </div>
                        <div class="boddy112">
                            <asp:Label ID="lblSize" runat="server" Text='<%# Eval("size") %>'></asp:Label>
                            <asp:Label ID="lblRetalorPin" runat="server" Visible="false" Text='<%# Eval("Pincode") %>'></asp:Label>
                            <asp:Label ID="lblWt" runat="server" Visible="false" Text='<%# Eval("weight") %>'></asp:Label>
                        </div>
                        <div class="boddy113">
                            <asp:Label ID="lblSellerName" runat="server" Text='<%# Eval("Org_Name") %>'></asp:Label>
                        </div>
                        <div class="boddy114">
                            <div class="boddy1111">
                                ₹<asp:Label ID="lblSP" runat="server" CssClass="sellingPrice" Text='<%# Eval("sellingprice") %>'></asp:Label>
                            </div>
                            <div class="boddy1112">
                                ₹<asp:Label ID="lblCP" runat="server" CssClass="mrpPrice" Text='<%# Eval("costprice") %>'></asp:Label>
                            </div>
                            <div class="boddy1113">
                                <asp:Label ID="lblDiscount" runat="server" Text='<%# System.Convert.ToString(Eval("Discount")).Substring(0,4) %>'></asp:Label>
                                <span class="percent">% Off</span>
                            </div>
                        </div>
                        <div class="boddy114">
                            <label>Return policy: &nbsp;</label>
                                     <asp:Label ID="Label1" Text='<%#Eval("returnpolicy") %>' ForeColor="Red" runat="server"></asp:Label>
                        </div>
                        
                    </div>
                    <div class="body12"></div>
                    
                    
                </div>
                <div class="boddy2">
                    <div class="boddy21">
                        <div class="boddy211">
                            <%--<asp:Button ID="btnDecreQty" OnCommand="btnDecreQty_Command" CommandArgument='<%# Eval("CartId") %>' class="button1 pandm" Text="-"  runat="server"></asp:Button>--%>
                             <asp:Button ID="btnDecryment" class="button2 pandm" CommandArgument='<%# Eval("CartId")+","+Eval("cquantity")+","+Eval("sellingprice")+","+Eval("costprice") %>' OnCommand="btnDecryment_Command" Text="-" runat="server"></asp:Button>
                           <%-- <button class="button1 pandm" type="button">-</button>--%>
                            <div class="boddy2111">
                                <asp:TextBox ID="txtQuantity" ReadOnly="true" runat="server" CssClass="input1 quantity" Text='<%# Eval("cquantity") %>' value="1" TextMode="Number" MaxLength="3" min="1"></asp:TextBox>
                            </div>
                           <%-- <asp:Button ID="btnIncreQty" class="button2 pandm" CommandArgument='<%# Eval("CartId") %>' OnCommand="btnIncreQty_Command" Text="+" runat="server"></asp:Button>--%>
                             <asp:Button ID="btnIncrease" class="button2 pandm" CommandArgument='<%# Eval("CartId")+","+Eval("cquantity")+","+Eval("sellingprice")+","+Eval("costprice") %>' OnCommand="btnIncrease_Command" Text="+" runat="server"></asp:Button>
                           <%-- <button class="button2 pandm"  type="button">+</button>--%>
                        </div>
                    </div>
                    <div class="boddy22">
                        <div class="boddy221">
                            <asp:LinkButton ID="btnAddWishList" CommandArgument='<%# Eval("CartId") %>' OnCommand="btnAddWishList_Command" runat="server">Move to WishList</asp:LinkButton>
                        </div>
                        <div class="boddy222">
                            <asp:LinkButton ID="btnRemove" runat="server" CommandArgument='<%# Eval("CartId") %>' OnCommand="btnRemove_Command">Remove</asp:LinkButton>
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
                           
                           <asp:LinkButton CssClass="footbut1 footbut11 footbut111" ID="btnContinueShopping" CommandArgument='<%# Eval("CartId") %>' OnCommand="btnContinueShopping_Command" runat="server"><i class="fa fa-chevron-left" aria-hidden="true"></i>
                               <span>Continue Shopping</span></asp:LinkButton>
                           
                       </a> 
                       <div class="footbut">
                           <asp:LinkButton CssClass="footbut1 footbut11 footbut2" ID="btnPlaceOrder" CommandArgument='<%# Eval("CartId") %>' OnCommand="btnPlaceOrder_Command" runat="server">Place Order</asp:LinkButton>
                           
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
                                <div class="priTex1">MRP (<asp:Label ID="lblQuantity1" runat="server" ></asp:Label> item)</div>
                                <div class="priAmt1">₹<asp:Label ID="lblMrpAmpt" CssClass="pricedetailMrp" runat="server" ></asp:Label></div>
                            </div>
                            <div class="third-cart-right21">
                                <div class="priTex1">Total Discount</div>
                                <div class="priAmt1">₹<asp:Label ID="lblDiscount" CssClass="pricedetailTotalDiscount" runat="server" ></asp:Label></div>
                            </div>
                            <div class="third-cart-right21">
                                <div class="priTex1">Coupon Discount</div>
                                <div class="priAmt1"><asp:Label ID="lblPriceAmt" CssClass="pricedetailPriceAmt" Visible="false" runat="server" ></asp:Label>
                                    ₹<asp:Label ID="lblCouponDiscount"  runat="server" CssClass="pricedetailDiscount"></asp:Label>
                                </div>
                            </div>
                             <div class="third-cart-right21">
                                <div class="priTex1">Delivery Charges</div>
                                <div class="priDel">₹<asp:Label ID="lblDeleiveryCharge" CssClass="pricedetailDeleiveryCharge" runat="server" ></asp:Label></div>
                            </div>
                            

                            <div class="third-cart-right22">
                                <div class="third-cart-right21">
                                    <div class="priTex1">Amount Payable</div>
                                    <div class="priAmt1">₹<asp:Label ID="lblTotAmt" CssClass="pricedetailTotAmt" runat="server" ></asp:Label></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="third-cart-right">
                        <div class="third-cart-right1">
                            
                            <asp:LinkButton ID="btnUseCoupon" OnCommand="btnUseCoupon_Command" runat="server"><span>Apply Coupon</span></asp:LinkButton>
                        </div>
                        
                        <div class="third-cart-right1">
                            <asp:Label ID="lblSaveAmt" runat="server"></asp:Label>
                        </div>
                        
                        <div>
                            <asp:Panel ID="pnlApplyCoupon" runat="server">


                            <div style="padding: 15px 25px;padding-bottom: 6px;">
                                <asp:RadioButtonList ID="rbtnCouponType" style="width:100%;" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem class="radio-inline">Gift Voucher</asp:ListItem>
                                <asp:ListItem class="radio-inline">Premium Card</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                            <div style="padding:10px">
                                <div style="width:55%; margin-left: 5%;display:inline-block">
                                    <asp:TextBox ID="txtCouponId" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div style="width:25%;display:inline-block">
                                    <asp:LinkButton ID="btnApplyCoupon" runat="server" OnCommand="btnApplyCoupon_Command" >Apply Coupon</asp:LinkButton>
                                </div>
                            </div>
                            


                        </asp:Panel>
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
    
    
    


</ContentTemplate>
            </asp:UpdatePanel>

    <script>
        $(document).ready(function () {
            debugger
            var totalAmount = (parseFloat($('.pricedetailMrp').text()) - parseFloat($('.pricedetailTotalDiscount').text())) + (parseFloat($('.pricedetailDiscount').text()) + parseFloat($('.pricedetailDeleiveryCharge').text()));
            $('.pricedetailTotAmt').text(totalAmount);
            //var total = 0;
            //var price = $('.input1').parent().parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right22').children('div.third-cart-right21').children('div.priAm'), amount = $('.input1').parent().parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right21').children('div.priAm');

            //$('.input1').each(function () {
            //    var htext = $(this).parent().parent().parent().parent().prev().children('div.boddy11').children('div.boddy111').children('span.headerText').text();
            //    var quant = +$(this).parent().parent().parent().parent().prev().children('div.boddy11').children('div.boddy111').children('span.myQuant').text();
            //    if (quant == 0) {
            //        $(this).attr('disabled', 'disabled');
            //        $('<div class="msg"></div>').insertBefore($(this).parent().parent().parent().parent().parent());
            //        $(this).parent().parent().parent().parent().parent().prev().html('<div class="msg-body">We\'re sorry! Only ' + htext + ' is Out of stock</div>');
            //    }

            //    if ($(this).val() != '') {
            //        var actpri = +$(this).parent().parent().parent().parent().prev().children('div.boddy11').children('div.boddy114').children('div.boddy1111').children().text();
            //        total += +$(this).val() * actpri;
            //    }
            //})
            //price.text('₹' + total);
            //amount.text('₹' + total);

            //$('.boddy').on('remove', function () {
            //    var total = 0;
            //    var price = $(this).parent().parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right22').children('div.third-cart-right21').children('div.priAm'), amount = $(this).parent().parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right21').children('div.priAm');


            //    $('.input1').each(function () {
            //        if ($(this).val() != '') {
            //            var actpri = +$(this).parent().parent().parent().parent().prev().children('div.boddy11').children('div.boddy114').children('div.boddy1111').children().text();
            //            total += +$(this).val() * actpri;
            //        }
            //    })
            //    price.text('₹' + total);
            //    amount.text('₹' + total);
            //});

            //$('.input1').on('blur ready', function () {
            //    var total = 0;
            //    var price = $(this).parent().parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right22').children('div.third-cart-right21').children('div.priAm'), amount = $(this).parent().parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right21').children('div.priAm');


            //    $('.input1').each(function () {
            //        if ($(this).val() != '') {
            //            var actpri = +$(this).parent().parent().parent().parent().prev().children('div.boddy11').children('div.boddy114').children('div.boddy1111').children().text();
            //            total += +$(this).val() * actpri;
            //        }
            //})
            //    price.text('₹' + total);
            //    amount.text('₹' + total);

            //})
            //$(document).on('keypress', function (e) { console.log(e.keyCode); });
            //$('.input1').bind('paste', function (e) {
            //    e.preventDefault();
            //});

            //$('.input1').on('keypress', function (e) {
            //    return false;
            //});
            var count = 1;
            $('.pandmold').on('click', function (e) {
                
                //code by divaker

                                    //var selectedQuantity = $(this).closest('div').find('.quantity').val();
                                    //var sellingPrice = $(this).closest('div.boddy').find('.sellingPrice').text();
                                    //var mrpPrice = $(this).closest('div.boddy').find('.mrpPrice').text();
                                    //var discount = parseFloat(mrpPrice) - parseFloat(sellingPrice);

                                    //if ($(this).text() == '+') {
                                    //    count = count+1
                                    //    $(this).closest('div').find('.quantity').val(count)
                                    //         var price = parseFloat($('.pricedetailMrp').text()) + parseFloat(mrpPrice)
                                    //    $('.pricedetailMrp').text(price);
                                    //        // $('.pricedetailMrp').text('asdasd');
                                    //         $('.pricedetailTotalDiscount').text((parseFloat($('.pricedetailTotalDiscount').text()) + discount));
                                    //} else {
                                    //    count =count==1?1: count-1;
                                    //    $(this).closest('div').find('.quantity').val(count)
                                    //    if (parseInt(selectedQuantity) > 1)
                                    //    {
                                    //        var price = parseFloat($('.pricedetailMrp').text()) - parseFloat(mrpPrice);
                                    //        $('.pricedetailTotalDiscount').text(parseFloat($('.pricedetailTotalDiscount').text()) - discount);
                                    //        $('.pricedetailMrp').text(price);
                                    //       // $('.pricedetailMrp').text('1213');
                                    //    }
                                    //}

                                    //var totalAmount = (parseFloat($('.pricedetailMrp').text()) - parseFloat($('.pricedetailTotalDiscount').text())) + (parseFloat($('.pricedetailDiscount').text()+parseFloat($('.pricedetailDeleiveryCharge').text() )));
                                    //$('.pricedetailTotAmt').text(totalAmount);
                //End

                //var inp;
                //var quant = +$(this).parent().parent().parent().prev().children('div.boddy11').children('div.boddy111').children('span.myQuant').text();
                //var htext = $(this).parent().parent().parent().prev().children('div.boddy11').children('div.boddy111').children('span.headerText').text();
                //var price = $(this).parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right22').children('div.third-cart-right21').children('div.priAm'), amount = $(this).parent().parent().parent().parent().parent().next().children().children().children('div.third-cart-right').children('div.third-cart-right2').children('div.third-cart-right21').children('div.priAm');
                //var actpri = +$(this).parent().parent().parent().prev().children('div.boddy11').children('div.boddy114').children('div.boddy1111').children().text();
                //if ($(this).text() == '-') {
                //    inp = $(this).next().children();
                //    if (+inp.val() > 1) {
                //        inp.val(+inp.val() - 1);
                //        price.text('₹' + (+price.text().substr(1) - actpri));
                //        amount.text(price.text());
                //    }
                //    if ($(this).parent().parent().parent().parent().parent().children('div.msg').length > 0) {
                //        $(this).parent().parent().parent().parent().parent().children('div.msg').remove();
                //    }

                //} else {
                //    inp = $(this).prev().children();
                //    if (+inp.val() < 100) {
                //        if (quant > +inp.val()) {
                //            if (!(inp.attr('disabled'))) {
                //                inp.val(+inp.val() + 1);
                //                price.text('₹' + (+price.text().substr(1) + actpri));
                //                amount.text(price.text());
                //            }
                //        } else {
                //            if ($(this).parent().parent().parent().parent().parent().children('div.msg').length == 0) {
                //                $('<div class="msg"></div>').insertBefore($(this).parent().parent().parent().parent());
                //                $(this).parent().parent().parent().parent().prev().html('<div class="msg-body">We\'re sorry! Only ' + quant + ' units of ' + htext + ' are left.</div>');
                //            }
                //        }
                //    }
                //}
                //e.preventDefault();
            })
            $('#ContentPlaceHolder1_btnPlaceOrder').on('click', function (e) {
                if ($('.msg').length > 0) {
                    e.preventDefault();
                }
                //$('.input1').each(function (i, obj) {
                //    if ($(this).val().length == 0) {
                //        $(this).val('1');
                //    }
                //});

            });
        });
    </script>
</asp:Content>


