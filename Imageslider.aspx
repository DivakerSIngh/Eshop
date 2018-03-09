<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Imageslider.aspx.cs" Inherits="Imageslider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Smart Bazaar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

    
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style --> 
<link href="css/ken-burns.css" rel="stylesheet" type="text/css" media="all" /> <!-- banner slider --> 
<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" /> <!-- carousel slider -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet" /> 
<!-- //font-awesome icons -->
<!-- js -->
<%--<script src="js/jquery-2.2.3.min.js"></script> --%>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- //js --> 
<!-- web-fonts -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Offside' rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css' />
<!-- web-fon    ts --> 
<script src="js/owl.carousel.js"></script>  
<script>
    $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            autoPlay: 3000, //Set AutoPlay to 3 seconds 
            items: 4,
            itemsDesktop: [640, 5],
            itemsDesktopSmall: [480, 2],
            navigation: true

        });
    });
</script>
<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {

        // Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

        $('.header-two').scrollToFixed();
        // previous summary up the page.

        var summaries = $('.summary');
        summaries.each(function (i) {
            var summary = $(summaries[i]);
            var next = summaries[i + 1];

            summary.scrollToFixed({
                marginTop: $('.header-two').outerHeight(true) + 10,
                zIndex: 999
            });
        });
    });
</script>
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
	    $(document).ready(function () {

	        var defaults = {
	            containerID: 'toTop', // fading element id
	            containerHoverID: 'toTopHover', // fading element hover id
	            scrollSpeed: 1200,
	            easingType: 'linear'
	        };

	        $().UItoTop({ easingType: 'easeOutQuart' });

	    });
	</script>
	<!-- //smooth-scrolling-of-move-up -->
<script src="js/bootstrap.js"></script>	


<style>
* {box-sizing:border-box}
body {font-family: Verdana,sans-serif;margin:0}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor:pointer;
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
</head>
<body>

