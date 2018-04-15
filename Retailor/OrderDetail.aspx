<%@ Page Title="" Language="C#" MasterPageFile="~/Retailor/RetailorPanel.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Retailor_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

    <script type="text/javascript">
        function f() {
            toastr.error('Error occured Info cannot be viewd try later !');
        }
    </script>



    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css2/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="/css2/style.css" rel='stylesheet' type='text/css' />
    <link href="/css2/font-awesome.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"> </script>
    <!-- Mainly scripts -->
    <script src="/js2/jquery.metisMenu.js"></script>
    <script src="/js2/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <link href="/css2/custom.css" rel="stylesheet" />
    <script src="/js2/custom.js"></script>
    <!--skycons-icons-->
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="blank">
       <a href="RetailorDashboard.aspx?type=1" class="fa fa-caret-left"></a>  &nbsp;&nbsp;&nbsp;Order Details
                    <div class="blank-page">
                        <div id="form1">
                            <asp:Repeater ID="rptOrderDetail" runat="server">
                                <ItemTemplate>
                                    <div class="boddy">
                                        <div class="boddy1">
                                            <a href="#" class="sheru">
                                                <img id="imgprod" runat="server" />
                                            </a>
                                            <div class="boddy11">
                                                 <div class="boddy112">
                                                    <asp:Label ID="lblpid" runat="server" Text='<%# Eval("PRODUCT_ID") %>'></asp:Label>
                                                </div>
                                                <div class="boddy111">
                                                    <asp:Label ID="lblHeaderTitle" ForeColor="ForestGreen" CssClass="headerText" runat="server" Text='<%# Eval("PRODUCT_TITLE") %>'></asp:Label>
                                                    
                                                    <asp:Label ID="lblCartId" Visible="false" runat="server" Text='<%# Eval("CART_ID") %>'></asp:Label>
                                                </div>
                                                <div class="boddy112">
                                                    Qty : <asp:Label ID="lblAvailableQuantity" CssClass="myQuant" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                                </div>
                                                <div class="boddy112">
                                                    Size : <asp:Label ID="lblSize" runat="server" Text='<%# Eval("MEASUREMENT") %>'></asp:Label>
                                                </div>
                                                <div class="boddy112">
                                                    Color : <asp:Label ID="Label6" runat="server" Text='<%# Eval("COLORS") %>'></asp:Label>
                                                </div>
                                                <div class="boddy112">
                                                    Brand : <asp:Label ID="Label7" runat="server" Text='<%# Eval("BRAND_TITLE") %>'></asp:Label>
                                                </div>
                                                <div class="boddy114">
                                                    <div class="boddy1111">
                                                       Selling Price: &#8360; <asp:Label ID="lblSP" runat="server" CssClass="sellingPrice" Text='<%# Eval("sellingprice") %>'></asp:Label>
                                                    </div>
                                                    <div class="boddy1112">
                                                       Cost Price: &#8360; <asp:Label ID="lblCP" runat="server" CssClass="mrpPrice" Text='<%# Eval("costprice") %>'></asp:Label>
                                                    </div>
                                                    <div class="boddy1113">
                                                    </div>
                                                </div>
                                                <div class="boddy114">
                                                    <div class="boddy1111">
                                                       Customer Name: <asp:Label ID="Label1" runat="server" Text='<%# Eval("USER_NAME") %>'></asp:Label>
                                                    </div>
                                                    <div class="boddy1112">
                                                       Address: <asp:Label ID="Label2" runat="server" Text='<%# Eval("USER_ADDRESS") %>'></asp:Label>
                                                    </div>
                                                     <div class="boddy1112">
                                                       City: <asp:Label ID="Label3" runat="server" Text='<%# Eval("USER_CITY") %>'></asp:Label>
                                                    </div>
                                                     <div class="boddy1112">
                                                       State: <asp:Label ID="Label4" runat="server" Text='<%# Eval("USER_STATE") %>'></asp:Label>
                                                    </div>
                                                     <div class="boddy1112">
                                                       Pincode: <asp:Label ID="Label5" runat="server" Text='<%# Eval("USER_PINCODE") %>'></asp:Label>
                                                    </div>
                                                    <div class="boddy1113">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="body12">
                                                <hr />
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
    </div>
</asp:Content>

