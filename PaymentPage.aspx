<%@ Page Title="Payment Page" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="PaymentPage.aspx.cs" Inherits="PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Button ID="btnSuccessful" runat="server" OnClick="btnSuccessful_Click" Text="Success" />

    <asp:Button ID="btnFail" runat="server" Text="Fail" OnClick="btnFail_Click" />

</asp:Content>

