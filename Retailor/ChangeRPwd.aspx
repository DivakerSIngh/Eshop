<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Retailor/RetailorPanel.master" AutoEventWireup="true" CodeFile="ChangeRPwd.aspx.cs" Inherits="Retailor_ChangeRPwd" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="form-horizontal">
                <div class="blank">


                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	       <h3>Retailer Information</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						

								<fieldset class="ret-info">
								    <legend>Contact Information</legend>
                                    <div class="form-group">
								        <label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Old Password:</label>
								        <div class="col-sm-8">
								            <asp:TextBox ID="txtOldPwd" placeholder="Old Password" CssClass="form-control1" runat="server"></asp:TextBox>
										
								        </div>
								        <div class="col-sm-2" style="display:none;">
								            <p class="help-block">Your help text!</p>
								        </div>
								    </div>
                                    <div class="form-group">
								        <label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">New Password:</label>
								        <div class="col-sm-8">
								            <asp:TextBox ID="txtNewPwd" placeholder="New Password" CssClass="form-control1" runat="server"></asp:TextBox>		
								        </div>
								        <div class="col-sm-2" style="display:none;">
								            <p class="help-block">Your help text!</p>
								        </div>
								    </div>
                                    <div class="panel-footer">
		                                <div class="row">
			                                <div class="col-sm-8 col-sm-offset-2">
                                                    <asp:Button ID="btnChangePwd" CssClass="btn-primary btn" runat="server" Text="Change Password" OnClick="btnChangePwd_Click" />
                                            </div>
                                        </div>
                                     </div>
                                 </fieldset>
                            </div>
                   </div>
                            </div>
                        </div>
                    </div>
        </div>

</asp:Content>

