<%@ Page Title="Login" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
        
                        <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>

    
    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>


            <!-- login-page -->
            <div class="login-page">
                <div class="container">
                    <h3 class="w3ls-title w3ls-title1">Login to your account</h3>
                    <div class="login-body">
                        <%--	<form runat="server">--%>
                        <input type="text" runat="server" class="user" id="txtUName" name="email" placeholder="Enter Your UserID" required="" />
                        <input type="password" runat="server" id="txtPwd" name="password" class="lock" placeholder="Password" required="" />
                        <asp:Button ID="btnLogin" CssClass="btn-primary" runat="server"  OnClick="btnLogin_Click" OnClientClick="return loginCred(this)"/>

                        <div class="forgot-grid">
                            <%--<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Remember me</label>
						<div class="forgot">
							<a href="#">Forgot Password?</a>
						</div>--%>
                            <div class="clearfix"></div>
                        </div>
                        <%--</form>--%>
                    </div>
                    <h6>Not a Member? <a id="registerasp" href="Register.aspx">Sign Up Now »</a> </h6>
                    <div class="login-page-bottom social-icons">
                        <h5>Recover your social account</h5>
                        <ul>
                            <li><a href="#" class="fa fa-facebook icon facebook"></a></li>
                            <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
                            <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
                            <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                            <li><a href="#" class="fa fa-rss icon rss"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- //login-page -->
	            <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js" ></script>
	            <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
                <script src="/js2/sidscript.js"></script>
           <script>
               $(document).ready(function () {
                   $('form').attr('id', 'loginForm');

               })
           </script>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

