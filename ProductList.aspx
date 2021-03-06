﻿<%@ Page Title="Product List" Language="C#" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="css2/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="css2/style.css" rel='stylesheet' type='text/css' />
    <link href="css2/font-awesome.css" rel="stylesheet" />
    <script src="js2/jquery.min.js"> </script>
    <!-- Mainly scripts -->
    <script src="js2/jquery.metisMenu.js"></script>
    <script src="js2/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <link href="css2/custom.css" rel="stylesheet" />
    <script src="js2/custom.js"></script>
    <script src="js2/screenfull.js"></script>
    <script>
        $(function () {
            $('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

            if (!screenfull.enabled) {
                return false;
            }



            $('#toggle').click(function () {
                screenfull.toggle($('#container')[0]);
            });



        });
    </script>

    <!----->

    <!--pie-chart--->
    <script src="js2/pie-chart.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#demo-pie-1').pieChart({
                barColor: '#3bb2d0',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-2').pieChart({
                barColor: '#fbb03b',
                trackColor: '#eee',
                lineCap: 'butt',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-3').pieChart({
                barColor: '#ed6498',
                trackColor: '#eee',
                lineCap: 'square',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });


        });

    </script>
    <!--skycons-icons-->
    <script src="js2/skycons.js"></script>
    <!--//skycons-icons-->


</head>
<body>
   
    
     <div id="wrapper">

        <!----->
        <nav class="navbar-default navbar-static-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1><a class="navbar-brand" href="AdminPage.aspx">Villagers</a></h1>
            </div>
            <div class=" border-bottom">
                <div class="full-left">
                    <section class="full-top">
                        <button id="toggle"><i class="fa fa-arrows-alt"></i></button>
                    </section>
                    <form class=" navbar-left-right">
                       
                    </form>
                    <div class="clearfix"></div>
                </div>


                <!-- Brand and toggle get grouped for better mobile display -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="drop-men" style="">
                    <ul class=" nav_1">

                        <li class="dropdown at-drop">
                            <a href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown"><i class="fa fa-globe"></i><span class="number">5</span></a>
                            <ul class="dropdown-menu menu1 " role="menu" style="display:none;">
                                <li><a href="#">

                                    <div class="user-new">
                                        <p>New user registered</p>
                                        <span>40 seconds ago</span>
                                    </div>
                                    <div class="user-new-left">

                                        <i class="fa fa-user-plus"></i>
                                    </div>
                                    <div class="clearfix"></div>
                                </a></li>
                                <li><a href="#">
                                    <div class="user-new">
                                        <p>Someone special liked this</p>
                                        <span>3 minutes ago</span>
                                    </div>
                                    <div class="user-new-left">

                                        <i class="fa fa-heart"></i>
                                    </div>
                                    <div class="clearfix"></div>
                                </a></li>
                                <li><a href="#">
                                    <div class="user-new">
                                        <p>John cancelled the event</p>
                                        <span>4 hours ago</span>
                                    </div>
                                    <div class="user-new-left">

                                        <i class="fa fa-times"></i>
                                    </div>
                                    <div class="clearfix"></div>
                                </a></li>
                                <li><a href="#">
                                    <div class="user-new">
                                        <p>The server is status is stable</p>
                                        <span>yesterday at 08:30am</span>
                                    </div>
                                    <div class="user-new-left">

                                        <i class="fa fa-info"></i>
                                    </div>
                                    <div class="clearfix"></div>
                                </a></li>
                                <li><a href="#">
                                    <div class="user-new">
                                        <p>New comments waiting approval</p>
                                        <span>Last Week</span>
                                    </div>
                                    <div class="user-new-left">

                                        <i class="fa fa-rss"></i>
                                    </div>
                                    <div class="clearfix"></div>
                                </a></li>
                                <li><a href="#" class="view">View all messages</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle dropdown-at" data-toggle="dropdown"><span class=" name-caret"><asp:Label ID="lblname" runat="server" Text=""></asp:Label><i class="caret"></i></span><img src="images/me.jpg" /></a>
                            <ul class="dropdown-menu " role="menu">
                                <li><a href="Login.aspx"><i class="fa fa-user"></i>Log Out</a></li>
                                
                            </ul>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
                <div class="clearfix">
                </div>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">

                            <li>
                                <a href="AdminPage.aspx" class=" hvr-bounce-to-right"><i class="fa fa-dashboard nav_icon "></i><span class="nav-label">Dashboards</span> </a>
                            </li>

                            <li>
                                <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-indent nav_icon"></i><span class="nav-label">Logistics</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="LogisticList.aspx" class=" hvr-bounce-to-right"><i class="fa fa-area-chart nav_icon"></i>Logistic List</a></li>

                                    <li><a href="AddLogistic.aspx" class=" hvr-bounce-to-right"><i class="fa fa-map-marker nav_icon"></i>Add Logistic</a></li>

                                    <li><a href="#" class=" hvr-bounce-to-right"><i class="fa fa-file-text-o nav_icon"></i>Typography</a></li>

                                </ul>
                            </li>
                           <li>
                                <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-indent nav_icon"></i><span class="nav-label">Retailer</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="RetailerList.aspx" class=" hvr-bounce-to-right"><i class="fa fa-th nav_icon"></i>Retailer List</a></li>

                                    <li><a href="AddRetailerInfo.aspx" class=" hvr-bounce-to-right"><i class="fa fa-map-marker nav_icon"></i>Add Retailer</a></li>

                                    <li><a href="#" class=" hvr-bounce-to-right"><i class="fa fa-file-text-o nav_icon"></i>Typography</a></li>

                                </ul>
                            </li>
                            <li>
                                <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-desktop nav_icon"></i><span class="nav-label">Products</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="ProductList.aspx" class=" hvr-bounce-to-right"><i class="fa fa-info-circle nav_icon"></i>Product List</a></li>
                                    <li><a href="AddProduct.aspx" class=" hvr-bounce-to-right"><i class="fa fa-question-circle nav_icon"></i>Add Product</a></li>
                                    <li><a href="AddProductImage.aspx" class=" hvr-bounce-to-right"><i class="fa fa-file-o nav_icon"></i>Add Product Image</a></li>
                                </ul>
                            </li>
                            
                        </ul>
                    </div>
                </div>
        </nav>
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="content-main">

                <!--banner-->
                <div class="banner">

                    <h2>
                        <a href="#">Home</a>
                        <i class="fa fa-angle-right"></i>
                        <span>Retailer's List</span>
                    </h2>
                </div>
                <!--//banner-->
                <!--content-->
                <!---->
                	<form runat="server" class="form-horizontal">
                <div class="blank">


                    <div class="blank-page">
                      
                        <asp:GridView ID="gv_ProductList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" ForeColor="#003366" Text='<%#Eval("pid") %>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" ForeColor="#003366" Text='<%#Eval("HeaderTitle") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            
                                <asp:TemplateField HeaderText="Selling Price">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" ForeColor="#003366" Text='<%#Eval("SellingPrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cost Price">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" ForeColor="#003366" Text='<%#Eval("CostPrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonProd" runat="server"  CommandArgument='<%#Eval("pid") %>' OnClick="LinkButtonProd_Click">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </div>
                </div>
                </form>
                <!--//content-->



                <!---->
                <div class="copy">
                    <p>&copy; 2017 Villagers. All Rights Reserved | </a> </p>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!---->
    <!--scrolling js-->
    <script src="js2/jquery.nicescroll.js"></script>
    <script src="js2/scripts.js"></script>
    <!--//scrolling js-->
    <script src="js2/bootstrap.min.js"> </script>


</body>
</html>
