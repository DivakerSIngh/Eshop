<%@ Page Title="Retailer Info" Language="C#" MasterPageFile="~/Retailor/RetailorPanel.master" AutoEventWireup="true" CodeFile="AddRetailorInfo.aspx.cs" Inherits="Retailor_AddRetailorInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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
    <!--skycons-icons-->
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!--content-->
    <!---->


    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="updatepnl" runat="server">
        <ContentTemplate>
            <form class="form-horizontal">
                <div class="blank">


                    <div class="blank-page">

                        <div class="grid-form1">
                            <h3>Retailer Information</h3>
                            <div class="tab-content">
                                <div class="tab-pane active" id="horizontal-form">


                                    <fieldset class="ret-info">
                                        <legend>Contact Information</legend>
                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Name
                                                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtRName" class="form-control1" placeholder="Your Name" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Gender<asp:Label ID="Label23" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">

                                                <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:RadioButtonList>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Email Address
                                                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <div class="input-group">



                                                    <span class="input-group-addon">
                                                        <i class="fa fa-envelope-o"></i>
                                                    </span>
                                                    <asp:TextBox ID="txtREmail" class="form-control1" placeholder="Your Email" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Mobile
                                                <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtMobile" class="form-control1" placeholder="Your Mobile No" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group" style="display: none;">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">City
                                                <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtCity" class="form-control1" placeholder="Enter City" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Pincode
                                                <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtPincode" class="form-control1" placeholder="Enter Pincode" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">State
                                                <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtStates" class="form-control1" placeholder="Enter State" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">District
                                                <asp:Label ID="Label14" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtDistricts" class="form-control1" placeholder="Enter District" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Landmark
                                                <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtlandmark" class="form-control1" placeholder="Enter Landmark" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Address
                                                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtRAddress" class="form-control1" placeholder="Enter Address" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>
                                    </fieldset>


                                    <fieldset class="ret-info2">
                                        <legend>Organisation Detail</legend>
                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Retailer Category
                                                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:CheckBoxList ID="cbRCategory" CssClass="cbRcat" runat="server" RepeatDirection="Horizontal">

                                                    <asp:ListItem>LifeStyle</asp:ListItem>
                                                    <asp:ListItem>Agriculture</asp:ListItem>
                                                    <asp:ListItem>Grocery</asp:ListItem>
                                                    <asp:ListItem>All</asp:ListItem>
                                                </asp:CheckBoxList>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Retailer Type<asp:Label ID="Label20" runat="server" Text="*" ForeColor="Red" /></label>
                                                
                                            <div class="col-sm-8">

                                                <asp:DropDownList ID="ddlRType" CssClass="mySelect" runat="server">
                                                    <asp:ListItem>Select</asp:ListItem>
                                                    <asp:ListItem>Rural</asp:ListItem>
                                                    <asp:ListItem>Urban</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Organisation Name
                                                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtOrgName" class="form-control1" placeholder="Enter Organisation Name" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Organisation Registration number
                                                <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtOrgRegNum" class="form-control1" placeholder="Enter Registration number" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">VAT number </label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtTINNum12" class="form-control1" placeholder="Enter VAT" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                         <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">GST Number
                                                <asp:Label ID="Label25" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtGST" class="form-control1" placeholder="GST Number" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>
                                          <div class="form-group">
                                              
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Org Pan Number
                                                <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtOrgPan" class="form-control1" placeholder="Pan Number" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Org Registration
                                                <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox Visible="false" ID="txtServiceNum" class="form-control1" placeholder="Enter Service Tax Number" runat="server"></asp:TextBox>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />

                                            </div>
                                          
                                            <br />
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">GST certificate
                                                <asp:Label ID="Labelgst" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">

                                                <asp:FileUpload ID="FileUpload2" runat="server" />

                                            </div>
                                            <br />
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">PAN card
                                                <asp:Label ID="Labpanel9" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">

                                                <asp:FileUpload ID="FileUpload3" runat="server" />

                                            </div>
                                            <br />
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">ADhar card
                                                <asp:Label ID="Labeladha26" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">

                                                <asp:FileUpload ID="FileUpload4" runat="server" />

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                           
                                           
                                        </div>

 <p style="color:blue;">Note : File size can be of 2MB maximum and only .jpg,.jpge,.png,.pdf are allowed.</p>
                                       

                                    </fieldset>

                                    <fieldset class="ret-info2">
                                        <legend>Account Details</legend>
                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Account Number
                                                <asp:Label ID="Label16" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtAccNum" class="form-control1" placeholder="Enter Account Number" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Account Holder Name
                                                <asp:Label ID="Label21" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtAHolderName" class="form-control1" placeholder="Enter Account Hoder Name" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">IFSC Code
                                                <asp:Label ID="Label17" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtIFSCcode" class="form-control1" placeholder="Enter IFSC code" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Bank Name
                                                <asp:Label ID="Label18" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtBankName" class="form-control1" placeholder="Enter Bank Name" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">PAN
                                                <asp:Label ID="Label19" runat="server" Text="*" ForeColor="Red" /></label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtPAN" class="form-control1" placeholder="Enter PAN Number" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                        <div class="form-group" >
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Referral Id</label>
                                                
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtReferralId" class="form-control1" placeholder="Enter Referral Id" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>



                                        <div class="form-group" >
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Retailer Type </label>
                                            <div class="col-sm-8">

                                                <asp:RadioButtonList ID="rbratailertype" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbratailertype_SelectedIndexChanged1" AutoPostBack="true">
                                                    <asp:ListItem>Premium</asp:ListItem>
                                                    <asp:ListItem>Normal</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>
                                        <asp:Panel ID="pnlRetailerSize" runat="server">
                                            <div class="form-group">
                                                <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Size<asp:Label ID="Label24" runat="server" Text="*" ForeColor="Red" /></label>
                                                <div class="col-sm-8">


                                                    <asp:DropDownList ID="ddlSize" runat="server">

                                                        <asp:ListItem Text="Small" Value="S"></asp:ListItem>
                                                        <asp:ListItem Text="Medium" Value="M"></asp:ListItem>
                                                        <asp:ListItem Text="Large" Value="L"></asp:ListItem>

                                                    </asp:DropDownList>

                                                </div>
                                                <div class="col-sm-2" style="display: none;">
                                                    <p class="help-block">Your help text!</p>
                                                </div>
                                            </div>

                                        </asp:Panel>

                                    </fieldset>
                                </div>
                            </div>

                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <asp:Button ID="btnRetSubmit" class="btn-primary btn" runat="server" Text="Submit" OnClick="btnRetSubmit_Click" />
                                        <asp:Button ID="btnRetCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnRetCancel_Click" />
                                        <asp:Button ID="btnRetReset" class="btn-inverse btn" runat="server" Text="Reset" OnClick="btnRetReset_Click" />
                                    </div>
                                </div>
                            </div>
                           
                              
                        </div>

                    </div>
                </div>
            </form>


            <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js"></script>
            <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
            <script src="/js2/stdis.js"></script>
            <script src="/js2/sidscript.js"></script>
        </ContentTemplate>
        <Triggers>
        <asp:PostBackTrigger ControlID = "btnRetSubmit" />
    </Triggers>
    </asp:UpdatePanel>


    <!--//content-->


</asp:Content>

