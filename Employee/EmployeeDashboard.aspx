<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/EmployeePanel.master" AutoEventWireup="true" CodeFile="EmployeeDashboard.aspx.cs" Inherits="Employee_EmployeeDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css2/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="/css2/style.css" rel='stylesheet' type='text/css' />
    <link href="/css2/font-awesome.css" rel="stylesheet" />
    <script src="/js2/jquery.min.js"> </script>
    <!-- Mainly scripts -->
    <script src="/js2/jquery.metisMenu.js"></script>
    <script src="/js2/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <link href="/css2/custom.css" rel="stylesheet" />
    <script src="/js2/custom.js"></script>
    <script src="/js2/screenfull.js"></script>
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
    <script src="/js2/pie-chart.js" type="text/javascript"></script>
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
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


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
                                                    <asp:DropDownList ID="ddlCategory" runat="server"  AutoPostBack="True"></asp:DropDownList>
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
                                       
                                        <asp:RadioButtonList ID="rdbtnMeasurement" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" >
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
										<asp:Button ID="btnPShiftSize" CssClass="btn-primary" runat="server" Text="Add" />
                                        
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
										<p class="help-block"><asp:Button ID="btnPRemoveSize" CssClass="btn-primary" runat="server" Text="Remove"   /></p>
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
                  
                  <asp:TextBox ID="txtValue1" CssClass="text-primary" runat="server" Width="80%" ></asp:TextBox> <asp:ImageButton ID="ImgbtnMore" runat="server" ImageUrl="~/images/Add.png"  Height="23px" />
                                    </div>
			                    </div>

                            <asp:Panel ID="pnlAddTitle2" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle2" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue2" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore2" runat="server" ImageUrl="~/images/Add.png"  />
                                    <asp:ImageButton ID="ImgbtnCancel2" runat="server" ImageUrl="~/images/cancel.png"  />
                                    </div>
			                    </div>

                            </asp:Panel>

                                      <asp:Panel ID="pnlAddTitle3" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle3" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue3" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore3" runat="server" ImageUrl="~/images/Add.png" />
                                    <asp:ImageButton ID="ImgbtnCancel3" runat="server" ImageUrl="~/images/cancel.png" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle4" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle4" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue4" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore4" runat="server" ImageUrl="~/images/Add.png"  />
                                    <asp:ImageButton ID="ImgbtnCancel4" runat="server" ImageUrl="~/images/cancel.png" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle5" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle5" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue5" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore5" runat="server" ImageUrl="~/images/Add.png" />
                                    <asp:ImageButton ID="ImgbtnCancel5" runat="server" ImageUrl="~/images/cancel.png" />
                                    </div>
			                    </div>

                            </asp:Panel>


                                      <asp:Panel ID="pnlAddTitle6" runat="server">

                                <div class="row show-grid">
                        			  <div class="col-md-6">
                  
                  <asp:TextBox ID="txtTitle6" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                  
			                          </div>
			                    <div class="col-md-6">
                  
                  <asp:TextBox ID="txtValue6" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox> <asp:ImageButton ID="ImgbtnMore6" runat="server" ImageUrl="~/images/Add.png"  />
                                    <asp:ImageButton ID="ImgbtnCancel6" runat="server" ImageUrl="~/images/cancel.png"  />
                                    </div>
			                    </div>

                            </asp:Panel>




							
						</div>
					</div>
					
      <div class="panel-footer">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
                <asp:Button ID="btnProdSubmit" class="btn-primary btn" runat="server" Text="Submit"  />
                <asp:Button ID="btnProdCancel" class="btn-default btn" runat="server" Text="Cancel"   />
                <asp:Button ID="btnProdReset" class="btn-inverse btn" runat="server" Text="Reset"   />
			</div>
		</div>
	 </div>
                            
    
  </div>

                    </div>
                </div>
                </form>
    

</asp:Content>

