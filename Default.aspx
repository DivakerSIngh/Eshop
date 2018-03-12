<%@ Page Title="Villagers" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
<%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script> --%>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyAPGIvYpvs7ETQHWcfHnJjLBLH5XNF0OZs"></script>
<script type="text/javascript"> 

    if ( localStorage.getItem('postalCode')=="") {
        initialize();
    }
    

    var geocoder;

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
} 
//Get the latitude and the longitude;
function successFunction(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    codeLatLng(lat, lng)
}

function errorFunction(){
    //alert("Geocoder failed");
}
function initialize() {
    geocoder = new google.maps.Geocoder();
  }
  function codeLatLng(lat, lng) {
    var latlng = new google.maps.LatLng(lat, lng);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      console.log(results)
        if (results[1]) {
         //formatted address
         alert(results[0].formatted_address)
        //find country name
             for (var i=0; i<results[0].address_components.length; i++) {
            for (var b=0;b<results[0].address_components[i].types.length;b++) {

            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
                if (results[0].address_components[i].types[b] == "postal_code") {
                    //this is the object you are looking for
                    city= results[0].address_components[i];
                    break;
                }
            }
             }
             localStorage.setItem('postalCode', city.long_name)
        //city data
        //alert(city.short_name + " " + city.long_name)
        } else {
          //alert("No results found");
        }
      } else {
        //alert("Geocoder failed due to: " + status);
      }
    });
  }
