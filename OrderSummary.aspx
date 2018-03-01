<%@ Page Title="Order Summary" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="OrderSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    
        
    <style>
        * {
            box-sizing: border-box;
        }

        .col-container {
            display: table;
            width: 100%;
        }

        .col {
            display: table-cell;
            padding: 16px;
        }

        @media only screen and (max-width: 100%) {
            .col {
                display: block;
                width: 100%;
            }
        }
    </style>

    <style type="text/css">

        .gridview {
    font-family: Arial;
    background-color: #FFFFFF;
    border: solid 1px #CCCCCC;
}

.gridview td  {
    padding: 5px 50px 5px 5px;
}

.gridview th {
    padding: 5px 50px 5px 5px;
    text-align: left;
}

.gridview th a{
    color: #003300;
    text-decoration: none;
}

.gridview th a:hover{
    color: #003300;
    text-decoration: underline;
}

.gridview td a{
    color: #003300;
    text-decoration: none;
}

.gridview td a:hover {
    color: red;
    text-decoration:underline;     
}

.gridViewHeader {
    background-color: #0066CC;
    color: #FFFFFF;
    text-align: left;
}

.gridViewRow {
    background-color: #99CCFF;
    color: #000000;
}

.gridViewAltRow {
    background-color: #FFFFFF;
}

.gridViewSelectedRow {
    background-color: #FFCC00;
    color: #666666;
}

/* Of course, this doesn't work with IE6. Works fine with Firefox, though. */
.gridview tr.gridViewRow:hover td, .gridview tr.gridViewAltRow:hover td {
    background-color: #CCCCCC;
    color: #000000; 
}

.gridViewPager 
{
    background-color: #0066CC;
    color: #FFFFFF;
    text-align: left;
}

.gridViewPager td  {
    padding: 3px;
}

.gridViewPager td a {
    color: #FFFFFF;
    text-decoration: none;
}

.gridViewPager td a:hover {
    color: #FFFFFF;
    text-decoration: underline;
}

/* The currently selected page number is rendered by ASP.NET in a span tag in the td. */
.gridViewPager span {
    color: #000000;
}

#divGridView {
    margin-top: 1.5em;
}

    </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


     <div class="col-container" style="width: 100%;height:100%;">

        <div class="col" style="width: 23%; vertical-align: top;">

               </div>

        <div class="col" style="width: 70%;text-align:left;align-content:center;">

            <h3><asp:Label ID="lblrecentorder" runat="server" Text="Recent Order Summary" ></asp:Label></h3><br />

    <asp:GridView ID="gv_OrederSummary" CssClass="gridview" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle CssClass="gridViewAltRow" />
        <Columns>
            <asp:TemplateField HeaderText="Sno">
                <ItemTemplate>
                    <asp:Label ID="lblSno" runat="server" ForeColor="#003366" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Transaction Id">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("TransactionId") %>' ></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("headertitle") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price(One Item)">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("sellingprice") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("quantity") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Amount">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("totalprice") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle CssClass="gridViewHeader" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle CssClass="gridViewRow" />
        <SelectedRowStyle CssClass="gridViewSelectedRow" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>


            <br />
            <br />

             <div style="width:100%;margin-left:0%">           <h3><asp:Label ID="lblPastSum" runat="server" Text="Past Order Summary"></asp:Label></h3><br /></div>

             <asp:GridView ID="gv_ordersummaryall" CssClass="gridview" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle CssClass="gridViewAltRow" />
        <Columns>
            <asp:TemplateField HeaderText="Sno">
                <ItemTemplate>
                    <asp:Label ID="lblSno" runat="server" ForeColor="#003366" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Transaction Id">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("TransactionId") %>' ></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("headertitle") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price(One Item)">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("sellingprice") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("quantity") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Amount">
                <ItemTemplate>

                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("totalprice") %>' Visible="true"></asp:Label>

                </ItemTemplate>

            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle CssClass="gridViewHeader" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle CssClass="gridViewRow" />
        <SelectedRowStyle CssClass="gridViewSelectedRow" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

                 </div>

        <div class="col" style="width: 10%; vertical-align: top;">

            </div>

    </div>



</asp:Content>