<!-- header -->
	<div class="header">
		<div class="w3ls-header"><!--header-one--> 
			<div class="w3ls-header-left">
				<p><a href="#"></a></p>
			</div>
			<div class="w3ls-header-right">
				<ul>
				<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle"><i  aria-hidden="true"></i> Sale On Villagers</a>
					</li> 
                    	<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i> My Account<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Login </a></li> 
							<li><a href="#">Sign Up</a></li> 
							<li><a href="#">My Orders</a></li>  
							
						</ul> 
					</li> 
					<li class="dropdown head-dpdn">
						<a href="http://realrights.in/IndexRR.aspx" class="dropdown-toggle" ><i class="fa fa-percent" aria-hidden="true"></i> Registration<span class=""></span></a>
						
					</li> 
					<li class="dropdown head-dpdn" >
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gift" aria-hidden="true"></i> Gift Cards<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Product Gift card</a></li> 
							<li><a href="#">Occasions Register</a></li>
							<li><a href="#">View Balance</a></li> 
						</ul> 
					</li> 
					<%--<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle"><i class="fa fa-map-marker" aria-hidden="true"></i> Track Order</a>
					</li> 
					--%><li class="dropdown head-dpdn" style="display:none;">
						<a href="#" class="dropdown-toggle"><i class="fa fa-credit-card-alt" aria-hidden="true"></i> Sale On Villagers</a>
					</li> 
					<li class="dropdown head-dpdn" >
						<a href="#" class="dropdown-toggle"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
					</li>
				</ul>
			</div>
			<div class="clearfix"> </div> 
		</div>
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
                    <asp:Image ID="ImgLogo" runat="server" ImageUrl="~/images/villagerslogo.png" />
				</div>	
				<div class="header-search">
					<form action="#" method="post">
						<input type="search" name="Search" placeholder="Search for a Product..." required="">
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<div class="header-cart" > 
					<div class="my-account" style="margin-top:4px;">
						<a href="#"><i aria-hidden="true"></i> <asp:Image ID="ImgNotify" runat="server" ImageUrl="~/images/notify.png" /></a>						
					</div>
					<div class="cart"> 
						<form action="#" method="post" class="last"> 
							<input type="hidden" name="cmd" value="_cart" />
							<input type="hidden" name="display" value="1" />
							<button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
						</form>  
					</div>
					<div class="clearfix"> </div> 
				</div> 
				<div class="clearfix"></div>
			</div>		
		</div><!-- //header-two -->
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">Store Categories</a>
						<nav class="cd-dropdown"> 
							<a href="#0" class="cd-close">Close</a>
							<ul class="cd-dropdown-content"> 
								<li><a href="#">Today's Offers</a></li>
								<li class="has-children">
									<a href="#">LifeStyle</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products.html">LifeStyle</a></li>
										<li class="has-children">
											<a href="#">Women</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All LifeStyle</a></li> 
												<li class="has-children">
													<a href="#0">NEW IN</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">NEW IN CLOTHING</a></li>
														<li><a href="#">NEW IN SHOES</a></li>
														<li><a href="#">NEW IN BAGS</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">CLOTHING</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">TOPS</a></li>
														<li><a href="#">TEES & SHIRTS</a></li>
														<li><a href="#">DRESSES & JUMPSUITS</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">ETHNIC WEAR</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">KURTAS & KURTIS</a></li>
														<li><a href="#">SUITS SETS</a></li>
														<li><a href="#">SAREES & DRESSES</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
                                                <li class="has-children">
													<a href="#0">BAGS</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">HANDBAGS</a></li>
														<li><a href="#">SLING BAGS</a></li>
														<li><a href="#">CLUTCHES</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
                                                <li class="has-children">
													<a href="#0">SHOES</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">FLATS </a></li>
														<li><a href="#">SANDALS</a></li>
														<li><a href="#">BOOTS</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
                                                 <li class="has-children">
													<a href="#0">ACCESSORIES</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">WATCHES </a></li>
														<li><a href="#">SUNGLASSES</a></li>
														<li><a href="#">EYE GLASSES</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
                                                <li class="has-children">
													<a href="#0">BEAUTY GROOMING</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">MAKE UP </a></li>
														<li><a href="#">SKIN CARE</a></li>
														<li><a href="#">HAIR CAREBATH & BODY</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
                                                <li class="has-children">
													<a href="#0">DAILY PICKS</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">AT WORK</a></li>
														<li><a href="#">PARTY</a></li>
														<li><a href="#">CAMPUS</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>

												<li><a href="#">LINGERIE & NIGHTWEAR</a></li>
                                                <li><a href="#">THE WINTER WRAP</a></li>
                                                <li><a href="#">BRANDS</a></li>
                                                <li><a href="#">INTERNATIONAL BRANDS</a></li>
                                                <li><a href="#">DESIGNERS</a></li>
                                                <li><a href="#">BOUTIQUES</a></li>
                                                <li><a href="#">FASHION JEWELLERY</a></li>
                                                <li><a href="#">CLEARANCE SALE</a></li>
                                                <li><a href="#">UNDER 999/- STORE</a></li>
                                                
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">MEN</a> 
											<ul class="is-hidden"> 
												 <li class="has-children">
													<a href="#0">NEW IN</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">NEW IN CLOTHING</a></li>
														<li><a href="#">NEW IN SHOES</a></li>
														<li><a href="#">NEW IN BAGS</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">SHOES</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">SPORTS SHOES</a></li>
														<li><a href="#">SNEAKERS</a></li>
														<li><a href="#">CASUAL SHOES</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">CLOTHING</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">POLOS & TEES</a></li>
														<li><a href="#">CASUAL</a></li>
														<li><a href="#">SHIRTS</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">WATCHES</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">ANALOG</a></li>
														<li><a href="#">CHRONOGRAPH</a></li>
														<li><a href="#">DIGITAL</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">BAGS</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">BACKPACKS</a></li>
														<li><a href="#">WALLETS</a></li>
														<li><a href="#">LAPTOP</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li><a href="#">View All Mens Category</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">KIDS</a> 
											<ul class="is-hidden"> 
												<li class="has-children">
													<a href="#0">BOYS CLOTHING</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">POLOS & TEES</a></li>
														<li><a href="#">SHIRTS</a></li>
														<li><a href="#"> JEANS & TROUSERS</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li><a href="#">BOYS SHOES</a></li>
												<li><a href="#">ACCESSORIES</a></li>
												<li><a href="#">GIRLS SHOES</a></li>
												<li><a href="#">KIDS HOME FASHION</a></li>
												<li class="has-children">
													<a href="#">GIRLS CLOTHING</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li> 
														<li><a href="#">TOPS & TUNICS </a></li>
														<li><a href="#">SHORTS & CAPRIS</a></li>
														<li><a href="#">TWIN SETS</a></li>
														<li><a href="#">JEANS & TROUSERS</a></li>
														<li><a href="#">LEGGINGS</a></li>
														<li><a href="#">View All</a></li>
													</ul>
												</li> 
                                                <li><a href="#">View All</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">ACCESSORIES</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#0">LifeStyle</a></li>
												<li class="has-children"><a href="#">WOMEN BAGS</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#0"> </a></li>
														<li><a href="#">HAND BAGS</a></li>
														<li><a href="#">SLING BAGS</a></li>
														<li><a href="#">CLUTCHES</a></li>
														<li><a href="#">BACKPACKS</a></li>
														<li><a href="#">WALLET & PURSES</a></li>
														<li><a href="#">View All</a></li>
													</ul>
												</li>
												<li><a href="#">WOMEN WATCHES</a></li>
												<li><a href="#">WOMEN SUNGLASSES</a></li>
												<li><a href="#">WOMEN BELTSWOMEN BEAUTY</a></li>
												<li><a href="#">FASHION JEWELLERY</a></li>
												<li><a href="#">MEN BAGS</a></li> 
												<li><a href="#">View All</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">BRANDS</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#0">LifeStyle</a></li>
												<li><a href="#">INTERNATIONAL</a></li>
												<li><a href="#">FEATURED</a></li>
											
												<li><a href="#">BOUTIQUES</a></li>
												<li><a href="#">VILLAGERS</a></li>
												<li><a href="#">View All</a></li>  
											</ul>
										</li>
										<li class="has-children">
											<a href="#">SPORTS</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#0">LifeStyle </a></li>
												<li><a href="#">MEN SHOES</a></li> 
												<li><a href="#">MEN CLOTHING</a></li>
												<li><a href="#">WOMEN SHOES</a></li>
												<li><a href="#">Health Care</a></li> 
												<li><a href="#">View All</a></li>
											</ul>
										</li>
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->
								<li class="has-children">
									<a href="#">Pharma</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="#">Pharma</a></li>
										<li class="has-children">
											<a href="#">Prescription</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Pharma</a></li> 
												<li class="has-children">
													<a href="#0">Acne</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Anti-Convulsant</a></li>
														<li><a href="#">Pain Relievers</a></li>
														<li><a href="#">Analgesic</a></li>
                                                        <li><a href="#">Anti-Depresant</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Anti-Convulsant</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Anti-Convulsant</a></li>
														<li><a href="#">Pain Relievers</a></li>
														<li><a href="#">Analgesic</a></li>
                                                        <li><a href="#">Anti-Depresant</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Pain Relievers</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Anti-Convulsant</a></li>
														<li><a href="#">Pain Relievers</a></li>
														<li><a href="#">Analgesic</a></li>
                                                        <li><a href="#">Anti-Depresant</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Analgesic</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Anti-Convulsant</a></li>
														<li><a href="#">Pain Relievers</a></li>
														<li><a href="#">Analgesic</a></li>
                                                        <li><a href="#">Anti-Depresant</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Anti-Depresant</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Anti-Convulsant</a></li>
														<li><a href="#">Pain Relievers</a></li>
														<li><a href="#">Analgesic</a></li>
                                                        <li><a href="#">Anti-Depresant</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Diabetes</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Pharma</a></li> 
												<li class="has-children">
													<a href="#0">Nutrition</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Supplement</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Blood Glusoce</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Diabetes Medicationt</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">ED/Impotence</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Prescription</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Pharma</a></li> 
												<li class="has-children">
													<a href="#0">PFizer</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Medication</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Lupin</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">AntiBiotics</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Novartis</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Wellness</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Pharma</a></li> 
												<li class="has-children">
													<a href="#0">Fitness</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Supplement</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Speciality</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Nutrition</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Supplement</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">OTC</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">First Aid</a></li>
												<li><a href="products1.html">Helath Care</a></li>
												<li><a href="products1.html">Lipsticks & Nail Polish</a></li>
												<li><a href="products1.html">Beauty Gift Hampers</a></li> 
												<li><a href="products1.html">Personal Grooming</a></li>
												<li><a href="products1.html">Travel bags</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">PERSONAL CARE</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Face Care</a></li>
												<li><a href="products1.html">Nail Care</a></li>
												<li><a href="products1.html">Hair Care</a></li>
												<li><a href="products1.html">Body Care</a></li>
												<li><a href="products1.html">Bath & Spa</a></li>   
											</ul>
										</li>
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->
								<li class="has-children">
									<a href="#">Villagers Basket</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="#">Villagers Basket</a></li>
										<li class="has-children">
											<a href="#">Beverages</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Beverage</a></li> 
												<li class="has-children">
													<a href="#0">Energy Drinks</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Energy Drinks</a></li>
														<li><a href="#">Health Drinks</a></li>
														<li><a href="#">Mineral Water</a></li>
                                                        <li><a href="#">Soft Drinks</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Tea Coffee</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Lemon Tea</a></li>
														<li><a href="#">Green Tea</a></li>
														<li><a href="#">Limpton Tea</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Fruit Drinks</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Fruit Drinks</a></li>
														<li><a href="#">Jucies</a></li>
														<li><a href="#">Soft Drinks</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Organic Beverages</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Mineral Water</a></li>
														<li><a href="#">Fruit Drinks</a></li>
														<li><a href="#">Juices</a></li>
														<li><a href="#">Soft Drinks</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Juices</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Mineral Water</a></li>
														<li><a href="#">Fruit Drinks</a></li>
														<li><a href="#">Juices</a></li>
														<li><a href="#">Soft Drinks</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Biscuit and Snacks</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Snacks</a></li> 
												<li class="has-children">
													<a href="#0">Snacks</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Biscuit</a></li>
														<li><a href="#">Cakes</a></li>
														<li><a href="#">Bakery Biscuits</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Cakes</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Biscuit</a></li>
														<li><a href="#">Cakes</a></li>
														<li><a href="#">Bakery Biscuits</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Dairy Imported</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Biscuit</a></li>
														<li><a href="#">Cakes</a></li>
														<li><a href="#">Bakery Biscuits</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Baking Needs</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Biscuit</a></li>
														<li><a href="#">Cakes</a></li>
														<li><a href="#">Bakery Biscuits</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Jam and Honey</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Biscuit</a></li>
														<li><a href="#">Cakes</a></li>
														<li><a href="#">Bakery Biscuits</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Grocery </a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Grocery</a></li> 
												<li class="has-children">
													<a href="#0">Dal and Pulse</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Dal</a></li>
														<li><a href="#">Flours</a></li>
														<li><a href="#">Sooji</a></li>
                                                        <li><a href="#">Masalas</a></li>
                                                        <li><a href="#">Spices</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Flours</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Dal</a></li>
														<li><a href="#">Flours</a></li>
														<li><a href="#">Sooji</a></li>
                                                        <li><a href="#">Masalas</a></li>
                                                        <li><a href="#">Spices</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Organic Staples</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Dal</a></li>
														<li><a href="#">Flours</a></li>
														<li><a href="#">Sooji</a></li>
                                                        <li><a href="#">Masalas</a></li>
                                                        <li><a href="#">Spices</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Edible Oils</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Dal</a></li>
														<li><a href="#">Flours</a></li>
														<li><a href="#">Sooji</a></li>
                                                        <li><a href="#">Masalas</a></li>
                                                        <li><a href="#">Spices</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Ghee</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Dal</a></li>
														<li><a href="#">Flours</a></li>
														<li><a href="#">Sooji</a></li>
                                                        <li><a href="#">Masalas</a></li>
                                                        <li><a href="#">Spices</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Bread Dairy</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Grocery</a></li> 
												<li class="has-children">
													<a href="#0">Bread Dairy</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Brown Bread</a></li>
														<li><a href="#">Eggs</a></li>
														<li><a href="#">Fresh Foods</a></li>
                                                        <li><a href="#">Meals</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Dairy Products </a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Brown Bread</a></li>
														<li><a href="#">Eggs</a></li>
														<li><a href="#">Fresh Foods</a></li>
                                                        <li><a href="#">Meals</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Eggs</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Brown Bread</a></li>
														<li><a href="#">Eggs</a></li>
														<li><a href="#">Fresh Foods</a></li>
                                                        <li><a href="#">Meals</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Fresh Food</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Brown Bread</a></li>
														<li><a href="#">Eggs</a></li>
														<li><a href="#">Fresh Foods</a></li>
                                                        <li><a href="#">Meals</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Meals</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Brown Bread</a></li>
														<li><a href="#">Eggs</a></li>
														<li><a href="#">Fresh Foods</a></li>
                                                        <li><a href="#">Meals</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">BEAUTY</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Perfumes & Deos</a></li>
												<li><a href="products1.html">Lipsticks & Nail Polish</a></li>
												<li><a href="products1.html">Beauty Gift Hampers</a></li> 
												<li><a href="products1.html">Personal Grooming</a></li>
												<li><a href="products1.html">Travel bags</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">PERSONAL CARE</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Face Care</a></li>
												<li><a href="products1.html">Nail Care</a></li>
												<li><a href="products1.html">Hair Care</a></li>
												<li><a href="products1.html">Body Care</a></li>
												<li><a href="products1.html">Bath & Spa</a></li>   
											</ul>
										</li>
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children --> 
								<li class="has-children">
									<a href="#">Agriculture</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="#">Agriculture</a></li>
										<li class="has-children">
											<a href="#">Seeds</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Hybrid Crop</a></li> 
												<li class="has-children">
													<a href="#0">Hybrid Crop</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Paddy</a></li>
														<li><a href="#">Cotton</a></li>
														<li><a href="#">Sorghum</a></li>
                                                        <li><a href="#">Bajara</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Hybrid Vegetables</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Bhindi</a></li>
														<li><a href="#">Bitter Gourd</a></li>
														<li><a href="#">Bottle Gourd</a></li>
                                                        <li><a href="#">View All</a></li>
													</ul>
												</li>
												<li class="has-children">
													<a href="#0">Selection verities</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Musturd</a></li>
														<li><a href="#">Paddy</a></li>
														<li><a href="#">Sorghum-Groud</a></li>
													</ul>
												</li>
												<li class="">
													<a href="#0">Research Wheats</a> 
												</li>
												<li class="">
													<a href="#0">Wheat Super</a> 
												<%--	<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Anti-Convulsant</a></li>
														<li><a href="#">Pain Relievers</a></li>
														<li><a href="#">Analgesic</a></li>
                                                        <li><a href="#">Anti-Depresant</a></li>
													</ul>--%>
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Basic Nutritions</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Mop</a></li> 
												<li class="">
													<a href="#0">MOP</a> 
													<%--<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>--%>
												</li>
												<li class="">
													<a href="#0">urea</a> 
												<%--	<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="#">Blood Glusoce</a></li>
														<li><a href="#">Diabetes Medication</a></li>
														<li><a href="#">ED/Impotence</a></li>
													</ul>--%>
												</li>
												<li class="">
													<a href="#0">Phosphate</a> 
												
												</li>
												<li class="">
													<a href="#0">Granule</a> 
												
												</li>
												<li class="">
													<a href="#0">Super +B</a> 
												</li>
                                                <li class="">
													<a href="#0">Super +ZN</a> 
												</li>
                                                <li class="">
													<a href="#0">Urja Mix</a> 
												</li>
                                                <li class="">
													<a href="#0">DAP</a> 
												</li>
                                                <li class="">
													<a href="#0">Urea:Neem Coated</a> 
												</li>
                                                <li class="">
													<a href="#0">Urja Mix</a> 
												</li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Yield Enhancers</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Yield Enhancers</a></li> 
												<li class="">
													<a href="#0">Micro Nutrients </a> 
												</li>
												<li class="">
													<a href="#0">Bio stimulants</a> 
												</li>
												<li class="">
													<a href="#0">Water soluble fertilizers</a> 
												</li>
												<li class="">
													<a href="#0">Secondary Nutrients</a> 
												</li>
												
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Crop Protection</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">Crop Protection</a></li> 
												<li class="">
													<a href="#0">Insecticides</a> 
												</li>
												<li class="">
													<a href="#0">Seeds care</a> 
												</li>
												<li class="">
													<a href="#0">Fungicides</a> 
												</li>
												<li class="">
													<a href="#0">Herbicides</a> 
												</li>
											</ul>
										</li> 
										
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->  
								
							</ul> <!-- .cd-dropdown-content -->
						</nav> <!-- .cd-dropdown -->
					</div> <!-- .cd-dropdown-wrapper -->	 
				</div>
				<div class="move-text">
					<div class="marquee"><a href="offers.html"> New collections are available here...... <span>Get extra 10% off on everything | no extra taxes </span> <span> Try shipping pass free for 15 days with unlimited</span></a></div>
					<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
					<script>
					    $('.marquee').marquee({ pauseOnHover: true });
					    //@ sourceURL=pen.js
					</script>
				</div>
			</div>
		</div>
	</div>
	<!-- //header -->	

    <form id="form1" runat="server">
    <div style="width:100%;">
    <div style="width:70%;">
    <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
   <asp:Image ID="Image1" runat="server" style="width:100%;height:100%; display:block;" ImageUrl="~/images/8.jpg" />
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
    <asp:Image ID="Image2" runat="server" style="width:100%;height:100%;display:block;" ImageUrl="~/images/5.jpg" />
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
    <asp:Image ID="Image3" runat="server" style="width:100%;height:100%;display:block;" ImageUrl="~/images/3.jpg" />
  <div class="text">Caption Three</div>
