<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/WalletAccount.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

    <script type="text/javascript">
        function f() {
            toastr.error('Error occured Info cannot be viewd try later !');
        }
    </script>
    <style>


        label {
            text-align: right;
            margin-top: 3px;
        }

        .teal-text, a.teal-text:hover {
            color: #008080;
            margin-right: 25px;
        }

        a.btn-primary:first-child {
            margin-right: 10px;
        }

        .red-text, a.red-text:hover {
            color: #ed5249;
        }

        p.form-control-static {
            padding-top: 0;
            padding-bottom: 0;
            text-align: left;
        }

        @media(max-width:1048px) {
            div.form-group div:nth-child(3) {
                padding-left: 0;
                padding-right: 0;
            }
        }

        @media(max-width:870px) {
            .col-xs-3 {
                font-size: 85%;
                margin-top: 6px;
            }

            span {
                font-size: 85%;
            }

            input.form-control, a.btn, input.btn {
                font-size: 78%;
            }

            div.form-group div.col-xs-2:nth-child(3) {
                padding-top: 7px;
                font-size: 85%;
            }

            div.form-group div.col-xs-4:nth-child(3) {
                padding-top: 2px;
                font-size: 85%;
            }
        }

        @media(max-width:832px) {
            .col-xs-3 {
                padding-left: 0;
                padding-right: 0;
            }

            a.btn-primary:first-child {
                margin-right: 0;
            }
        }

        @media(max-width:706px) {
            div.form-group div.col-xs-4:nth-child(3) {
                width: 40%;
            }

            input.btn {
                font-size: 63%;
            }
        }

        @media(max-width:675px) {
            .my-border, div.details-acc {
                width: 70%;
                margin-left: 15%;
                position: relative;
            }

            .my-border {
                border: 1px solid #ddd;
            }

            div.details-acc {
                padding-left: 0;
                padding-right: 0;
            }

            .info-panel .box {
                width: 24%;
                margin-left: 38%;
                padding-top: 20px;
            }

            .info-panel {
                font-size: 1.3em;
            }

            .table-container {
                margin-left: 0;
                margin-right: 0;
            }
        }

        @media(max-width:636px) {
            .my-border, div.details-acc {
                width: 80%;
                margin-left: 10%;
            }
        }

        @media(max-width:559px) {
            .my-border, div.details-acc {
                width: 90%;
                margin-left: 5%;
            }
        }

        @media(max-width:499px) {
            .col-xs-3 {
                font-size: 69%;
                margin-top: 8px;
            }

            input.form-control, a.btn, input.btn {
                font-size: 65%;
            }

            span {
                font-size: 71%;
            }

            div.form-group div.col-xs-2:nth-child(3) {
                padding-top: 7px;
                font-size: 78%;
            }

            ul li:nth-child(4) {
                font-size: .6em;
            }

            .my-border, div.details-acc {
                width: 98%;
                margin-left: 0;
            }

            .row {
                margin-left: 0;
            }

            .container {
                padding-left: 0;
                padding-right: 0;
            }

            .form-horizontal .form-group {
                margin-right: -15px;
                margin-left: 17px;
            }

            div.form-group div.col-xs-4:nth-child(3) {
                width: 70%;
                margin-left: 19%;
                margin-top: 2%;
            }

            .col-xs-3 {
                width: 31%;
            }

            .col-xs-4 {
                width: 43.333333%;
            }

            .col-xs-offset-2 {
                margin-left: 25.666667%;
            }
        }
        .tooltip-inner{
    color: white;
    background-color: red;
}

.tooltip.top .tooltip-arrow{
    border-top-color: red;
}

.error,.login-page input.error {
    border-color: red;
  animation: shake 0.82s cubic-bezier(.36,.07,.19,.97) both;
  transform: translate3d(0, 0, 0);
  backface-visibility: hidden;
  perspective: 1000px;
}

