<%@ Page Title="Product" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="SingleProduct.aspx.cs" Inherits="SingleProduct" EnableEventValidation="false" %>

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

    
   <style>
       div.ex2 {
       }
   </style>


      <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript">
    $(window).load(function () {
        $("#pageloaddiv").fadeOut(2000);
        $("#overlay").fadeOut(1000);
    });
</script>
<style type="text/css">
#pageloaddiv {
position: fixed;
left: 0px;
top: 0px;
width: 100%;
height: 100%;
z-index: 1000;
 background-color: Black;
    
    -moz-opacity: 0.8;
background: url('images/loading.gif') no-repeat center center;
}

#overlay {
    position: fixed;
    z-index: 99;
    top: 0px;
    left: 0px;
    background-color: #f8f8f8;
    width: 100%;
    height: 100%;
    filter: Alpha(Opacity=5);
    opacity: 0.9;
    -moz-opacity: 0.05;
}       

</style>

    <link href="css2/style_responsive.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


     <div id="overlay">
    <div id="pageloaddiv"></div>

    </div>



  <div id="pagewrap">

	<header style="display:none;">
		<h1>3 Column Responsive Layout</h1>
	</header>
		
	<section id="content">
            <asp:DataList ID="dlImageList" runat="server">
                <ItemTemplate >
                    <div class="col-md-3 product-grids" style="width: 100px;" >
                        <div class="agile-products" style="width: 100px;text-align:center;vertical-align:top;">
                            <a href="#">
                                <asp:ImageButton ID="imgProduct" class="img-responsive" alt="img" runat="server" ImageUrl='<%# "SingleProductHandler.ashx?id=" + System.Convert.ToString(Eval("pimgid")) %>' Height="80px" Width="60px" CommandName="displayImage" CommandArgument='<%# Eval("pimgid") %>' OnCommand="imgProduct_Command"  />
                            </a>
                            <div class="agile-product-text">
                                <h5><a href="#">
                                    <asp:Label ID="lblPImgId" runat="server" Text='<%# Eval("pimgid") %>' Visible="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>

            </asp:DataList>
        </section>
	
	<section id="middle">
	

            <asp:Panel ID="Panel1" runat="server" Width="80%" Height="80%">

                <asp:Image ID="ImgFullView" runat="server" style="max-height:100%;max-width:100%" />

            </asp:Panel>

        </section>

	<aside id="sidebar">


            <asp:DataList ID="ddlPrdoDescription" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemDataBound="ddlPrdoDescription_ItemDataBound">
                <ItemTemplate>

                <table style="width:345px;border: 2px solid #f44336;">  
						<tr style="width:100%;background-color:#f44336;">
                            <td colspan="2" style="padding: 15px;text-align: center;border-bottom: 1px solid #ddd;" ><h2 class="item_name"><asp:Label ID="lblHeaderTitle" runat="server" Text='<%# Eval("HeaderTitle") %>' ForeColor="White"></asp:Label></h2></td>

						</tr>
						
							<tr style="width:100%">
                                <td colspan="2" style=" padding: 15px;text-align: center;border-bottom: 1px solid #ddd;"><h3><del><asp:Image ID="ImgRupee2" runat="server" ImageUrl="~/images/rupee.png" /><asp:Label ID="lblCP" runat="server" Text='<%# Eval("CostPrice") %>'></asp:Label></del>
                                    <asp:Image ID="ImgRupee" runat="server" ImageUrl="~/images/rupee.png" /><asp:Label ID="lblSP" runat="server" Text='<%# Eval("SellingPrice") %>'></asp:Label> </h3>

                                </td>
								
								<tr style="width:100%">
                                    <td colspan="2" style=" padding: 15px;text-align: center;border-bottom: 1px solid #ddd;"><h3><span class="w3off"><asp:Label ID="LblDiscount" runat="server" Text='<%# System.Convert.ToString(Eval("Discount")).Substring(0,4) %>'></asp:Label>% OFF</span></h3></td>

								</tr>
								
								<tr style="width:100%;">
                                    <td colspan="2" style=" padding: 15px;text-align: center;border-bottom: 1px solid #ddd;"><h3><a href="#"><i class="fa fa-gift" aria-hidden="true"></i> Coupon</a></h3></td>

								</tr>
							
                        <tr style="width:100%;">
                            <td style=" padding: 15px;text-align: center;border-bottom: 1px solid #ddd;">
                                <asp:TextBox ID="txtLocation" runat="server" placeholder="enter pincode" TextMode="Number" style="width:200px;height:30px;" ></asp:TextBox>
                            </td>
                            <td style=" padding: 15px;text-align: center;border-bottom: 1px solid #ddd;">
                                <asp:ImageButton ID="btnCheckLocation" runat="server"  CommandName="GetLocation"  ImageUrl="~/images/location.png" OnClick="btnCheckLocation_Click1" />
                                <asp:ImageButton ID="btnAvailable" runat="server"  ImageUrl="~/images/available.png" visible="false" />
                               
                            </td>
                        </tr>
                        <tr  style="width:100%;">
                            <td colspan="2" style=" padding: 15px;text-align: center;border-bottom: 1px solid #ddd;">
                                <asp:DropDownList ID="ddlsize" runat="server" style="width:200px;height:30px;" ></asp:DropDownList>
                            </td>
                            
                        </tr>

				<tr style="width:100%;"><td colspan="2" style=" padding: 15px;text-align: center;border-bottom: 1px solid #ddd;">
                    <asp:Button ID="btnAddToCart" class="w3ls-cart" runat="server" Text="Add To Cart" CommandName="AddToCart" CommandArgument='<%# Eval("pid")+","+Eval("cid")+","+Eval("rid") %>' OnCommand="btnAddToCart_Command" />
				    </td></tr>
					
                    
                    </table>
                        	
					
                  
                </ItemTemplate>

            </asp:DataList>


        </aside>
	
	<footer>

        
            <asp:DataList ID="ddlProdDetail" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>

                      
