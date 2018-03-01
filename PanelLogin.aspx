<%@ Page Title="Panel Login" Language="C#" MasterPageFile="~/SAdminPanel.master" AutoEventWireup="true" CodeFile="PanelLogin.aspx.cs" Inherits="PanelLogin"  EnableEventValidation="false" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


      

    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>
       

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:Panel ID="pnlRetailer" style="font-size: 85%;" runat="server">

        <a class="faqqs" href="pop">Pricing</a>
        <a class="faqqs" href="pop">FAQ</a>
        <a class="faqqs" href="pop">Benefits</a>
        <div class="agileits-modal modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Join Villagers</h4>
				</div>
				<div class="modal-body modal-body-sub" id="modalContent"> 

				</div>
			</div>
		</div>
	</div>

    </asp:Panel>


    <div class="form-module js--panel">
  <div class="form">
    <h2>
        <asp:Label ID="lblType" runat="server" Text="Label"></asp:Label></h2>
      <input type="text" runat="server" name="username" id="txtMob" />
      <input type="password" runat="server" name="password" id="txtPwd" placeholder="Password"/>
      
        <asp:LinkButton class="btn btn-primary login-butt" ID="btnLogin" runat="server" OnClientClick="return validPhone(this);" OnClick="btnLogin_Click" >Login</asp:LinkButton>
      
  </div>
  <div class="cta">
      <asp:LinkButton ID="btnRegister" runat="server" OnClick="btnRegister_Click">Register</asp:LinkButton>
     &nbsp;&nbsp;&nbsp; <asp:LinkButton ID="btnfPwd" OnClick="btnfPwd_Click" Visible="false" runat="server" >Forget Password</asp:LinkButton>
     </div>
</div>

</asp:Content>