@keyframes shake {
  10%, 90% {
    transform: translate3d(-1px, 0, 0);
  }
  
  20%, 80% {
    transform: translate3d(2px, 0, 0);
  }

  30%, 50%, 70% {
    transform: translate3d(-4px, 0, 0);
  }

  40%, 60% {
    transform: translate3d(4px, 0, 0);
  }
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>



            <div class="panel-acc">
                <div class="col-sm-10 table-container">
                    <div class="summary">
                        <h2>User Profile</h2>
                    </div>
                    <asp:Panel ID="pnlChangePwd" runat="server">

                        <div class="form-horizontal" style="margin-top: 4%">
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">Old Password</label>
                                <div class="col-xs-4">
                                    <asp:TextBox Style="outline: none" ID="txtOldPwd" class="form-control" TextMode="Password" placeholder="Old Password" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 col-form-label">New Password</label>
                                <div class="col-xs-4"> 
                                    <asp:TextBox ID="txtNewPwd" Style="outline: none" runat="server" TextMode="Password" class="form-control" placeholder="New Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-offset-2 col-xs-6">
                                    <asp:LinkButton ID="btnChangePwd" Style="outline: none" runat="server" Text="Change Password" class="btn btn-primary" OnClientClick="return updatePass(this);" OnClick="btnChangePwd_Click" />
                                </div>
                            </div>


                        </div>
                        <div class="form-horizontal" style="margin-top: 4%">
                        <div class="form-group">
                                <label class="col-xs-3 col-form-label">Upload Image</label>
                            <div class="col-xs-4"> 
                        <asp:FileUpload ID="fupdp" runat="server" />
                        </div>
                            </div>
                        <div class="form-group">
                                <div class="col-xs-offset-2 col-xs-6">
                                    <asp:LinkButton ID="btnupdateDp" Style="outline: none;" runat="server" Text="Save" class="btn btn-primary" OnClick="btnupdateDp_Click" />
                                    </div>
                            </div>
                            </div>

                        <div class="form-horizontal" style="margin-top: 4%">
                        <div class="form-group">
                                <label class="col-xs-3 col-form-label">Upload Adhar Card</label>
                            <div class="col-xs-4"> 
                        <asp:FileUpload ID="fupAdhar" runat="server" />
                        </div>
                            </div>
                        <div class="form-group">
                                <div class="col-xs-offset-2 col-xs-6">
                                    <asp:LinkButton ID="btnAdhar" Style="outline: none;" runat="server" Text="Save" class="btn btn-primary" OnClick="btnAdhar_Click" />
                                    </div>
                            </div>
                            </div>

                    </asp:Panel>

                    <asp:Panel ID="pnlUserProfile" runat="server">
                        <div class="form-horizontal" id="userProfile">
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">Gender</label>
                                <div class="col-xs-4">
                                    <p class="form-control-static">
                                        <asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label></p>
                                </div>
                                <%--<div class="col-sm-2">
                                          <a class="teal-text"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-sm-2">
                                          <a class="red-text"><i class="fa fa-times"></i></a>
                                        </div>--%>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">Mobile</label>
                                <div class="col-xs-4">
                                    <p class="form-control-static">
                                        <asp:Label ID="lblMobile" runat="server" Text="Label"></asp:Label></p>
                                </div>
                                <div class="col-xs-2">
                                    <asp:LinkButton ID="lbtnUpdateMobile" CssClass="teal-text" runat="server" OnClientClick="return ccc();" OnClick="lbtnUpdateMobile_Click"><i class="fa fa-pencil"></i></asp:LinkButton>
                                    <asp:LinkButton class="red-text" ID="lbtnCancelUpdate" runat="server" OnClick="lbtnCancelUpdate_Click"><i class="fa fa-times"></i></asp:LinkButton>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Panel ID="pnlUpdateMobile" runat="server">

                                    <label class="col-xs-3 col-form-label">Enter New Mobile</label>
                                    <div class="col-xs-4">
                                        <asp:TextBox ID="txtNewMobile" CssClass="form-control" runat="server" placeholder="New Mobile Number" onkeydown="return ccc(event);"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-4">
                                        <asp:LinkButton ID="btnUpdate1" runat="server" class="btn btn-primary" OnClick="btnUpdate_Click" OnClientClick="return sendOTP(this);">Send OTP</asp:LinkButton>
                                        <asp:LinkButton ID="btnReSend" runat="server" class="btn btn-primary" OnClick="btnReSend_Click">Resend OTP </asp:LinkButton>
                                    </div>

                                </asp:Panel>

                            </div>
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">Email</label>
                                <div class="col-xs-4">
                                    <p class="form-control-static">
                                        <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></p>
                                </div>
                                <div class="col-xs-2">
                                    <asp:LinkButton ID="btnUpDateEmail" runat="server" CssClass="teal-text" OnClick="btnUpDateEmail_Click"><i class="fa fa-pencil"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btnCancelEmail" CssClass="red-text" runat="server" OnClick="btnCancelEmail_Click"><i class="fa fa-times"></i></asp:LinkButton>
                                </div>
                            </div>
                            <div class="form-group row">
                                <asp:Panel ID="pnlEmailUpdate" runat="server">

                                    <label class="col-xs-3 col-form-label">Enter New Email</label>
                                    <div class="col-xs-4">
                                        <asp:TextBox ID="txtNewMail" CssClass="form-control" runat="server" placeholder="New Email"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-4">
                                        <asp:LinkButton ID="btnNewEmail" runat="server" class="btn btn-primary" OnClientClick="return updateEmail(this);" OnClick="btnNewEmail_Click">Update Email </asp:LinkButton>
                                       <%-- <asp:LinkButton ID="btnVerifyEmail" runat="server" class="btn btn-primary" OnClick="btnVerifyEmail_Click">Resend Otp </asp:LinkButton>--%>
                                    </div>
                                    

                                </asp:Panel>

                            </div>

                            <fieldset >
                                <legend>Address Info</legend>

                                  <div class="form-group row">
                                <label class="col-xs-3 col-form-label">Pincode</label>
                                <div class="col-xs-4">
                                    <p class="form-control-static">
                                        
                                    <asp:TextBox ID="lblPincode" class="form-control" runat="server"></asp:TextBox></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">City</label>
                                <div class="col-xs-4">
                                    <p class="form-control-static">
                                        
                                    <asp:TextBox ID="lblCity" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">State</label>
                                <div class="col-xs-4">
                                    <p class="form-control-static">
                                        
                                    <asp:TextBox ID="lblState" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">UAddress</label>
                                <div class="col-xs-4">
                                    <p class="form-control-static">
                                        
                                    <asp:TextBox ID="lblUAddress" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-3 col-form-label">LandMark</label>
                                <div class="col-xs-4">
                                   <p class="form-control-static">
                                        
                                    <asp:TextBox ID="lblLandmark" class="form-control" runat="server"></asp:TextBox>
                                </div>

                           </div>

                                <br />

                                  <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-primary" OnClick="LinkButton1_Click" >Update Address </asp:LinkButton>


                            </fieldset>
                          
                        </div>
                    </asp:Panel>
                

                </div>
            </div>
            
            <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js" ></script>
	        <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
            <script>
                $(document).ready(function () {
                    $('form').attr('id', 'userProf');
                });
            </script>
            <script type="text/javascript" src="/js2/sidscript.js"></script>
            
        </ContentTemplate>

        <Triggers>
        <asp:PostBackTrigger ControlID = "btnupdateDp" />
            
            <asp:PostBackTrigger ControlID = "btnAdhar" />
    </Triggers>

    </asp:UpdatePanel>




</asp:Content>


<%--for applying validation on one field--%>

<%--$('#find-addresses').on('click', function(){
    $('[name="Postcode"]').rules('add', { 
        required: true,
        email: true
    });
    $('#Other_Form_Fields').rules('remove');        
    $('#request-brochure-form').valid();  // trigger the validation & do NOT submit        
});--%> 