</script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="agileits-modal modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88"
		aria-hidden="true">
		<div class="modal-dialog" style="text-align:justify">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Join Villagers</h4>
				</div>
				<div class="modal-body modal-body-sub"> 
					<h5>Provide Your Message </h5>  
					
					<a class="close2" data-dismiss="modal" aria-hidden="true" href="Register.aspx">Join Now</a>
				</div>
			</div>
		</div>
	</div>

	<script>
	    if (window.location.search.includes('flag=ts')) {
	        $('#myModal88 .modal-header h4').text('Payment Status');
	        $('#myModal88 .modal-body-sub').html('<div id="w"><div id="content"><div class="notify successbox"><h1>Success!</h1><span class="alerticon"><img src="images/check.png" alt="checkmark" /></span><p>Transaction Completed Successfully</p></div></div></div>');
	    } else if (window.location.search.includes('flag=tf')) {
	        $('#myModal88 .modal-header h4').text('Payment Status');
	        $('#myModal88 .modal-body-sub').html('<div id="w"><div id="content"><div class="notify errorbox"><h1>Failure!</h1><span class="alerticon"><img src="images/error.png" alt="error" /></span><p>Transaction Failed</p></div></div></div>');
	    } else {

	        $('#myModal88 .modal-body-sub').html('<p>The internet is the most powerful tool available to mankind today and we, at Villagers, believe in leveraging it to its utmost potential. Our company&acute;s tagline <strong>(Farmers to Customers)</strong> aptly describes our motivation, vision, and mission behind the business.</p><p>We dream of a country where a farmer won&acute;t have to struggle for the right marketplace or price for his produce</p><p>Our objective is to empower farmers of the country to become an independent retailer on our portal and introduce their produce to our huge customer base present across the country. At Villagers, we believe in the YCYP policy which is &Prime;Your Crop Your Price.&Prime;</p><p>Quote</p><ul><li>No Middlemen</li><li>No Transportation Cost</li><li>Hassle Free Process</li></ul><br><p>Join the movement. Be Villagers!</p><p>"What seems like dirt to most of the people is opportunity for the farmers."</p><div style="border-top: 1px solid #e5e5e5;padding-top:30px;width:100%;text-align:center"><a href="Register.aspx" class="close2">Join Now</a></div>');
	    }
	    if ($('#btnUserName').text().trim() === '' || window.location.search.includes('flag=tf') || window.location.search.includes('flag=ts')) {
	        $('#myModal88').modal('show');
	    } 
	</script>
    	<!-- banner -->
	<div class="banner">
		<div id="kb" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">
			<!-- Wrapper-for-Slides -->
            <div class="carousel-inner" role="listbox">  
                <div class="item active"><!-- First-Slide -->
                    <img src="images/5.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <h3 data-animation="animated flipInX">Flat <span>50%</span> Discount</h3>
                        <h4 data-animation="animated flipInX">Hot Offer Today Only</h4>
                    </div>
                </div>  
                <div class="item"> <!-- Second-Slide -->
                    <img src="images/8.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <h3 data-animation="animated fadeInDown">Our Latest Fashion Editorials</h3>
                        <h4 data-animation="animated fadeInUp">Latest Stock Coming Soon</h4>
                    </div>
                </div> 
                <div class="item"><!-- Third-Slide -->
                    <img src="images/3.jpg" alt="" class="img-responsive"/>
                    <div class="carousel-caption kb_caption kb_caption_center">
                        <h3 data-animation="animated fadeInLeft">End Of Season Sale</h3>
                        <h4 data-animation="animated flipInX">Get exciting offer</h4>
                    </div>
                </div> 
            </div> 
            <!-- Left-Button -->
            <a class="left carousel-control kb_control_left" href="#kb" role="button" data-slide="prev">
				<span class="fa fa-angle-left kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a> 
            <!-- Right-Button -->
            <a class="right carousel-control kb_control_right" href="#kb" role="button" data-slide="next">
                <span class="fa fa-angle-right kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a> 
        </div>
		<script src="js/custom.js"></script>
	</div>
	<!-- //banner -->  
	<!-- welcome -->
	<div class="welcome"> 
		<div class="container"> 
			<div class="welcome-info">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
								<ul id="myTab" class=" nav-tabs" role="tablist">
					<%--	<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" >
							<i class="fa fa-laptop" aria-hidden="true"></i> 
							<h5>Accessories</h5>
						</a></li>--%>
						<li role="presentation"><a href="#carl" role="tab" id="carl-tab" data-toggle="tab"> 
							<i class="fa " aria-hidden="true">
                                <asp:Image ID="ImgFashion" runat="server" ImageUrl="~/images/lifestyle.png" style="height:128px;width:128px;" /> </i>
							<h5>Life Style</h5>
						</a></li>
						<%--<li role="presentation"><a href="#james" role="tab" id="james-tab" data-toggle="tab"> 
							<i  aria-hidden="true">
                                
                                <asp:Image ID="ImgPharma" runat="server" ImageUrl="~/images/agriculture.png" style="height:128px;width:128px;" />

							</i>
						
							<h5>Pharmacy</h5>
						</a></li>--%>
						<li role="presentation"><a href="#decor" role="tab" id="decor-tab" data-toggle="tab"> 
							<i  aria-hidden="true">
                                
                                <asp:Image ID="ImgAgriculture" runat="server" ImageUrl="~/images/pharmacy.png" style="height:128px;width:128px;" />

							</i>
						
							<h5>Agirculture</h5>
						</a></li>
						<li role="presentation"><a href="#sports" role="tab" id="sports-tab" data-toggle="tab"> 
							<i  aria-hidden="true">
                                <asp:Image ID="ImgVBasket" runat="server" ImageUrl="~/images/villagersbasket.png" style="height:128px;width:128px;" /> </i>

						
							<h5>Villager Basket</h5>
						</a></li> 
					</ul>
					<div class="clearfix"> </div>
					<h3 class="w3ls-title">Featured Products</h3>
					<div id="myTabContent" class="tab-content">

						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
							<div class="tabcontent-grids">  
								<div id="owl-demo" class="owl-carousel"> 
										<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f1.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">T Shirt</a></h4>
												<p>New collection available</p>
												<h5>Rs 800</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="T Shirt" /> 
													<input type="hidden" name="amount" value="10.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true" ></i>View Product</button>
												</form>
											</div>        
										</div>    
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f2.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Women Sandal</a></h4>
												<p>Nike</p>
												<h5>Rs 500</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Women Sandal" /> 
													<input type="hidden" name="amount" value="20.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f3.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Jewellery</a></h4>
												<p>PC Jewellers</p>
												<h5>Rs 600</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Jewellery" /> 
													<input type="hidden" name="amount" value="60.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f4.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Party dress</a></h4>
												<p>Comfortable Dress</p>
												<h5>Rs 700</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Party dress" /> 
													<input type="hidden" name="amount" value="15.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>      
										</div> 
									</div> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f1.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">T Shirt</a></h4>
												<p>Cool TShirt</p>
												<h5>Rs 400</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="T Shirt" /> 
													<input type="hidden" name="amount" value="10.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div>    
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f2.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Women Sandal</a></h4>
												<p>New Collection</p>
												<h5>Rs 900</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Women Sandal" /> 
													<input type="hidden" name="amount" value="20.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f3.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Jewellery</a></h4>
												<p>New Collection coming soon</p>
												<h5>Rs 600</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Jewellery" /> 
													<input type="hidden" name="amount" value="60.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f4.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Party dress</a></h4>
												<p>New Comfortable Dress</p>
												<h5>Rs 800</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Party dress" /> 
													<input type="hidden" name="amount" value="15.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>      
										</div> 
									</div>   
								</div> 
							</div>
						</div>
						
                        <div role="tabpanel" class="tab-pane fade" id="carl" aria-labelledby="carl-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo1").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });

								    });
								</script>
								<div id="owl-demo1" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f1.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">T Shirt</a></h4>
												<p>New collection available</p>
												<h5>Rs 800</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="T Shirt" /> 
													<input type="hidden" name="amount" value="10.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div>    
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f2.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Women Sandal</a></h4>
												<p>Nike</p>
												<h5>Rs 500</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Women Sandal" /> 
													<input type="hidden" name="amount" value="20.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f3.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Jewellery</a></h4>
												<p>PC Jewellers</p>
												<h5>Rs 600</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Jewellery" /> 
													<input type="hidden" name="amount" value="60.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f4.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Party dress</a></h4>
												<p>Comfortable Dress</p>
												<h5>Rs 700</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Party dress" /> 
													<input type="hidden" name="amount" value="15.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>      
										</div> 
									</div> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f1.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">T Shirt</a></h4>
												<p>Cool TShirt</p>
												<h5>Rs 400</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="T Shirt" /> 
													<input type="hidden" name="amount" value="10.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div>    
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f2.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Women Sandal</a></h4>
												<p>New Collection</p>
												<h5>Rs 900</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Women Sandal" /> 
													<input type="hidden" name="amount" value="20.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/f3.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Jewellery</a></h4>
												<p>New Collection coming soon</p>
												<h5>Rs 600</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Jewellery" /> 
													<input type="hidden" name="amount" value="60.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/f4.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Party dress</a></h4>
												<p>New Comfortable Dress</p>
												<h5>Rs 800</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Party dress" /> 
													<input type="hidden" name="amount" value="15.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>      
										</div> 
									</div>   
								</div>   
							</div>
						</div> 
						<div role="tabpanel" class="tab-pane fade" id="james" aria-labelledby="james-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo2").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });

								    });
								</script>
								<div id="owl-demo2" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/m1.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Dettol</a></h4>
												<p>New Collection</p>
												<h5>Rs 140</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Coffee Mug" /> 
													<input type="hidden" name="amount" value="14.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% </br> Off</h6></div>
											<a href="#"><img src="images/m2.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="#">B-Protin</a></h4>
												<p>New Item</p>
												<h5>Rs 200</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Teddy bear" /> 
													<input type="hidden" name="amount" value="20.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item"> 
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="ViewProducts.aspx"><img src="images/m3.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">ENO</a></h4>
												<p>More Available</p>
												<h5>Rs 160</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Chocolates" /> 
													<input type="hidden" name="amount" value="60.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/m4.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">ProtineX</a></h4>
												<p>Now Available</p>
												<h5>Rs 220</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Gift Card" /> 
													<input type="hidden" name="amount" value="22.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/m5.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Sugar Free</a></h4>
												<p>Now Available</p>
												<h5>Rs 140</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Coffee Mug" /> 
													<input type="hidden" name="amount" value="14.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="#"><img src="images/m2.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="#">B-Protin</a></h4>
												<p>New collection available</p>
												<h5>Rs 500</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Teddy bear" /> 
													<input type="hidden" name="amount" value="20.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item"> 
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="ViewProducts.aspx"><img src="images/m3.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">ENO</a></h4>
												<p>Now Available</p>
												<h5>Rs 160</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Chocolates" /> 
													<input type="hidden" name="amount" value="60.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/m4.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">ProtineX</a></h4>
												<p>Now Available</p>
												<h5>Rs 220</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Gift Card" /> 
													<input type="hidden" name="amount" value="22.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>       
										</div> 
									</div> 
								</div>    
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="decor" aria-labelledby="decor-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo3").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });

								    });
								</script>
								<div id="owl-demo3" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="ViewProducts.aspx"><img src="images/p3.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Phosphorous</a></h4>
												<p>New more varities available</p>
												<h5>Rs 200</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Wall Clock" /> 
													<input type="hidden" name="amount" value="80.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>10%<br>Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/p4.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Hybrid Seed</a></h4>
												<p>New Seed Available</p>
												<h5>Rs 340</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Plants & Vases" /> 
													<input type="hidden" name="amount" value="40.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/p3.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Amino Acid</a></h4>
												<p>Newly Arrived</p>
												<h5>Rs2500</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Queen Size Bed" /> 
													<input type="hidden" name="amount" value="250.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/p4.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Lawn Fertilizer</a></h4>
												<p>New Stock arrived</p>
												<h5>Rs 300</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="flower pot" /> 
													<input type="hidden" name="amount" value="30.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="ViewProducts.aspx"><img src="images/p3.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Phosphorous</a></h4>
												<p>Newly Arrived</p>
												<h5>Rs 800</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Wall Clock" /> 
													<input type="hidden" name="amount" value="80.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>10%<br>Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/p4.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Hybrid Seed</a></h4>
												<p>New Stock Arrived</p>
												<h5>Rs 400</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Plants & Vases" /> 
													<input type="hidden" name="amount" value="40.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/p3.jpg" alt="img" /></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Amino Acid</a></h4>
												<p>New Stock Arrived</p>
												<h5>Rs 250</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Queen Size Bed" /> 
													<input type="hidden" name="amount" value="250.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/p4.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Lawn Fertilizer</a></h4>
												<p>New Stock Arrived</p>
												<h5>Rs 300</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="flower pot" /> 
													<input type="hidden" name="amount" value="30.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>  
								</div>    
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="sports" aria-labelledby="sports-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo4").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });
								    });
								</script>
								<div id="owl-demo4" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/g1.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Coca Cola</a></h4>
												<p>Now Available</p>
												<h5>Rs 80</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Roller Skates"/> 
													<input type="hidden" name="amount" value="180.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="#"><img src="images/g2.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Chocolates</a></h4>
												<p>New Collection Arrived</p>
												<h5>Rs 700</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Football"/> 
													<input type="hidden" name="amount" value="70.00"/>
													<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% <br>Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/g3.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Snacks</a></h4>
												<p>New Collection Arrived</p>
												<h5>Rs 560</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Nylon Shuttle" /> 
													<input type="hidden" name="amount" value="56.00"/> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/g4.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Oats Meal</a></h4>
												<p>New collection arrived</p>
												<h5>Rs 480</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Cricket Kit" /> 
													<input type="hidden" name="amount" value="80.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="ViewProducts.aspx"><img src="images/g6.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Coffee</a></h4>
												<p>New collection arrived</p>
												<h5>Rs 180</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Roller Skates"/> 
													<input type="hidden" name="amount" value="180.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/g1.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Soft Drinks</a></h4>
												<p>New collection arrived</p>
												<h5>Rs 700</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Football"/> 
													<input type="hidden" name="amount" value="70.00"/>
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% <br>Off</h6></div>
											<a href="ViewProducts.aspx"><img src="images/g2.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Chocolates</a></h4>
												<p>New collection arrived</p>
												<h5>Rs 560</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Nylon Shuttle" /> 
													<input type="hidden" name="amount" value="56.00"/> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ViewProducts.aspx"><img src="images/g3.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="ViewProducts.aspx">Snacks</a></h4>
												<p>New collection arrived.</p>
												<h5>Rs 180</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="Cricket Kit" /> 
													<input type="hidden" name="amount" value="80.00" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i>View Product</button>
												</form>
											</div>       
										</div> 
									</div>
								</div>    
							</div>
						</div> 
					</div>   
				</div>  
			</div>  	
		</div>  	
	</div> 
	<!-- //welcome -->
	<!-- add-products -->
	<div class="add-products"> 
		<div class="container">  
			
		</div>  	
	</div>
	<!-- //add-products -->
	<!-- coming soon -->
	<div class="soon">
		<div class="container">
			<h3>Mega Deal Of the Week Coming Soon</h3>
			<h4>Don't Miss Out</h4>  
			<div id="countdown1" class="ClassyCountdownDemo"></div>
		</div> 
	</div>
	<!-- //coming soon -->
	<!-- deals -->
	<div class="deals"> 
		<div class="container"> 
			<h3 class="w3ls-title">DEALS OF THE DAY </h3>
			
           <div class="deals-row">

