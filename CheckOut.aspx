<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" EnableEventValidation="false" %>

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



    
<%--                        <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>

        <asp:UpdatePanel ID="updatepnl" runat="server">
<ContentTemplate>--%>

    <div class="cart-container">
        <div class="cart-left">
            <div class="head">
                <h3 class="heading">Delivery Address</h3>
            </div>
            <div class="boddy table-mine">
                <%--<asp:RadioButtonList ID="rbtnAddress" OnSelectedIndexChanged="rbtnAddress_SelectedIndexChanged" runat="server"  AutoPostBack="true">
                    <asp:ListItem Value="D">Default Address</asp:ListItem>
                    <asp:ListItem Value="N">New Address</asp:ListItem>
                </asp:RadioButtonList>--%>

                <asp:RadioButtonList ID="rbtnAddress" runat="server" OnSelectedIndexChanged="rbtnAddress_SelectedIndexChanged1" AutoPostBack="true" RepeatDirection="Horizontal" >
                        <asp:ListItem Value="D">Default Address</asp:ListItem>
                    <asp:ListItem Value="N">New Address</asp:ListItem>
                </asp:RadioButtonList>

            </div>
    <%--        <div class="boddy form-mine">
                <asp:Panel ID="pnlDefaultAddress" runat="server">

        
                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblPincode" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblState" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblCity" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblLandMark" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="lblDefaultError" runat="server" Text="Label"></asp:Label>
                    <asp:LinkButton ID="btnDefaultAddress" CommandArgument="" OnCommand="btnDefaultAddress_Command" runat="server">LinkButton</asp:LinkButton>
        
                </asp:Panel>
            </div>--%>
            <div class="boddy form-mine">
                <div class="form-mine1">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Address Info</legend>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="Mobile No"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtPincode" runat="server" class="form-control" placeholder="Pincode"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtCity" runat="server" class="form-control" placeholder="City" disabled="disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtState" runat="server" class="form-control" placeholder="State" disabled="disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtLandmark" runat="server" class="form-control" placeholder="Landmark"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12" style="text-align: center">
                                    <asp:LinkButton ID="btnNewAddDelivery" CommandArgument="" OnCommand="btnNewAddDelivery_Command" OnClientClick="return newAddress(this);" CssClass="btn btn-primary" runat="server">CheckOut</asp:LinkButton>
                                    <asp:LinkButton ID="btnCancel" CommandArgument="" CssClass="btn btn-primary" OnCommand="btnCancel_Command" runat="server" Visible="false">Cancel</asp:LinkButton>
                                </div>
                            </div>
                        </fieldset>
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
                                <div><asp:Label ID="lblPriceAmt" runat="server" Text="Price"></asp:Label> (<asp:Label ID="lblQuantity" runat="server" Text="1"></asp:Label> item)</div>
                                <div>₹<asp:Label ID="lblprice" runat="server" ></asp:Label></div>
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
   <script>
       $(document).ready(function () {
           $('form').attr('id', 'newAddress');
           $('[name="ctl00$ContentPlaceHolder1$txtPhone"]').on('keydown', function (e) {
               if (!((e.keyCode > 95 && e.keyCode < 106)
                 || (e.keyCode > 47 && e.keyCode < 58)
                 || e.keyCode == 8)) {
                   return false;
               }
           });
       });
   </script>
    <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js" ></script>
	            <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
                <script src="/js2/stdis.js"></script>
                <script src="/js2/sidscript.js"></script>

    


<%--
    </ContentTemplate>

            <Triggers>

<asp:AsyncPostBackTrigger ControlID="rbtnAddress" EventName="SelectedIndexChanged" />

</Triggers>

            </asp:UpdatePanel>--%>

</asp:Content>

