<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddRetailerInfo.aspx.cs" Inherits="AddRetailerInfo" %>

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



                                </ul>
                            </li>
 <li>
                                <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-th nav_icon"></i><span class="nav-label">Retailer</span><span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li><a href="RetailerList.aspx" class=" hvr-bounce-to-right"><i class="fa fa-area-chart nav_icon"></i>Retailer List</a></li>

                                    <li><a href="AddRetailerInfo.aspx" class=" hvr-bounce-to-right"><i class="fa fa-map-marker nav_icon"></i>Add Retailer</a></li>



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
                        <span>Add Retailer Info</span>
                    </h2>
                </div>
                <!--//banner-->
                <!--content-->
                <!---->
	<form runat="server" class="form-horizontal">
                <div class="blank">


                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	       <h3>Retailer Information</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Name <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtRName" class="form-control1" placeholder="Enter Tile" runat="server"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Address <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtRAddress" class="form-control1" placeholder="Enter Address" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Mobile No. <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtRMob" class="form-control1" placeholder="Enter Mobile Number" runat="server" TextMode="Number"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>



                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Email Address <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                <div class="input-group">							
								
									
								
                                        	<span class="input-group-addon">
										<i class="fa fa-envelope-o"></i>
									</span>
                                    <asp:TextBox ID="txtREmail" class="form-control1" placeholder="Email Address" runat="server"></asp:TextBox>
								</div>		
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>


                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Description <asp:Label ID="Label6" runat="server" Text="*" ForeColor="White" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtRDescription" class="form-control1" placeholder="Enter Logistic Description" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                
                            


                                <div class="row show-grid">
			  <div class="col-md-6">
                  
                  
                  
			  </div>
			  <div class="col-md-6">
                  
                   
              </div>
			</div>


							
						</div>
					</div>
					
      <div class="panel-footer">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
                <asp:Button ID="btnRetSubmit" class="btn-primary btn" runat="server" Text="Submit" OnClick="btnRetSubmit_Click"  />
                <asp:Button ID="btnRetCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnRetCancel_Click"  />
                <asp:Button ID="btnRetReset" class="btn-inverse btn" runat="server" Text="Reset" OnClick="btnRetReset_Click"  />
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
