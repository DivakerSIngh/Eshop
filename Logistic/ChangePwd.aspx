<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Logistic/LogisticPanel.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="Logistic_ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
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

        <!--content-->
                <!---->
                	<form runat="server" class="form-horizontal">

                        <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>

        <asp:UpdatePanel ID="updatepnl" runat="server">
<ContentTemplate>


                <div class="blank">


                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	       <h3>Logistic Information</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Enter Old Password <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtOldPwd" class="form-control1" placeholder="Enter Tile" runat="server" TextMode="Password"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Enter New Password <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtNewPwd" class="form-control1" placeholder="Enter Tile" runat="server" TextMode="Password"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Confirm Password <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtCNewPwd" class="form-control1" placeholder="Enter Tile" runat="server" TextMode="Password"></asp:TextBox>
										
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
                <asp:Button ID="btnLogSubmit" class="btn-primary btn" runat="server" Text="Submit" OnClick="btnLogSubmit_Click" />
                <asp:Button ID="btnLogCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnLogCancel_Click" />
                <asp:Button ID="btnLogReset" class="btn-inverse btn" runat="server" Text="Reset" OnClick="btnLogReset_Click" />
			</div>
		</div>
	 </div>
                            
    
  </div>

                    </div>
                </div>


    </ContentTemplate>
            </asp:UpdatePanel>

                </form>
                <!--//content-->


</asp:Content>