<div class="ex2"  >
                    <!-- collapse-tabs -->
			<div class="collpse tabs" style="">
				<h3 class="w3ls-title">About this item</h3> 
				<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true" style="">
					<div class="panel panel-default" style="">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i> Description <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								 <asp:Label ID="lblxyz" runat="server" Text='<%# Eval("PDescription") %>' ></asp:Label>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<i class="fa fa-info-circle fa-icon" aria-hidden="true"></i> additional information <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a> 
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
					

                                <table style="width:780px;">
                      
                        <tr>
                            <td style="width:50%;">
                              <asp:Label ID="lblt1" runat="server" Text='<%# Eval("Title1") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblv1" runat="server" Text='<%# Eval("Value1") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt2" runat="server" Text='<%# Eval("Title2") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv2" runat="server" Text='<%# Eval("Value2") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="LBLt3" runat="server" Text='<%# Eval("Title3") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv3" runat="server" Text='<%# Eval("Value3") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt4" runat="server" Text='<%# Eval("Title4") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv4" runat="server" Text='<%# Eval("Value4") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt5" runat="server" Text='<%# Eval("Title5") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv5" runat="server" Text='<%# Eval("Value5") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt6" runat="server" Text='<%# Eval("Title6") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv6" runat="server" Text='<%# Eval("Value6") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt7" runat="server" Text='<%# Eval("Title7") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv7" runat="server" Text='<%# Eval("Value7") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt8" runat="server" Text='<%# Eval("Title8") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv8" runat="server" Text='<%# Eval("Value8") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt9" runat="server" Text='<%# Eval("Title9") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lblv9" runat="server" Text='<%# Eval("Value9") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <asp:Label ID="Lblt10" runat="server" Text='<%# Eval("Title10") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Lbl10" runat="server" Text='<%# Eval("Value10") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>


							</div>
						</div>
					</div>

					<div class="panel panel-default" >
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i> reviews (0) <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
								No Review is available.
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
									<i class="fa fa-question-circle fa-icon" aria-hidden="true"></i> help <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">
								You can write a mail to us or call us for your any query !
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- //collapse --> 
			
    </div>


                    
                </ItemTemplate>

            </asp:DataList>


        </footer>

