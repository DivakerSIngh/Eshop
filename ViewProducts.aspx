<%@ Page Title="Products" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="ViewProducts.aspx.cs" Inherits="ViewProducts" EnableEventValidation="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function fncsave() {

            alert('hello jack');
        }
    </script>
    <style>
        a.myProLink:hover, a.myProLink:focus {
            color: white;
        }
         /*.imageSize{
            max-width: 100% !important;
    height: auto !important;
        }*/
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
    
    <script src="js/bootstrap-3.3.5.min.js"></script>

    <script type="text/javascript">
        function ShowCurrentTime() {
            $.ajax({
                type: "POST",
                url: "<%= ResolveUrl("~/ViewProduct.aspx/GetCurrentTime") %>/",
                data: '{name:"123" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess(response) {
            alert(response.d);
        }
        $(function () {
            //$("#ex13").slider({
            //    ticks: [0, 100, 200, 300, 400],
            //    ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
            //    ticks_snap_bounds: 30
            //});

            // Without JQuery
            //
            //var slider = new Slider("#ex13", {
            //    ticks: [0, 100, 200, 300, 400],
            //    ticks_labels: ['$0', '$100', '$200', '$300', '$400'],
            //    ticks_snap_bounds: 30
            //});
        });
       
    </script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <!-- products -->
    <div class="products">
        <div class="container">
            <div class="col-md-9 product-w3ls-right">
                <!-- breadcrumbs -->
                <ol class="breadcrumb breadcrumb1">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active">Products</li>
                </ol>
                <div class="clearfix"></div>
                <!-- //breadcrumbs -->
                <div class="product-top">
                    <h4>Products</h4>
                    <ul>
                        <%--  <li class="dropdown head-dpdn">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Filter By<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Low price</a></li>
                                <li><a href="#">High price</a></li>
                                <li><a href="#">Latest</a></li>
                                <li><a href="#">Popular</a></li>
                            </ul>
                        </li>
                        <li class="dropdown head-dpdn">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Brands<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Brand1</a></li> 
                                <li><a href="#">Brand2</a></li>
                                <li><a href="#">Brand3</a></li> 
                                <li><a href="#">Brand4</a></li> 
                            </ul> 
                        </li>--%>
                    </ul>
                    <div class="clearfix"></div>
                </div>


                <%-- <asp:Panel ID="pnlNoProduct" runat="server">
                             <h2>

                                 No Product's available ...

                             </h2>
                             </asp:Panel>

                --%>

                <div class="products-row">

                    <%--    

        <asp:UpdatePanel ID="updatepnl" runat="server">
<ContentTemplate>--%>



                    <asp:ListView ID="lvProd" runat="server" OnPagePropertiesChanging="lvProd_PagePropertiesChanging" ItemPlaceholderID="itemcontainer">

                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="itemcontainer" />

                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvProd" PageSize="20">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                        ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>



                        </LayoutTemplate>
                        <ItemTemplate>

                            <div class="col-md-3 product-grids">
                                <div class="agile-products">
                                    <div class="new-tag">
                                        <h6>
                                            <asp:Label ID="lblDiscount1" runat="server" Text='<%# System.Convert.ToString(Eval("discount")).Substring(0,4) %>'></asp:Label><br />
                                            Off</h6>
                                    </div>
                                    <a href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>">
                                        <asp:Image ID="imgProduct1" class="img-responsive imageSize" alt="img" runat="server" ImageUrl='<%# "ImageHandler.ashx?idsingle=" + System.Convert.ToString(Eval("pid")) %>' Height="200px" Width="160px" /></a>
                                    <div class="agile-product-text">
                                        <h5><a href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>">
                                            <asp:Label ID="lblHeaderPText1" runat="server" Text='<%# Eval("headertitle") %>'></asp:Label></a></h5>
                                        <h6><del>&#8377;<asp:Label ID="lblCP1" runat="server" Text='<%# Eval("costprice") %>'></asp:Label></del>
                                            &#8377;<asp:Label ID="lblSP1" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label></h6>
                                        <%--<form >--%>
                                        <asp:Label ID="lblcid" Visible="false" runat="server" Text='<%# Eval("cid") %>'></asp:Label>
                                        <asp:Button ID="btnViewProdfromList" runat="server" Text="View Product" class="w3ls-cart pw3ls-cart" OnCommand="btnViewProdfromList_Command" CommandArgument='<%# Eval("pid") %>' />
                                        <%-- </form>--%>
                                    </div>
                                </div>
                            </div>


                        </ItemTemplate>

                        <EmptyDataTemplate>
                            <div>No product available !</div>
                        </EmptyDataTemplate>

                    </asp:ListView>

                    



                    <div class="clearfix"></div>
                </div>



                <!-- add-products -->
                <div class="w3ls-add-grids w3agile-add-products">
                    <a href="#">
                        <h4>TOP 10 TRENDS FOR YOU FLAT <span>20%</span> OFF</h4>
                        <h6>Shop now <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
                    </a>
                </div>
                <!-- //add-products -->
            </div>
            <div class="col-md-3 rsidebar">
                <div class="rsidebar-top">

                    <div class="sidebar-row">
                        <h4>Store</h4>
                        <ul class="faq">
                            <li class="item1"><a href="#">LifeStyle<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=1">Ethnic wear</a></li>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=1">Maternity wear</a></li>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=1">Sports wear</a></li>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=1">Inner & nightwear</a></li>
                                </ul>
                            </li>

                            <li class="item3"><a href="#">Villagers Basket<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=3">Face Care</a></li>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=3">Perfumes & Deos</a></li>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=3">Personal Grooming</a></li>
                                </ul>
                            </li>
                            <li class="item3"><a href="#">Agriculture<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=4">Fungicides</a></li>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=4">Herbicides</a></li>
                                    <li class="subitem1"><a href="ViewProducts.aspx?cid=4">Insecticides

                                    </a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- script for tabs -->
                        <script type="text/javascript">
                            $(function () {

                                var menu_ul = $('.faq > li > ul'),
                                       menu_a = $('.faq > li > a');

                                menu_ul.hide();

                                menu_a.click(function (e) {
                                    e.preventDefault();
                                    if (!$(this).hasClass('active')) {
                                        menu_a.removeClass('active');
                                        menu_ul.filter(':visible').slideUp('normal');
                                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                                    } else {
                                        $(this).removeClass('active');
                                        $(this).next().stop(true, true).slideUp('normal');
                                    }
                                });

                            });
                        </script>
                        <!-- script for tabs -->
                    </div>

                </div>
                <div class="related-row">
                    <h4>Filter By Price</h4>
                    

                    <asp:RadioButtonList ID="rbtnPrice" runat="server" RepeatDirection="Vertical" AutoPostBack="True" OnSelectedIndexChanged="rbtnPrice_SelectedIndexChanged">

                        <asp:ListItem  Value="a">0 - 1000</asp:ListItem>
                        <asp:ListItem  Value="b">1000 - 3000</asp:ListItem>
                        <asp:ListItem  Value="c">3000 - 5000</asp:ListItem>
                        <asp:ListItem  Value="d">5000 - 10000</asp:ListItem>
                    </asp:RadioButtonList>

                <%--  <input id="ex13" type="text" data-slider-ticks="[0, 100, 200, 300, 400]" data-slider-ticks-snap-bounds="30" data-slider-ticks-labels='["$0", "$100", "$200", "$300", "$400"]'/>
                                  

                  Filter by price interval: <b>€ 10</b> <input id="ex2" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/> <b>€ 1000</b>--%>
                   
                </div>

                <div class="related-row" style="overflow-y:scroll;height:600px;">
                    <h4>Filter By Brand</h4>
                    

                    <asp:CheckBoxList ID="chkNBrandList" runat="server" RepeatDirection="Vertical" AutoPostBack="True" OnSelectedIndexChanged="chkNBrandList_SelectedIndexChanged">

                        
                    </asp:CheckBoxList>

                </div>

                <%--<div class="related-row">
                    <h4>YOU MAY ALSO LIKE</h4>
                    <div class="galry-like">  
                        <a href="single.html"><img src="images/e1.png" class="img-responsive" alt="img"></a>             
                        <h4><a href="products.html">Audio speaker</a></h4> 
                        <h5>$100</h5>       
                    </div>
                </div>--%>
            </div>
            <div class="clearfix"></div>



            <!-- recommendations -->
            <div class="recommend" style="display:none;">
                <h3 class="w3ls-title">Our Recommendations </h3>
                <script>
                    $(document).ready(function () {
                        $("#owl-demo5").owlCarousel({

                            autoPlay: 3000, //Set AutoPlay to 3 seconds

                            items: 4,
                            itemsDesktop: [640, 5],
                            itemsDesktopSmall: [414, 4],
                            navigation: true

                        });

                    });
                </script>
                <div id="owl-demo5" class="owl-carousel">




                    <asp:ListView ID="lvProdRecommend" runat="server" ItemPlaceholderID="itemcontainer">

                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="itemcontainer" />


                        </LayoutTemplate>
                        <ItemTemplate>


                            <div class="item">
                                <div class="glry-w3agile-grids agileits">
                                    <div class="new-tag">
                                        <h6>
                                            <asp:Label ID="lblDiscount1" runat="server" Text='<%# System.Convert.ToString(Eval("discount")).Length > 2 ? System.Convert.ToString(Eval("discount")).Substring(0,4) : Eval("discount") %>'></asp:Label><br />
                                            Off</h6>
                                    </div>
                                    <a href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>">
                                        <asp:Image ID="imgProduct1" class="img-responsive" alt="img" runat="server" ImageUrl='<%# "ImageHandler.ashx?idsingle=" + System.Convert.ToString(Eval("pid")) %>' Height="200px" Width="160px" /></a>
                                    <div class="view-caption agileits-w3layouts">
                                        <h4><a href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>">
                                            <asp:Label ID="lblHeaderPText1" runat="server" Text='<%# Eval("headertitle") %>'></asp:Label></a></h4>
                                        <h5>Rs
                                                <asp:Label ID="lblSP1" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label></h5>
                                        <div>

                                            <a style="position: relative" class="myProLink w3ls-cart pw3ls-cart" href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>">View Product</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:ListView>

                    <%--                    <div class="item">
                        <div class="glry-w3agile-grids agileits"> 
                            <a href="products.html"><img src="images/e4.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">           
                                <h4><a href="products.html">Digital Camera</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$80</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" /> 
                                    <input type="hidden" name="w3ls_item" value="Digital Camera"/> 
                                    <input type="hidden" name="amount" value="100.00" /> 
                                    <button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
                                </form>
                            </div>         
                        </div>  
                    </div>  
                    <div class="item">
                        <div class="glry-w3agile-grids agileits"> 
                            <div class="new-tag"><h6>New</h6></div>
                            <a href="products4.html"><img src="images/s1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">           
                                <h4><a href="products4.html">Roller Skates</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$180</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" /> 
                                    <input type="hidden" name="w3ls_item" value="Roller Skates"/> 
                                    <input type="hidden" name="amount" value="180.00" /> 
                                    <button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
                                </form>
                            </div>         
                        </div>  
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits"> 
                            <a href="products1.html"><img src="images/f1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">           
                                <h4><a href="products1.html">T Shirt</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$10</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" /> 
                                    <input type="hidden" name="w3ls_item" value="T Shirt" /> 
                                    <input type="hidden" name="amount" value="10.00" /> 
                                    <button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
                                </form>
                            </div>        
                        </div>    
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits"> 
                            <div class="new-tag"><h6>New</h6></div>
                            <a href="products6.html"><img src="images/p1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">           
                                <h4><a href="products6.html">Coffee Mug</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$14</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" /> 
                                    <input type="hidden" name="w3ls_item" value="Coffee Mug" /> 
                                    <input type="hidden" name="amount" value="14.00" /> 
                                    <button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
                                </form>
                            </div>         
                        </div>  
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits"> 
                            <div class="new-tag"><h6>20% <br> Off</h6></div>
                            <a href="products6.html"><img src="images/p2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">           
                                <h4><a href="products6.html">Teddy bear</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$20</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" /> 
                                    <input type="hidden" name="w3ls_item" value="Teddy bear" /> 
                                    <input type="hidden" name="amount" value="20.00" /> 
                                    <button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
                                </form>
                            </div>        
                        </div> 
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits"> 
                            <a href="products4.html"><img src="images/s2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">           
                                <h4><a href="products4.html">Football</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$70</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" /> 
                                    <input type="hidden" name="w3ls_item" value="Football"/> 
                                    <input type="hidden" name="amount" value="70.00"/>
                                    <button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
                                </form>
                            </div>        
                        </div> 
                    </div> 
                    <div class="item">
                        <div class="glry-w3agile-grids agileits"> 
                            <div class="new-tag"><h6>Sale</h6></div>
                            <a href="products3.html"><img src="images/h1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">           
                                <h4><a href="products3.html">Wall Clock</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$80</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" /> 
                                    <input type="hidden" name="w3ls_item" value="Wall Clock" /> 
                                    <input type="hidden" name="amount" value="80.00" /> 
                                    <button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
                                </form>
                            </div>         
                        </div>  
                    </div> --%>
                </div>
            </div>
            <!-- //recommendations -->

            <script>
                $(document).ready(function () {
                    $('<div id="myNexa" class="col-xs-12" style="text-align: center;margin-top: 31px;"></div>').insertBefore($('.products-row .clearfix'));
                    $('#ContentPlaceHolder1_lvProd_DataPager1').appendTo('#myNexa');
                })
            </script>
        </div>
    </div>

</asp:Content>

