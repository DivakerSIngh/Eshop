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
                                    <asp:Label ID="lblHeaderTitle" CssClass="headerText" runat="server" Text='<%# Eval("headertitle") %>'></asp:Label>
                                    
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

