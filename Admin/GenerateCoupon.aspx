<%@ Page Title="Generate Coupon" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="GenerateCoupon.aspx.cs" Inherits="Admin_GenerateCoupon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server" class="form-horizontal">
    <asp:TextBox ID="txtLimit" runat="server" TextMode="Number"></asp:TextBox>
    <asp:Button ID="btnGenerate" runat="server" Text="Generate" OnClick="btnGenerate_Click" />
        </form>
</asp:Content>

