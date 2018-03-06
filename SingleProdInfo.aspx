<%@ Page Title="Product Info" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="SingleProdInfo.aspx.cs" Inherits="SingleProdInfo" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> 
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
    <!-- //Custom Theme files -->
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet"> 
    <!-- //font-awesome icons -->
    <!-- js -->
    <script src="js/jquery-2.2.3.min.js"></script> 
    <script src="js/owl.carousel.js"></script>
   
    <!--flex slider-->
    
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <style>
        a.myProLink:hover , a.myProLink:focus {
            color: white;
        }
       #btnReview {
            margin-left: -1px;
    margin-top: 10px;
        }
    </style>
    <script>
        if (localStorage.getItem('postalCode') != "") {
            document.getElementById("hf_user_pincode").value = localStorage.getItem('postalCode');
        }
    </script>

     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyAPGIvYpvs7ETQHWcfHnJjLBLH5XNF0OZs"></script>                  
     <script type="text/javascript">
        <!--
            function GetLocationUsingPincode(pincode) {
                var geocoder = new google.maps.Geocoder();
                //var address = document.getElementById("txtAddress").value;
                geocoder.geocode({ 'address': pincode }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();

                        document.getElementById("hf_latitute1").value = latitude;
                        document.getElementById("hf_longitute1").value = longitude;
                        //alert("Latitude: " + latitude + "\nLongitude: " + longitude);
                    } else {
                        //alert("Request failed.")
                    }
                });
            };

            function GetLocationUsingPincode1(pincode) {
                var geocoder = new google.maps.Geocoder();
                //var address = document.getElementById("txtAddress").value;
                geocoder.geocode({ 'address': pincode }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();

                        document.getElementById("hf_latitute2").value = latitude;
                        document.getElementById("hf_longitute2").value = longitude;
                        //alert("Latitude: " + latitude + "\nLongitude: " + longitude);
                    } else {
                        //alert("Request failed.")
                    }
                });
            };
            //-->
        </script>
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function () {
            
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
            if ($('#hdnProductStatusid').val() != "") {
                $('#btnReview').show();
            } else {
                $('#btnReview').hide();
            }
            
        });
        function clickReview() {
            
            $('#userControlProduct').val($('#hdnProductStatusid').val());
            $('#headingProduct').text('Product Review For:' + $('#hdnProductStatusid').val().split('~')[2])
            $('#myModal').modal('show');
        }
        $(function () {
            

              var productId='<%=Request.QueryString["pid"]%>'
            var param = { productId: productId };
            if (productId != "") {
                $.ajax({
                    url: "SingleProdInfo.aspx/getReviewList",
                    data: JSON.stringify(param),
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        debugger
                        var ratingHtml = "<span><i class='fa fa-star'></i></span>"
                        var html = "";
                        $('#spnReviewCount').text('Review (' + data.d.length + ')')
                        $(data.d).each(function (index, item) {
                            switch (item.rating) {
                                case 1:
                                    ratingHtml = "<span><i class='fa fa-star'></i></span>"
                                    break;
                                case 2:
                                    ratingHtml = "<span><i class='fa fa-star'><i class='fa fa-star'></i></i></span>"
                                    break;
                                case 3:
                                    ratingHtml = "<span><i class='fa fa-star'><i class='fa fa-star'></i><i class='fa fa-star'></i></i></span>"
                                    break;
                                case 4:
                                    ratingHtml = "<span><i class='fa fa-star'><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i></i></span>"
                                    break;
                                case 5:
                                    ratingHtml = "<span><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i></span>"
                                    break;

                            }


                            html = html + '<div class="row"><div class="main"></div><span>' + ratingHtml + '</span><p class="_2xg6Ul" data-reactid="757">' + item.productName + '</p></div><div class="row"><div class="qwjRop">' +
                                                      '<div><div>' + item.review + '</div><span class="_1EPkIx"></span></div></div></div><div class="row"><p>' + item.user_name + '</p></div>';

                        })
                        $('#divReview').html(html)


                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        var err = eval("(" + XMLHttpRequest.responseText + ")");

                    }
                });
            }
            

        })
    </script>
    <style>
        #divReview{
            padding: 32px;
        }
    .loader {
     border: 4px solid #f3f3f3;
    border-radius: 50%;
    border-top: 4px solid #3498db;
    width: 25px;
    height: 25px;
    -webkit-animation: spin 2s linear infinite;
    animation: spin 2s linear infinite;
    left: 42%;
    position: absolute;
    margin: -27px 0px 0px 0px;
    }

    /* Safari */
    @-webkit-keyframes spin {
      0% { -webkit-transform: rotate(0deg); }
      100% { -webkit-transform: rotate(360deg); }
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
</style>
    <!--flex slider-->
    <script src="js/imagezoom.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hf_ddl_Value" runat="server" />
    <asp:HiddenField ID="hf_logistic_id" runat="server" />
    <asp:HiddenField ID="hf_user_pincode" runat="server" />
    <asp:HiddenField ID="hf_latitute1" runat="server" />
    <asp:HiddenField ID="hf_longitute1" runat="server" />
     <asp:HiddenField ID="hf_latitute2" runat="server" />
    <asp:HiddenField ID="hf_longitute2" runat="server" />
    <asp:HiddenField ID="hf_deliveryAmt" runat="server" />
    <!-- breadcrumbs -->
    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href="#">Home</a></li>
            <li class="active">Single Page</li>
        </ol>
        <div class="clearfix"></div>
    </div>
    <!-- //breadcrumbs -->
    <!-- products -->
    <div class="products">
        <div class="container">
            <div class="single-page">
                <div class="single-page-row" id="detail-21">
                    <asp:HiddenField ID="hdnProductStatusid" runat="server" ClientIDMode="Static" />

                    <div class="col-md-6 single-top-left">
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="" id="img11" runat="server">
                                    <div class="thumb-image detail_images">
                                        <img src="" id="img1" runat="server" data-imagezoom="true" class="img-responsive" alt="" />
                                    </div>
                                </li>
                                <li data-thumb="" id="img12" runat="server">
                                    <div class="thumb-image">
                                        <img src="" id="img2" runat="server" data-imagezoom="true" class="img-responsive" alt="" />
                                    </div>
                                </li>
                                <li data-thumb="" id="img13" runat="server">
                                    <div class="thumb-image">
                                        <img src="" id="img3" runat="server" data-imagezoom="true" class="img-responsive" alt=""/>
                                    </div>
                                </li>
                                <li data-thumb="" id="img14" runat="server">
                                    <div class="thumb-image">
                                        <img src="" data-imagezoom="true" id="img4" runat="server" class="img-responsive" alt="" />
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                <div class="col-md-6 single-top-right">
                    <asp:UpdatePanel ID="up1" runat="server">
                        
                        <ContentTemplate>
                           
                       
                    <asp:DataList ID="dlProdInfo" runat="server" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="6" OnItemDataBound="dlProdInfo_ItemDataBound">

                        <ItemTemplate>
                                <h3 class="item_name">
                                    <asp:Label ID="lblHeaderTitle" runat="server" Text='<%# Eval("HeaderTitle") %>' ></asp:Label></h3>
                            <asp:HiddenField id="hdnSubCid" runat="server"  Value='<%# Eval("SubCId") %>'/>
                                <%--<p>Processing Time: Item will be shipped out within 2-3 working days. </p>--%>
                                <div class="single-rating">
                                    <%--<ul>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li class="rating">20 reviews</li>
                                        <li><a href="#">Add your review</a></li>
                                    </ul>--%>
                                </div>
                                <div class="single-price">
                                    <ul>
                                        <li>
                                           &#8377;<asp:Label ID="lblSP" runat="server" Text='<%# Eval("SellingPrice") %>'></asp:Label></li>
                                        <li><del>
                                            &#8377;<asp:Label ID="lblCP" runat="server" Text='<%# Eval("CostPrice") %>'></asp:Label></del></li>
                                        <li><span class="w3off">
                                            <asp:Label ID="LblDiscount" runat="server" Text='<%# System.Convert.ToString(Eval("discount")).Length > 2 ? System.Convert.ToString(Eval("discount")).Substring(0,4) : Eval("discount") %>'></asp:Label>% OFF</span></li>
                                        <%--<li>Ends on: June,5th</li>
                                        <li><a href="#"><i class="fa fa-gift" aria-hidden="true"></i>Coupon</a></li>--%>
                                    </ul>
                                </div>
                            <div class="size-dropdown"><label>Seller Name: &nbsp;</label><asp:Label ID="lblRname" runat="server" Text='<%# Eval("org_name") %>'></asp:Label></div>

                                 <div class="size-dropdown">
                                     <label>Choose Size: &nbsp;</label>
                                     <asp:DropDownList ID="ddlSize" runat="server" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged" AutoPostBack="true">

                                     </asp:DropDownList>
                                   
                                     <asp:UpdateProgress runat="server">
                                    <ProgressTemplate>
                                    <span>
                                        <div class="loader"></div>
                                    </span>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                                 </div>

                             <div class="size-dropdown">
                                     <label>Return policy: &nbsp;</label>
                                     <asp:Label ID="Label1" Text='<%#Eval("returnpolicy") %>' ForeColor="Red" runat="server"></asp:Label>
                                 </div>
                            <div class="input-group message" style="margin-top:20px;color: red">
                                <asp:Label ID="lblPincodeMsg" runat="server" Visible="false"></asp:Label>
                            </div>    
                            <div class="input-group pin-locate">
                                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="enter pincode" style="z-index:auto;" TextMode="Number" ></asp:TextBox><br />
                                    <div class="input-group-btn">
                                        <asp:LinkButton ID="btnCheckPincode" class="btn btn-primary" runat="server" CommandArgument='<%# Eval("Pincode") %>' OnCommand="btnCheckPincode_Command">Check Pincode</asp:LinkButton>
                                        <asp:Label ID="lblPincode" runat="server" Text='<%# Eval("Pincode") %>'></asp:Label>
                                        <asp:Label ID="lblWt" Visible="false" runat="server" Text='<%# Eval("weight") %>'></asp:Label>
                                    </div>
                           
                                </div>

                            <asp:Label ID="lblcid" runat="server" Text='<%# Eval("cid") %>' Visible="false"></asp:Label>
                                <asp:LinkButton ID="btnAddCart" class="w3ls-cart" runat="server" CommandArgument='<%# Eval("pid")+","+Eval("UserId")+","+Eval("sellingprice")+","+Eval("costprice") %>' OnCommand="btnAddCart_Command1"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</asp:LinkButton>


                                <asp:LinkButton ID="btnAddWishList" class="w3ls-cart w3ls-cart-like" runat="server" CommandArgument='<%# Eval("pid")+","+Eval("UserId")+","+Eval("sellingprice")+","+Eval("costprice") %>' OnCommand="btnAddWishList_Command"><i class="fa fa-heart-o" aria-hidden="true"></i>Add to Wishlist</asp:LinkButton>

                            <a id="btnReview" onclick="clickReview();" class="w3ls-cart w3ls-cart-like">Review</a>
                               
                            
                        </ItemTemplate>
                    </asp:DataList>
                             </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                    <div class="clearfix"></div>
                </div>
                <%--<div class="single-page-icons social-icons">
                    <ul>
                        <li>
                            <h4>Share on</h4>
                        </li>
                        <li><a href="#" class="fa fa-facebook icon facebook"></a></li>
                        <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
                        <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
                        <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                        <li><a href="#" class="fa fa-rss icon rss"></a></li>
                    </ul>
                </div>--%>
            </div>
          

            <!-- collapse-tabs -->
            <%--    <div class="collpse tabs">
                <h3 class="w3ls-title">About this item</h3>
                <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i>Description <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="fa fa-info-circle fa-icon" aria-hidden="true"></i>additional information <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i>reviews (5) <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                                <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <i class="fa fa-question-circle fa-icon" aria-hidden="true"></i>help <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>

            <asp:DataList ID="ddlProdDetail" runat="server"  RepeatDirection="Horizontal">
                <ItemTemplate>


                    <div class="ex2">
                        <!-- collapse-tabs -->
                        <div class="collpse tabs" style="">
                            <h3 class="w3ls-title">About this item</h3>
                            <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true" style="">
                                <div class="panel panel-default" style="">
                                    <div class="panel-heading" role="tab" id="headingOne">
                                        <h4 class="panel-title">
                                            <a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                <i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i>Description <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body">
                                            <asp:Label ID="lblxyz" runat="server" Text='<%# Eval("PDescription") %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingTwo">
                                        <h4 class="panel-title">
                                            <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                <i class="fa fa-info-circle fa-icon" aria-hidden="true"></i>additional information <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                        <div class="panel-body">


                                            <table style="width: 780px;">

                                                <tr>
                                                    <td style="width: 50%;">
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

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingThree">
                                        <h4 class="panel-title">
                                            <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                <i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i><span id="spnReviewCount">reviews (0) </span> 
                                                <span class="fa fa-angle-down fa-arrow" aria-hidden="true">
                                                </span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                        <div class="panel-body" id="divReview">
                                            <div class="row"><div class="hGSR34 _1x2VEC E_uFuv">
                                                </div>
                                                <p class="_2xg6Ul" data-reactid="757">Product 1</p></div>
                                           <div class="row">
                                               <div class="qwjRop">
                                                   <div><div>hello</div><span class="_1EPkIx">

                                                                        </span></div></div></div>
                                            <div class="row"><p>Vijay Singh</p></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingFour">
                                        <h4 class="panel-title">
                                            <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                                <i class="fa fa-question-circle fa-icon" aria-hidden="true"></i>help <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
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



            <!-- //collapse -->

              <!-- recommendations -->

            
                      <div class="recommend">
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
            <asp:Repeater ID="gvRecommendedProd" runat="server">

                <ItemTemplate>

              
                   
                                <div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6> <asp:Label ID="lblDiscount1" runat="server" Text='<%# System.Convert.ToString(Eval("discount")).Length > 2 ? System.Convert.ToString(Eval("discount")).Substring(0,4) : Eval("discount") %>'></asp:Label><br />
                                                Off</h6></div>
							<a href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>"> <asp:Image ID="imgProduct1" class="img-responsive" alt="img" runat="server" ImageUrl='<%# "ImageHandler.ashx?idsingle=" + System.Convert.ToString(Eval("pid")) %>' Height="200px" Width="160px" /></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>">
                                                <asp:Label ID="lblHeaderPText1" runat="server" Text='<%# Eval("headertitle") %>'></asp:Label></a></h4>
                                            <h5>Rs
                                                <asp:Label ID="lblSP1" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label></h5>
								<div>
									
									<a style="position:relative" class="myProLink w3ls-cart pw3ls-cart" href="SingleProdInfo.aspx?pid= <%# Eval("pid") %>" >View Product</a>
								</div>
							</div>        
						</div> 
					</div>

                  
                
           

                    </ItemTemplate>

            </asp:Repeater>
            </div>
            
           </div>


            <!-- //recommendations -->

            <!-- offers-cards -->
            <%--<div class="w3single-offers offer-bottom">
                <div class="col-md-6 offer-bottom-grids">
                    <div class="offer-bottom-grids-info2">
                        <h4>Special Gift Cards</h4>
                        <h6>More brands, more ways to shop.
                            <br>
                            Check out these ideal gifts!</h6>
                    </div>
                </div>
                <div class="col-md-6 offer-bottom-grids">
                    <div class="offer-bottom-grids-info">
                        <h4>Flat $10 Discount</h4>
                        <h6>The best Shopping Offer
                            <br>
                            On Fashion Store</h6>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>--%>
            <!-- //offers-cards -->
        </div>
    </div>
    <script type="text/javascript" src="/js2/stdis.js"></script>
    <%--<script>
        $(document).ready(function () {
            $('li[data-thumb]').each(function () {
                if ($(this).attr('data-thumb') == "") {
                    console.log('sdds');
                    $(this).remove();
                    
                }
            })

            $('#ContentPlaceHolder1_dlProdInfo_btnCheckPincode_0').on('click', function (e) {
                var pin = $('#ContentPlaceHolder1_dlProdInfo_lblPincode_0').text().trim().substr(0,4);
                if (!((stndis[$('#ContentPlaceHolder1_dlProdInfo_txtLocation_0').val()] !== undefined) && (pin === $('#ContentPlaceHolder1_dlProdInfo_txtLocation_0').val().trim().substr(0,4)))) {
                    $('.message').text('Sorry This Product Not available on your Location').css('color','red');
                    
                }else
                    $('.message').text('This Product is available on your Location').css('color','green');
                e.preventDefault();
            })
        })
    </script>--%>
    <!--//products-->


</asp:Content>

