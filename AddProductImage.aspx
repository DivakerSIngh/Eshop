<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProductImage.aspx.cs" Inherits="AddProductImage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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



    <style type="text/css">

        .myGridClass {
  width: 100%;
  /*this will be the color of the odd row*/
  background-color: #fff;
  margin: 5px 0 10px 0;
  border: solid 1px #525252;
  border-collapse:collapse;
}

/*data elements*/
.myGridClass td {
  padding: 2px;
  border: solid 1px #c1c1c1;
  color: #717171;
}

/*header elements*/
.myGridClass th {
  padding: 4px 2px;
  color: #fff;
  background: #424242;
  border-left: solid 1px #525252;
  font-size: 0.9em;
}

/*his will be the color of even row*/
.myGridClass .myAltRowClass { background: #fcfcfc repeat-x top; }

/*and finally, we style the pager on the bottom*/
.myGridClass .myPagerClass { background: #424242; }

.myGridClass .myPagerClass table { margin: 5px 0; }

.myGridClass .myPagerClass td {
  border-width: 0;
  padding: 0 6px;
  border-left: solid 1px #666;
  font-weight: bold;
  color: #fff;
  line-height: 12px;
}

.myGridClass .myPagerClass a { color: #666; text-decoration: none; }

.myGridClass .myPagerClass a:hover { color: #000; text-decoration: none; } 

    </style>



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
                <form runat="server" class="form-horizontal">
                <!--banner-->
                <div class="banner">
                    

                    
                    <h2>
                        <a href="#">Home</a>
                        <i class="fa fa-angle-right"></i>
                        <span> <asp:RadioButtonList ID="rbImage" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbImage_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="A">Add Image</asp:ListItem>
                            <asp:ListItem Value="U">Image Preview</asp:ListItem>
                        </asp:RadioButtonList></span>
                    </h2>

                       
                </div>

              <br />      

                     <div class="banner">
           
                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;width:130px;">Select Retailer <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" /></label>
									
                                        
                                        <table>

                                            <tr>
                                                <td style="width:130px;">
                                                    <asp:DropDownList ID="ddlUPRetailor" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUPRetailor_SelectedIndexChanged" CssClass="dropdown"></asp:DropDownList>
                                                </td >
                                                <td style="width:150px;text-align:center;">
                                                    Select Category<asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" />
                                                </td>
                                                <td style="width:130px;text-align:center;">
                                                    <asp:DropDownList ID="ddlUPCategory" runat="server" CssClass="dropdown" OnSelectedIndexChanged="ddlUPCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                                </td>
                                                <td style="width:130px;text-align:center;">
                                                    Select Product
                                                </td>
                                                <td style="width:130px;text-align:center;">
                                                    <asp:DropDownList ID="ddlProdImage" runat="server" CssClass="dropdown" OnSelectedIndexChanged="ddlProdImage_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                                </td>
                                                <td style="width:170px;text-align:right;">
                                                    <asp:RadioButtonList ID="rbtnGender" runat="server" TextAlign="Right" AutoPostBack="True" OnSelectedIndexChanged="rbtnGender_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>

                                        </table>
										
									
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                       
                </div>

                <!--//banner-->
                <!--content-->
                <!---->
                <asp:Panel ID="pnladd" runat="server">

                    
                <div class="blank">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	       <h3>Add Product&#39;s Image</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						
                            
                              

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;"> Select Images <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        
                                        <telerik:RadUpload ID="fileupload" runat="server" Skin="WebBlue"></telerik:RadUpload>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>
                  		
						</div>
					</div>
					
      <div class="panel-footer">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
                <asp:Button ID="btnProdImgSubmit" class="btn-primary btn" runat="server" Text="Submit" OnClick="btnProdImgSubmit_Click"  />
                <asp:Button ID="btnProdImgCancel" class="btn-default btn" runat="server" Text="Cancel"  />
                <asp:Button ID="btnProdImgReset" class="btn-inverse btn" runat="server" Text="Reset"  />
			</div>
		</div>
	 </div>
                            
    
  </div>

                    </div>
                </div>
                

                </asp:Panel>
                	
                    
                <asp:Panel ID="pnlUpdate" runat="server">
                    <div class="blank">

                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	                            <h3>Product's Image Preview</h3>
  	                                <div class="tab-content">
						            <div class="tab-pane active" id="horizontal-form1">
						
                            

                            <asp:Panel ID="pnlrepeater" runat="server" style="width:100%;">

                                                               
									
									<div style="width:80%;">
                                        
                                        <asp:GridView ID="gv_Images" runat="server"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" OnRowDataBound="gv_Images_RowDataBound" OnRowCommand="gv_Images_RowCommand" CellSpacing="5" Width="100%" BorderStyle="None">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns >
                                                <asp:TemplateField HeaderText="Image Id" >
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblImgId" runat="server" Font-Bold="True" ForeColor="#003366" Text='<%# Eval("pimgid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgProd" runat="server" Height="150px" Width="150px" />
                                                    </ItemTemplate>
                                                    <ItemStyle  />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkDelete" runat="server" Font-Bold="True" ForeColor="#003366"  CommandName="GetId" CommandArgument='<%#Bind("pimgid") %>'>Delete</asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle />
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" HorizontalAlign="Center" Width="100%" />
                                            <EmptyDataRowStyle Width="100%" />
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

									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								


                                    


                            </asp:Panel>

  </div>

                    </div>
                </div>
               
                        </div>

                    </div>
                </asp:Panel>

                 </form>


                <!--//content-->



                <!---->
                <div class="copy">
                    <p>&copy; 2017 Villagers.<a> All Rights Reserved | </a> </p>
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
