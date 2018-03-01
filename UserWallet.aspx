<%@ Page Title="User Wallet" Language="C#" MasterPageFile="~/WalletAccount.master" AutoEventWireup="true" CodeFile="UserWallet.aspx.cs" Inherits="UserWallet" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

    <script type="text/javascript">
        function f() {
            toastr.error('Error occured Info cannot be viewd try later !');
        }
    </script>


    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />



    <link href="css/animate.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/userwallet.css" rel="stylesheet" />
    <link href="css/normalize.css" rel="stylesheet" />
    <link href="css/userwalletqueries.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400" rel="stylesheet" />
    <style>
        #myModal88 .modal-content{
            width: 40%;
            margin-left: 30%;
        }
        #myModal88 p{
            font-size: 20px;
            font-weight: 400;
            color: crimson;
        }
        #myModal88 select{
            width: 40%;
            padding: 8px 2px;
            outline: none;
            font-size: 90%;
        }
        #myModal88 h5{
            color: #000;
        }
        @media(max-width: 1191px){
            #myModal88 .modal-content{
                width: 50%;
                margin-left: 25%;
            }
        }
        @media(max-width: 872px){
            #myModal88 .modal-content{
                width: 60%;
                margin-left: 20%;
            }
        }
        @media(max-width: 651px){
            #myModal88 .modal-content{
                width: 80%;
                margin-left: 10%;
            }
        }
        @media(max-width: 491px){
            #myModal88 .modal-content{
                width: 96%;
                margin-left: 2%;
                font-size: 16px;
            }
            #myModal88 p{
                font-size: 15px;
            }
            #myModal88 h5{
                font-size: .8em;
            }
            #myModal88 select{
                width: 50%;
            }
        }
        @media(max-width: 399px){
            #myModal88 .modal-content{
                width: 100%;
                margin-left:0;
            }
            #myModal88 select {
                width: 54%;
                font-size: 80%;
            }
        }
        @media(max-width: 319px){
            #myModal88 a.close2{
                font-size: .7em
            }
            #myModal88 select {
                width: 60%;
                font-size: 76%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="wallet-buttons">
                    <div class="col-sm-10 bot">
                        <a class="btn btn-primary" id="premium" onclick="modalShow();">Become Premium User</a>
                        <asp:LinkButton ID="btnAddMoney" class="btn btn-primary" runat="server" OnClick="btnAddMoney_Click" >Add Money</asp:LinkButton>
                        <asp:LinkButton ID="btnTransfer" class="btn btn-primary" runat="server" OnClick="btnTransfer_Click" >Transfer</asp:LinkButton>
                        <asp:LinkButton ID="btnReferEarn" class="btn btn-primary" runat="server" OnClick="btnReferEarn_Click" >Refer &amp; Earn</asp:LinkButton>
                        <asp:LinkButton ID="btnPassbook" class="btn btn-primary" runat="server" OnClick="btnPassbook_Click" >Passbook</asp:LinkButton>
                    </div>
                </div>
                <div class="agileits-modal modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88" aria-hidden="true">
		            <div class="modal-dialog" style="margin-top: 180px">
			            <div class="modal-content">
				            <div class="modal-header">
					            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					            <p class="modal-title" id="myModalLabel">Select Your T-shirt size</p>
				            </div>
				            <div class="modal-body modal-body-sub" style="text-align:center"> 
					            <h5 style="font-weight: 500;">Select Size </h5>  
					            <div class="form-group" style="margin-bottom:44px">
                                  <%--  <select style="width:60%;margin-left:20%" class="form-control" id="sel1">
                                        <option value="S">S</option>
                                        <option value="M">M</option>
                                        <option value="L">L</option>
                                        <option value="XL">XL</option>
                                    </select>--%>
                                    <asp:DropDownList ID="ddlsize" runat="server">
                                       <asp:ListItem Text="Small" Value="S"></asp:ListItem>
                                       <asp:ListItem Text="Medium" Value="M"></asp:ListItem>
                                       <asp:ListItem Text="Large" Value="L"></asp:ListItem>
                                    </asp:DropDownList>

					            </div>
                                <asp:LinkButton ID="btnPremiumUser" CssClass="close2" runat="server" OnClick="btnPremiumUser_Click">Go Premium</asp:LinkButton>
					            <%--<a class="close2" data-dismiss="modal" aria-hidden="true" href="#" >Join Now</a>--%>
				            </div>
			            </div>
		            </div>
	            </div>
	<script>
	    $(document).ready(function () {
	        if ($('#lblUType').text() === 'Premium') {
	            $('#premium').remove();
	        }
	    })
	    function modalShow() {
	        $('#myModal88').modal('show');
	    }
	    </script>
    

                <asp:Panel ID="pnlAccount" runat="server">

                    <div class="panel-acc">
                        <div class="col-sm-10 table-container">
                            <div class="summary">
                                <h2>Account Summary</h2>
                            </div>
                            <div class="col-sm-12">
                                <asp:Repeater ID="rptReferEarn" runat="server">

                                    <HeaderTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <h3>Refer &amp; Earn</h3>
                                                </tr>
                                                <tr>
                                                    <th>#</th>
                                                    <th>SenderId</th>
                                                    <th>Receiver Mobile</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            
                                        <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>


                                            <tr>
                                                <th scope="row">
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("SNo") %>'></asp:Label></th>
                                                <td>
                                                    <asp:Label ID="lblSender" runat="server" Text='<%# Eval("Senderuserid") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lblMob" runat="server" Text='<%# Eval("referralmob") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("entrydate") %>'></asp:Label></td>
                                            </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>

                                        <tr>
                                            <td class="view-all" colspan="4">
                                                <asp:LinkButton ID="lbtnViewReferEarn" class="btn btn-primary" runat="server"  OnCommand="lbtnViewReferEarn_Command">View All</asp:LinkButton></td>
                                        </tr>
                                        </tbody>
                            </table>

                                    </FooterTemplate>

                                </asp:Repeater>


                            </div>
                            <div class="col-sm-12">

                                <asp:Repeater ID="rptPassbook" runat="server">

                                    <HeaderTemplate>


                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <h3>Passbook</h3>
                                                </tr>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Credit Amt</th>
                                                    <th>Debit Amt</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        
                                            <tr>
                                                <th scope="row"><asp:Label ID="lblDate" runat="server" Text='<%# Eval("SNo") %>'></asp:Label></th>
                                                <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("Credit_Amt") %>'></asp:Label></td>
                                                <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("Debit_Amt") %>'></asp:Label></td>
                                                <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("Transaction_Date") %>'></asp:Label></td>
                                            </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>

                                        <tr>
                                            <td class="view-all" colspan="4"><asp:LinkButton ID="lbtnViewPassbook" class="btn btn-primary" runat="server"  OnCommand="lbtnViewPassbook_Command">View All</asp:LinkButton></td></td>
                                        </tr>
                                        </tbody>
                            </table>

                                    </FooterTemplate>

                                </asp:Repeater>



                            </div>
                        </div>
                    </div>

                </asp:Panel>


          


            <asp:Panel ID="pnlAddmoney" runat="server">

                <div class="col-sm-12 details-acc" style="margin-left: 0;padding-right: 0;padding-left: 0;">
                    <div class="panel-acc money-form-panel">
                        <div class="col-sm-10 table-container">
                            <div class="summary">
                                <h2>Add Money</h2>
                            </div>
                            <div class="col-sm-8 col-sm-offset-2 addMoney">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="pwd">Amount:</label>
                                        <div class="col-sm-8">
                                            <input type="number" runat="server" class="form-control" id="txtamt" placeholder="Enter Amount">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-10">

                                            <asp:Button ID="btnAddMoneyToWallet" runat="server" class="btn btn-primary" Text="Proceed To Payment" OnClick="btnAddMoney_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>


            <asp:Panel ID="pnlReferEarn" runat="server">

                    <div class="panel-acc money-form-panel">
                        <div class="col-sm-10 table-container">
                            <div class="summary">
                                <h2>Refer &amp; Earn</h2>
                            </div>
                            <div class="col-sm-8 col-sm-offset-2 addMoney">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="mob">Enter Mobile No:</label>
                                        <div class="col-sm-8">
                                            <input type="number" runat="server" class="form-control" id="txtmob" placeholder="Enter Mobile No"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-10">

                                            <asp:Button ID="btnSendRequest" runat="server" class="btn btn-primary" Text="Send Request" OnClientClick="return referVal(this);" OnClick="btnSendRequest_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </asp:Panel>


            <asp:Panel ID="pnlTransfer" runat="server">


                    <div class="panel-acc money-form-panel">
                        <div class="col-sm-10 table-container">
                            <div class="summary">
                                <h2>Transfer</h2>
                            </div>
                            <div class="col-sm-8 col-sm-offset-2 addMoney">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <asp:RadioButtonList ID="rbtnTransfer" style="width:100%;text-align:center" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnTransfer_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem class="radio-inline">Transfer To User</asp:ListItem>
                                            <asp:ListItem class="radio-inline">Transfer To Bank</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>

                                 <asp:Panel ID="pnlTransferToUser" runat="server">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="transfer">Enter Amount:</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" runat="server" id="txtUsertransferAmt" placeholder="Enter Amount" />
                          
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="transfer">Enter UserId:</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" runat="server" id="txtUserId" placeholder="Enter UserID" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-10">
                                            <asp:Button ID="btnUserTransfer" runat="server" class="btn btn-primary" Text="Proceed To Payment" OnClientClick="return validUserTra(this);" OnClick="btnUserTransfer_Click" />
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlTransferToBank" runat="server">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="transfer">Amount</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" runat="server" id="txtbankTransferAmt" placeholder="Enter Amount" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="transfer">Account Number</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" runat="server" id="txtAccNum" placeholder="Account Number" />                              
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-4">IFSC Code</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" runat="server" id="txtIFSCCode" placeholder="Enter IFSC Code" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-4">Acc Holder Name</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" runat="server" id="txtAccHolderName" placeholder="Account Holder Name" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-10">

                                           <asp:Button ID="btnTransferPayment" runat="server" class="btn btn-primary" Text="Proceed To Payment" OnClientClick="return validbankTra(this);" OnClick="btnTransferPayment_Click" /> 
                                        </div>
                                    </div>
                                </asp:Panel>
                                    
                                </div>
                            </div>
                        </div>
                    </div>

            </asp:Panel>
            
            <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js" ></script>
	        <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
            <script>
                $(document).ready(function () {
                    $('form').attr('id', 'userWallVal');
                });
            </script>
            <script type="text/javascript" src="/js2/sidscript.js"></script>
            
</asp:Content>


