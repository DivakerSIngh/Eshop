<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LatestProdSlider.aspx.cs" Inherits="LatestProdSlider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlItemList" runat="server">

                <asp:DataList ID="dlItemList" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">

                     <ItemTemplate>

                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <a href="#">
                                <img src="images/f1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="#">T Shirt</a></h4>
                                <p>New collection available</p>
                                <h5>Rs 10000</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="T Shirt" />
                                    <input type="hidden" name="amount" value="10.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>

                         </ItemTemplate>

                </asp:DataList>

            </asp:Panel>



            <br />

        </div>
    </form>
</body>
</html>
