<%@ Page Title="" Language="C#" MasterPageFile="~/SAdminPanel.master" AutoEventWireup="true" CodeFile="RetailerRegister.aspx.cs" Inherits="RetailerRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
   

      <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

       <script type="text/javascript">
           function f() {
               toastr.error('Error occured Info cannot be viewd try later !');
           }
    </script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
                        <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>

        <asp:UpdatePanel ID="updatepnl" runat="server">
<ContentTemplate>

    <asp:Panel ID="pnlRequestOTP" runat="server">
    	<!-- sign up-page -->
	<div class="login-page ">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1" style="font-size: 2em;">Create your account</h3>  
			<div class="login-body send-otp">
				
                <%--<asp:TextBox ID="txtName" class="user" placeholder="Enter your Name" runat="server"></asp:TextBox> --%>
                <%--<asp:TextBox ID="txtEmail" runat="server" class="user" placeholder="Enter your email"></asp:TextBox>--%>
                <asp:TextBox ID="txtNumber" runat="server" class="lock" placeholder="Mobile No" TextMode="Number"></asp:TextBox>
                <asp:Button ID="btnSubmit" CssClass="btn-primary" OnClick="btnSubmit_Click" runat="server"  Text="Send OTP" />
			    <asp:Button ID="lbtnReSendOTP" CssClass="btn-primary" OnClick="lbtnReSendOTP_Click" runat="server"  Text="Resend OTP" />
                <%--<asp:LinkButton ID="lbtnReSendOTP" runat="server" OnClick="lbtnReSendOTP_Click" >Resend OTP</asp:LinkButton>--%>
				
			</div>  
			
		</div>
	</div>
	<!-- //sign up-page --> 
   </asp:Panel>
    <asp:Panel ID="pnlRegisterInfo" runat="server">
     <div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1" style="font-size: 2em;">Registration Form</h3>  
			<div class="login-body my-reatailer-regis">
			    <form autocomplete="off">
                   
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" id="txtname" runat="server" placeholder="Enter Full Name">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="email" placeholder="Enter Your Email" runat="server" id="txtemail">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="password" placeholder="Enter Your Password" id="txtpassword" runat="server">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" placeholder="Enter State" id="txtstate" runat="server">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" placeholder="Enter City" id="txtcity"  runat="server">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="number" placeholder="Pincode" id="txtpincode" runat="server">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" placeholder="Enter Landmark" id="txtlandmark" runat="server">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" placeholder="Enter Address" id="txtaddress" runat="server">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" placeholder="Referal Id If Any" id="txtreferal" runat="server">
			            </div>
			        </div>
                    <div class="form-group row">
			            <div class="col-sm-12"><legend class="col-form-legend">Choose UserType</legend></div>
			            <div class="col-sm-12">

                            <asp:RadioButtonList ID="rbbtnUserType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Premium</asp:ListItem>
                                <asp:ListItem>Free</asp:ListItem>
                            </asp:RadioButtonList>

                    </div>

			        <div class="form-group row">
			            <div class="col-10">
			                
                            <asp:Button ID="btnRegisterInfo" runat="server" Text="Register" OnClick="btnRegisterInfo_Click" class="btn btn-primary" />
			            </div>
			        </div>
			    </form>
            </div>
        </div>
    </div>
        </asp:Panel>

    </ContentTemplate>
            </asp:UpdatePanel>


</asp:Content>

