<%@ Page Title="Cart Products" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="CartProducts.aspx.cs" Inherits="CartProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
 
        function Calculation() {
           
            var grid = document.getElementById("<%= gv_ProductList.ClientID%>");
            for (var i = 0; i < grid.rows.length - 1; i++) {
                var txtquantity = $("input[id*=txtQuantity]")
                var txttotamt = $(grid.rows[i + 1]).find("[id*=lblTotalPrice]").text();
                var txtsingleamt = $(grid.rows[i + 1]).find("[id*=lblPriceOneProd]").text();
                if (txtquantity[i].value != '' && txtquantity[i].value > 0) {
                    $(grid.rows[i + 1]).find("[id*=lblTotalPrice]").text(txtsingleamt * txtquantity[i].value);
                   // alert(txttotamt);
                }
                else
                {
                    txtquantity[i].value = "";
                    //$("input[id*=txtQuantity]")
                    $(grid.rows[i + 1]).find("[id*=lblTotalPrice]").text("");
                }
            }
        }
 
</script>  


    
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

    
        <div class="col-container" style="width: 100%">

        <div class="col" style="width: 15%; vertical-align: top;">

               </div>

        <div class="col" style="width: 70%">


    <asp:Label ID="lblNoRecord" runat="server" Text="No Record Available !" Visible="false"></asp:Label>


    <asp:GridView ID="gv_ProductList" CssClass="gridview" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle CssClass="gridViewAltRow"   />
        <Columns >
            <asp:TemplateField HeaderText="Sno">

                <ItemTemplate>
                    <asp:Label ID="lblSno" runat="server" ForeColor="#003366" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    <asp:Label ID="lblSessionId" runat="server" ForeColor="#003366" Text='<%#Eval("sessionid") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblpid" runat="server" ForeColor="#003366" Text='<%#Eval("pid") %>' Visible="false"></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Title">

                  <ItemTemplate>
                    <asp:Label ID="lblProdTitle" runat="server" ForeColor="#003366" Text='<%#Eval("HeaderTitle") %>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                    
                <ItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" onblur="Calculation(this.value)" ></asp:TextBox>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">

                <ItemTemplate>
                    <asp:Label ID="lblPriceOneProd" runat="server"  Text='<%#Eval("SellingPrice") %>' ></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Price">

                <ItemTemplate>
                    <asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remove">


                <ItemTemplate>
                    <asp:LinkButton ID="lnkRemove" runat="server" OnCommand="lnkRemove_Command" CommandName="DeleteCartItem"  CommandArgument='<%#Eval("pid")+","+Eval("sessionid") %>'>Remove</asp:LinkButton>
                </ItemTemplate>

            
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle CssClass="gridViewHeader"  />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle CssClass="gridViewRow"  />
        <SelectedRowStyle CssClass="gridViewSelectedRow"  />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

            <br />

    <asp:Button ID="btnPurchase" CssClass="btn-primary" OnClick="btnPurchase_Click" runat="server" Text="Place Order" />
            
        </div>

        <div class="col" style="width: 15%; vertical-align: top;">

            </div>

    </div>

</asp:Content>