</div>
  

        

    <!-- recommendations -->

    <div class="recommend">

        <h3 class="w3ls-title">Our Recommendations </h3>

              <asp:Panel ID="pnlRecomProdList" runat="server">
                             <h2>

                                 No Product's available ...
                                 <asp:Label ID="lblleftindex" Text="" runat="server" Visible="false" ></asp:Label>
                                 <asp:Label ID="lblrightindex" Text="" runat="server" Visible="false" ></asp:Label>
                                 <asp:Label ID="lblcid" Text="" runat="server" Visible="false" ></asp:Label>
                             </h2>
                             </asp:Panel>

        <table style="width: 100%;">
            <tr>
                <td style="width: 10%;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/left.png" OnClick="ImageButton1_Click" />
                </td>
                <td style="width: 80%;">
                    <div style="width: 100%;">


                        <asp:DataList ID="dlRecomProd" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="6">

                            <ItemTemplate>
                                <div class="col-md-3 product-grids" style="width: 100%">
                                    <div class="agile-products" style="width: 100%">
                                        <div class="new-tag">
                                            <h6>
                                                <asp:Label ID="lblRecomDiscount" runat="server" Text='<%# System.Convert.ToString(Eval("discount")).Substring(0,4) %>'></asp:Label><br>
                                                Off</h6>
                                        </div>
                                        <a href="SingleProduct.aspx?pid= <%# Eval("pid") %>">
                                            <%--    <img src="images/f7.png" class="img-responsive" alt="img">--%>
                                            <asp:Image ID="imgRecomProduct" class="img-responsive" alt="img" runat="server" ImageUrl='<%# "ImageHandler.ashx?id=" + System.Convert.ToString(Eval("pid")) %>' Height="200px" Width="160px" />

                                        </a>
                                        <div class="agile-product-text" style="width: 100%">
                                            <h5><a href="SingleProduct.aspx?pid= <%# Eval("pid") %>">
                                                <asp:Label ID="lblRecomHeaderPText" runat="server" Text='<%# Eval("headertitle") %>'></asp:Label></a></h5>
                                            <asp:Label ID="lblRecomPId" runat="server" Text='<%# Eval("pid") %>' Visible="false"></asp:Label>
                                            <h6>
                                                <asp:Image ID="ImgRecomRupee" runat="server" ImageUrl="~/images/rupee.png" />
                                                <del>
                                                    <asp:Label ID="lblRecomCP" runat="server" Text='<%# Eval("costprice") %>'></asp:Label></del><asp:Label ID="lblRecomSP" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label>
                                            </h6>

                                            <%--<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Leather Jacket" /> 
									<input type="hidden" name="amount" value="20.00" /> 
									<button  id="button123"  runat="server"  type="submit" class="w3ls-cart pw3ls-cart" onclick="fncsave"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>--%>
                                            <asp:Button ID="btnRecomAddToCart" runat="server" Text="View Product" class="w3ls-cart pw3ls-cart" CommandName="AddToCart" CommandArgument='<%# Eval("pid")+","+Eval("cid")+","+Eval("rid") %>' OnCommand="btnRecomAddToCart_Command" />
                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>


                        </asp:DataList>



                    </div>
                </td>
                <td style="width: 10%;">
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/right.png" OnClick="ImageButton2_Click" />
                </td>
            </tr>
        </table>


    </div>

    <!-- //recommendations -->
    <br />




</asp:Content>

