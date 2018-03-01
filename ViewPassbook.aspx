<%@ Page Title="Passbook" Language="C#" MasterPageFile="~/WalletAccount.master" AutoEventWireup="true" CodeFile="ViewPassbook.aspx.cs" Inherits="ViewPassbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    
     <div class="wallet-buttons">
                    <div class="col-sm-10 bot">
                        <asp:LinkButton ID="btnPremiumUser" class="btn btn-primary" runat="server" OnClick="btnPremiumUser_Click" >Become Premium User</asp:LinkButton>
                        <asp:LinkButton ID="btnAddMoney" class="btn btn-primary" runat="server" OnClick="btnAddMoney_Click" >Add Money</asp:LinkButton>
                        <asp:LinkButton ID="btnTransfer" class="btn btn-primary" runat="server" OnClick="btnTransfer_Click" >Transfer</asp:LinkButton>
                        <asp:LinkButton ID="btnReferEarn" class="btn btn-primary" runat="server" OnClick="btnReferEarn_Click" >Refer &amp; Earn</asp:LinkButton>
                        <asp:LinkButton ID="btnPassbook" class="btn btn-primary" runat="server" OnClick="btnPassbook_Click" >Passbook</asp:LinkButton>
                    </div>
                </div>



                <asp:Panel ID="pnlPassbook" runat="server">

                    <div class="panel-acc">
                        <div class="col-sm-10 table-container">
                            <div class="summary">
                                <h2>Passbook Summary</h2>
                            </div>
                            <div class="col-sm-12">
                                <asp:Repeater ID="rptPassbookInfo" runat="server">

                                    <HeaderTemplate>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <h3>Passbook</h3>
                                                </tr>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Transaction Id</th>
                                                    <th>Credit Amount</th>
                                                    <th>Debit Amount</th>
                                                    <th>Used Info</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>


                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("SNo") %>'></asp:Label></th>
                                                <td>
                                                    <asp:Label ID="lblTId" runat="server" Text='<%# Eval("TId") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lblCAmt" runat="server" Text='<%# Eval("Credit_Amt") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lblDAmt" runat="server" Text='<%# Eval("Debit_Amt") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="llblTType" runat="server" Text='<%# Eval("Transaction_Type") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Transaction_Date") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="TStatus" runat="server" Text='<%# Eval("TStatus") %>'></asp:Label></td>
                                            </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>

                                        
                                        </tbody>
                            </table>

                                    </FooterTemplate>

                                </asp:Repeater>


                            </div>
                           
                        </div>
                    </div>

                </asp:Panel>



</asp:Content>

