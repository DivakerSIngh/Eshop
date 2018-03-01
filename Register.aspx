<%@ Page Title="Register" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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
	<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">Create your account</h3>  
			<div class="login-body send-otp">
				
                <%--<asp:TextBox ID="txtName" class="user" placeholder="Enter your Name" runat="server"></asp:TextBox> --%>
                <%--<asp:TextBox ID="txtEmail" runat="server" class="user" placeholder="Enter your email"></asp:TextBox>--%>
                <asp:TextBox ID="txtNumber" runat="server" class="lock" placeholder="Mobile No" TextMode="Number" onkeydown="return ccc(event);"></asp:TextBox>
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" OnClientClick="return valiPhoneOtp(this);" runat="server"  Text="Send OTP" />
                <asp:LinkButton ID="lbtnReSendOTP" CssClass="btn btn-primary" runat="server" OnClientClick="return resend(this);" OnClick="lbtnReSendOTP_Click">Resend OTP</asp:LinkButton>
				
			</div>  
			<script>
			    $(document).ready(function () {
			        $('form').attr('id', 'userRegisMob');

			    })
			</script>
		</div>
	</div>
	<!-- //sign up-page --> 
   </asp:Panel>
    <asp:Panel ID="pnlRegisterInfo" runat="server">
     <div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">Registration Form</h3>  
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
			                <input class="form-control" type="number" placeholder="Pincode" id="txtpincode" onkeyup="return addpin();" runat="server">
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" placeholder="Enter State" id="txtstate" runat="server" disabled>
			            </div>
			        </div>
			        <div class="form-group row">
			            <div class="col-10">
			                <input class="form-control" type="text" placeholder="Enter City" id="txtcity"  runat="server">
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
                               <div class="col-sm-12"><legend class="col-form-legend">Gender</legend></div>
			            <div class="col-sm-12 meraHai">
                            <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem class="radio-inline">Male</asp:ListItem>
                                <asp:ListItem class="radio-inline">Female</asp:ListItem>
                            </asp:RadioButtonList>

			            </div>
			        </div>
             




                    <div class="form-group row">
			            <div class="col-sm-12"><legend class="col-form-legend">Choose UserType</legend></div>
			            <div class="col-sm-12 meraHai" >

                            <asp:RadioButtonList ID="rbbtnUserType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbbtnUserType_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem class="radio-inline">Premium</asp:ListItem>
                                <asp:ListItem class="radio-inline">Free</asp:ListItem>
                            </asp:RadioButtonList>
                            </div>

                    </div>

                        <asp:Panel ID="pnlPreUserInfo" runat="server">

                               <div class="form-group row">
			            <div class="col-sm-12">
                            <legend class="col-form-legend">Select Your T-shirt size</legend>
                        </div>
                        <div class="col-sm-12 ">
                            <asp:DropDownList ID="ddlSize" runat="server" style="outline:none;padding: 6px;width: 30%;">

                                <asp:ListItem Text="Small" Value="S"></asp:ListItem>
                            <asp:ListItem Text="Medium" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Large" Value="L"></asp:ListItem>

                            </asp:DropDownList>

			            </div>
			        </div>
             

                        </asp:Panel>


                             
             

			        <div class="form-group row">
			            <div class="col-10">
			                
                            <asp:Button ID="btnRegisterInfo" runat="server" Text="Register" OnClick="btnRegisterInfo_Click" OnClientClick="return vali(this);" class="btn btn-primary" />
			            </div>
			        </div>
			    </form>
            </div>
        </div>
    </div>
        </asp:Panel>

    </ContentTemplate>
            </asp:UpdatePanel>
	            <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js" ></script>
	            <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
                <script src="/js2/stdis.js"></script>
                <script src="/js2/sidscript.js"></script>
</asp:Content>

