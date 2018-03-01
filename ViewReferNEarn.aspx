<%@ Page Title="Refer N Earn" Language="C#" MasterPageFile="~/WalletAccount.master" AutoEventWireup="true" CodeFile="ViewReferNEarn.aspx.cs" Inherits="ViewReferNEarn" %>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


     <div class="wallet-buttons">
                    <div class="col-sm-10 bot">
                        <asp:LinkButton ID="btnPremiumUser" class="btn btn-primary" runat="server" OnClick="btnPremiumUser_Click" >Become Premium User</asp:LinkButton>
                        <asp:LinkButton ID="btnAddMoney" class="btn btn-primary" runat="server" OnClick="btnAddMoney_Click" >Add Money</asp:LinkButton>
                        <asp:LinkButton ID="btnTransfer" class="btn btn-primary" runat="server" OnClick="btnTransfer_Click" >Transfer</asp:LinkButton>
                        <asp:LinkButton ID="btnReferEarn" class="btn btn-primary" runat="server" OnClick="btnReferEarn_Click" >Refer &amp; Earn</asp:LinkButton>
                        <asp:LinkButton ID="btnPassbook" class="btn btn-primary" runat="server" OnClick="btnPassbook_Click" >Passbook</asp:LinkButton>
                    </div>
                </div>



                <asp:Panel ID="pnlReferInfo" runat="server">

                    <div class="panel-acc">
                        <div class="col-sm-10 table-container">
                            <div class="summary">
                                <h2>Refer and Earn Summary</h2>
                            </div>
                            <div class="col-sm-12">
                                <asp:Repeater ID="rptReferEarn" runat="server">

                                    <HeaderTemplate>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <h3>Refer &amp; Earn</h3>
                                                </tr>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Refeered Mobile</th>
                                                    <th>Id</th>
                                                    <th>Name</th>
                                                    <th>Date</th>
                                                    <th>User Type</th>
                                                </tr>
                                            </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>


                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("SNo") %>'></asp:Label></th>
                                                <td>
                                                    <asp:Label ID="lblRMob" runat="server" Text='<%# Eval("ReferralMob") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                                <th scope="row">
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("EntryDate") %>'></asp:Label></th>
                                                <td>
                                                    <asp:Label ID="lblType" runat="server" Text='<%# Eval("UserType") %>'></asp:Label></td>
                                                
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