</div>

        
<div class="mySlides fade">
  <div class="numbertext">4 / 7</div>
    <asp:Image ID="Image4" runat="server" style="width:100%;height:100%;" ImageUrl="~/images/a1.png" />
  <div class="text">Caption Four</div>
</div>

        
<div class="mySlides fade">
  <div class="numbertext">5 / 7</div>
    <asp:Image ID="Image5" runat="server" style="width:100%;height:100%;" ImageUrl="~/images/a2.png" />
  <div class="text">Caption Five</div>
</div>

        
<div class="mySlides fade">
  <div class="numbertext">6 / 7</div>
    <asp:Image ID="Image6" runat="server" style="width:100%;height:100%;" ImageUrl="~/images/a3.png" />
  <div class="text">Caption Six</div>
</div>

        
<div class="mySlides fade">
  <div class="numbertext">7 / 7</div>
    <asp:Image ID="Image7" runat="server" style="width:100%;height:100%;" ImageUrl="~/images/a4.pg" />
  <div class="text">Caption Seven</div>
</div>
<a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a>

</div>
<br />

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
</script>

    </div>
        <div style="width:30%;">
    
    </div>
    </div>
    </form>
    	<!-- footer-top -->
	<div class="w3agile-ftr-top">
		<div class="container">
			<div class="ftr-toprow">
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-truck" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>FREE DELIVERY</h4>
						<p>On Select Places Only!!</p>
					</div> 
					<div class="clearfix"> </div>
				</div> 
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-user" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>CUSTOMER CARE</h4>
						<p>We are there for you all the time. </p>
					</div> 
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>GOOD QUALITY</h4>
						<p>Best Quality is delivered to our customer.</p>
					</div>
					<div class="clearfix"> </div>
				</div> 
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //footer-top --> 
	<!-- subscribe -->
	<div class="subscribe"> 
		<div class="container">
			<div class="col-md-6 social-icons w3-agile-icons">
				<h4>Keep in touch</h4>  
				<ul>
					<li><a href="https://www.facebook.com/" class="fa fa-facebook icon facebook"> </a></li>
					<li><a href="https://twitter.com/" class="fa fa-twitter icon twitter"> </a></li>
					<li><a href="https://plus.google.com/" class="fa fa-google-plus icon googleplus"> </a></li>
					<li><a href="#" class="fa fa-dribbble icon dribbble"> </a></li>
					<li><a href="#" class="fa fa-rss icon rss"> </a></li> 
				</ul> 
				<ul class="apps"> 
					<li><h4>Download Our app : </h4> </li>
					<%--<li><a href="#" class="fa fa-apple"></a></li>
					<li><a href="#" class="fa fa-windows"></a></li>--%>
					<li><a href="#" class="fa fa-android"></a></li>
				</ul> 
			</div> 
			<div class="col-md-6 subscribe-right">
				<h4>Sign up for email and get 25%off!</h4>  
				<form action="#" method="post"> 
					<input type="text" name="email" placeholder="Enter your Email..." required="">
					<input type="submit" value="Subscribe">
				</form>
				<div class="clearfix"> </div> 
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //subscribe --> 
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-4 address-left agileinfo">
					<div class="footer-logo header-logo">
	 <asp:Image ID="ImageLogo" runat="server" ImageUrl="~/images/villagerslogo.png" />
					</div>
					<ul>
						<li><i class="fa fa-map-marker"></i> Corporate office: - C-55, Sector-10, Noida, U.P-201301</li>
						<li><i class="fa fa-mobile"></i> +91-120-4917002 </li>
						<li><i class="fa fa-envelope-o"></i><a href="Info@villagers.online"> Info@villagers.online</a></li>
					</ul> 
				</div>
				<div class="col-md-8 address-right">
						<div class="col-md-4 footer-grids">
						<h3>Company</h3>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Contact Us</a></li>  
							<li><a href="#">Career</a></li>  
							<li><a href="#">Affiliates</a></li>
                            <li><a href="#">FAQ</a></li>
						</ul>
					</div>
					<div class="col-md-4 footer-grids">
						<h3>Our Policies</h3>
						<ul>
							<li><a href="#">Terms and Conditions</a></li>
							<li><a href="#">Privacy Policy</a></li> 
							
						</ul> 
                        <br />
                        <h4 style="color:white;">Offers and Rewards</h4>
						<ul>
							<li><a href="#">Deal of the Day</a></li>
							<li><a href="#">Special Offer</a></li>  
						</ul>
					</div>
					<div class="col-md-4 footer-grids">
						<h3>Payment Methods</h3>
						<ul>
							<li><i class="fa fa-laptop" aria-hidden="true"></i> Net Banking</li>
							<li><i class="fa fa-money" aria-hidden="true"></i> Cash On Delivery</li>
							
							<li><i class="fa fa-gift" aria-hidden="true"></i> E-Gift Voucher</li>
							<li><i class="fa fa-credit-card" aria-hidden="true"></i> Debit/Credit Card</li>
						</ul>  
					</div>
				<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //footer -->		
	<div class="copy-right"> 
		<div class="container">
			<p>© 2017 Villagers . All rights reserved | </p>
		</div>
	</div> 
	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
	    w3ls.render();

	    w3ls.cart.on('w3sb_checkout', function (evt) {
	        var items, len, i;

	        if (this.subtotal() > 0) {
	            items = this.items();

	            for (i = 0, len = items.length; i < len; i++) {
	                items[i].set('shipping', 0);
	                items[i].set('shipping2', 0);
	            }
	        }
	    });
    </script>  
	<!-- //cart-js -->	
	<!-- countdown.js -->	
	<script src="js/jquery.knob.js"></script>
	<script src="js/jquery.throttle.js"></script>
	<script src="js/jquery.classycountdown.js"></script>
		<script>
		    $(document).ready(function () {
		        $('#countdown1').ClassyCountdown({
		            end: '1388268325',
		            now: '1387999995',
		            labels: true,
		            style: {
		                element: "",
		                textResponsive: .5,
		                days: {
		                    gauge: {
		                        thickness: .10,
		                        bgColor: "rgba(0,0,0,0)",
		                        fgColor: "#1abc9c",
		                        lineCap: 'round'
		                    },
		                    textCSS: 'font-weight:300; color:#fff;'
		                },
		                hours: {
		                    gauge: {
		                        thickness: .10,
		                        bgColor: "rgba(0,0,0,0)",
		                        fgColor: "#05BEF6",
		                        lineCap: 'round'
		                    },
		                    textCSS: ' font-weight:300; color:#fff;'
		                },
		                minutes: {
		                    gauge: {
		                        thickness: .10,
		                        bgColor: "rgba(0,0,0,0)",
		                        fgColor: "#8e44ad",
		                        lineCap: 'round'
		                    },
		                    textCSS: ' font-weight:300; color:#fff;'
		                },
		                seconds: {
		                    gauge: {
		                        thickness: .10,
		                        bgColor: "rgba(0,0,0,0)",
		                        fgColor: "#f39c12",
		                        lineCap: 'round'
		                    },
		                    textCSS: ' font-weight:300; color:#fff;'
		                }

		            },
		            onEndCallback: function () {
		                console.log("Time out!");
		            }
		        });
		    });
		</script>
	<!-- //countdown.js -->
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster --> 



















</body>
</html>