<%--	<div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn"> 
						<div class="focus-image"><i class="fa fa-mobile"></i></div>
						<h4 class="clrchg">Mobiles</h4> 
					</a>
				</div>
				<div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn wthree1"> 
						<div class="focus-image"><i class="fa fa-laptop"></i></div>
						<h4 class="clrchg"> Electronics & Appliances</h4> 
					</a>
				</div> 
				--%>
                <%--<div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-wheelchair"></i></div>
						<h4 class="clrchg">Medicine</h4>
					</a>
				</div>--%> 
				<div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-home"></i></div>
						<h4 class="clrchg">Villagers</h4>
					</a>
				</div> 

<%--	<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="#" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-book"></i></div>
						<h4 class="clrchg">Books & Music</h4> 
					</a>
				</div>--%>
				
                <div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="#" class="wthree-btn wthree4"> 
						<div class="focus-image"><i class="fa fa-asterisk"></i></div>
						<h4 class="clrchg">Fashion</h4>
					</a>
				</div>
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="#" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-gamepad"></i></div>
						<h4 class="clrchg">Kids</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="#" class="wthree-btn wthree"> 
						<div class="focus-image"><i class="fa fa-shopping-basket"></i></div>
						<h4 class="clrchg">Groceries</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="#" class="wthree-btn wthree5"> 
						<div class="focus-image"><i class="fa fa-medkit"></i></div>
						<h4 class="clrchg">Health</h4> 
					</a>
				</div> 

<%--<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="#" class="wthree-btn wthree1"> 
						<div class="focus-image"><i class="fa fa-car"></i></div>
						<h4 class="clrchg">xyz</h4> --%>
					</a>
				</div>
				
                <div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-cutlery"></i></div>
						<h4 class="clrchg">Edibles</h4> 
					</a>
				</div>
<%--								<div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn wthree5"> 
						<div class="focus-image"><i class="fa fa-futbol-o"></i></div>
						<h4 class="clrchg">Sports</h4> 
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-gamepad"></i></div>
						<h4 class="clrchg">Games & Toys</h4> 
					</a>
				</div> --%>
				<div class="col-md-3 focus-grid"> 
					<a href="#" class="wthree-btn "> 
						<div class="focus-image"><i class="fa fa-gift"></i></div>
						<h4 class="clrchg">Gifts</h4> 
					</a>
				</div> 
				<div class="clearfix"> </div>
			</div>  	

		</div>  	
	</div> 
	<!-- //deals --> 


</asp:Content>

