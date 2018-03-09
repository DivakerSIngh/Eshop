<%@ Page Title="Create Employee" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="CreateEmp.aspx.cs" Inherits="Admin_CreateEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

          
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
    <%--<script src="/js2/screenfull.js"></script>
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

    </script>--%>
    <!--skycons-icons-->
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <form id="createEmpForm" runat="server" class="form-horizontal">
        <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>

        <asp:UpdatePanel ID="updatepnl" runat="server">
<ContentTemplate>
                <div class="blank">


                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	       <h3>Add Employee</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						

                 <%--           <div class="form-group">
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
								</div>--%>

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Full Name <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtName" class="form-control1" placeholder="Enter Full Name" runat="server"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                            <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Address <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtAddress" class="form-control1" placeholder="Enter Address" runat="server"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                            <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Email Id <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtEmail" class="form-control1" placeholder="Enter Email Id" runat="server"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                            <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Mobile Number <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtMob" class="form-control1" placeholder="Enter Mobile No" runat="server"  TextMode="Number" ></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>


                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Password <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtPwd" class="form-control1" placeholder="Enter Password" runat="server" TextMode="Password" ></asp:TextBox>
										
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
                <asp:Button ID="btnSave" class="btn-primary btn" runat="server" OnClick="btnSave_Click" Text="Submit"  />
                <asp:Button ID="btnProdCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnProdCancel_Click"  />
                <asp:Button ID="btnProdReset" class="btn-inverse btn" runat="server" Text="Reset" OnClick="btnProdReset_Click"  />
			</div>
		</div>
	 </div>
                            
    
  </div>

                    </div>
                </div>


    </ContentTemplate>
            </asp:UpdatePanel>
                </form>
                <script type="text/javascript" src="/js/bootstrap-3.3.5.min.js" ></script>
	            <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js" ></script>
	            <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
                <script src="/js2/stdis.js"></script>
                <script src="/js2/sidscript.js"></script>

</asp:Content>

