<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" Title="Add Product" %>

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
                                <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-th nav_icon"></i><span class="nav-label">Retailer</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="RetailerList.aspx" class=" hvr-bounce-to-right"><i class="fa fa-area-chart nav_icon"></i>Retailer List</a></li>

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
                        <span>Add Product Info</span>
                    </h2>
                </div>
                <!--//banner-->
                <!--content-->
                <!---->
	<form runat="server" class="form-horizontal">
                <div class="blank">


                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	       <h3>Product Description</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						

                            <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Choose Retailer <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <table>

                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="ddlRetailer" runat="server"></asp:DropDownList>
                                                </td>
                                                <td style="text-align:left;">
                                                    Choose Category
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCategory" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal" Visible="False">
                                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>

                                            </tr>

                                        </table>

                                        
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Header Title <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtPTitle" class="form-control1" placeholder="Enter Header Tile" runat="server"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                            <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Selling Price <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtPSellingPrice" class="form-control1" placeholder="Enter Selling Price" runat="server" TextMode="Number"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                            <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Cost Price <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtPCostPrice" class="form-control1" placeholder="Enter Cost Price" runat="server" TextMode="Number"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>


                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Product Description <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtPDescription" class="form-control1" placeholder="Enter Description" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Quantity <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtPQuantity" class="form-control1" placeholder="Enter Quantity of Product" runat="server" TextMode="Number"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Measurement <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                       
                                        <asp:RadioButtonList ID="rdbtnMeasurement" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdbtnMeasurement_SelectedIndexChanged">
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                      
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                            



                              <asp:Panel ID="pnlMeasurement" runat="server">

                                            
                                
                                <div class="form-group">
                                    
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Enter Measurement<asp:Label ID="lblmust" runat="server" Text="*" ForeColor="Red" /></label>

									<div class="col-sm-8">
                  <asp:TextBox ID="txtPSize" CssClass="text-primary" runat="server"></asp:TextBox>
										<asp:Button ID="btnPShiftSize" CssClass="btn-primary" runat="server" Text="Add" OnClick="btnPShiftSize_Click" />
                                        
									</div>
									<div class="col-sm-2" >
										<p class="help-block"></p>
									</div>
								</div>

                                
                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Measurement List<asp:Label ID="Label6" runat="server" Text="*" ForeColor="White" /></label>
									
									<div class="col-sm-8">
                                        <asp:ListBox ID="lbPSizeList" CssClass="list-inline" runat="server" Height="150px" Width="667.5px"></asp:ListBox>
										
									</div>
									<div class="col-sm-2" >
										<p class="help-block"><asp:Button ID="btnPRemoveSize" CssClass="btn-primary" runat="server" Text="Remove" OnClick="btnPRemoveSize_Click"  /></p>
									</div>
								</div>


                                        </asp:Panel>
										
                            
                            
                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  Title
                  
			                          </div>
			                    <div class="col-md-6">
                  Value
                   
                                    </div>
			                    </div>


                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle1" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue1" CssClass="text-primary" runat="server" Width="80%" ></asp:TextBox> <asp:ImageButton ID="ImgbtnMore" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore_Click" Height="23px" />
                                    </div>
			                    </div>

                            <asp:Panel ID="pnlAddTitle2" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle2" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue2" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore2" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore2_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel2" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel2_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>

                                      <asp:Panel ID="pnlAddTitle3" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle3" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue3" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore3" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore3_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel3" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel3_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle4" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle4" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue4" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore4" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore4_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel4" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel4_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle5" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle5" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue5" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore5" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore5_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel5" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel5_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle6" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle6" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue6" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore6" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore6_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel6" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel6_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>

                                      <asp:Panel ID="pnlAddTitle7" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle7" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue7" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore7" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore7_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel7" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel7_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle8" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle8" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue8" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore8" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore8_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel8" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel8_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle9" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle9" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue9" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore9" runat="server" ImageUrl="~/images/Add.png" OnClick="ImgbtnMore9_Click" />
                                    <asp:ImageButton ID="ImgbtnCancel9" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel9_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle10" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle10" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue10" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> 
                                    <asp:ImageButton ID="ImgbtnCancel10" runat="server" ImageUrl="~/images/cancel.png" OnClick="ImgbtnCancel10_Click" />
                                    </div>
			                    </div>

                            </asp:Panel>





							
						</div>
					</div>
					
      <div class="panel-footer">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
                <asp:Button ID="btnProdSubmit" class="btn-primary btn" runat="server" Text="Submit" OnClick="btnProdSubmit_Click"  />
                <asp:Button ID="btnProdCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnProdCancel_Click"  />
                <asp:Button ID="btnProdReset" class="btn-inverse btn" runat="server" Text="Reset" OnClick="btnProdReset_Click"  />
			</div>
		</div>
	 </div>
                            
    
  </div>

                    </div>
                </div>
                </form>
                                <!--//content-->



                <!---->
                <div class="copy">
                    <p>&copy; 2017 Villagers. All Rights Reserved | ing js-->
    <script src="js2/jquery.nicescroll.js"></script>
    <script src="js2/scripts.js"></script>
    <!--//scrolling js-->
    <script src="js2/bootstrap.min.js"> </script>


</body>
</html>
