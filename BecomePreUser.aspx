<%@ Page Title="" Language="C#" MasterPageFile="~/WalletAccount.master" AutoEventWireup="true" CodeFile="BecomePreUser.aspx.cs" Inherits="Retailor_BecomePreUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="margin-left:60px;margin-top:60px;">
        <tr>
            <td>Select TShirt Size :</td>
            <td><asp:DropDownList ID="ddlSize" runat="server">
                <asp:ListItem Value="S">Small</asp:ListItem>
                <asp:ListItem Value="M">Medium</asp:ListItem>
                <asp:ListItem Value="L">Large</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <br />
                
                <asp:Button ID="btnPremium" OnClick="btnPremium_Click" runat="server" Text="Pay" />

            </td>
            <td></td>
        </tr>
    </table>
     

</asp:Content>

