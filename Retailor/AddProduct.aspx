<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Retailor/RetailorPanel.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="Retailor_AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

    <script type="text/javascript">
        function f() {
            toastr.error('Error occured Info cannot be viewd try later !');
        }
    </script>



    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css2/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="/css2/style.css" rel='stylesheet' type='text/css' />
    <link href="/css2/font-awesome.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"> </script>
    <!-- Mainly scripts -->
    <script src="/js2/jquery.metisMenu.js"></script>
    <script src="/js2/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <link href="/css2/custom.css" rel="stylesheet" />
    <script src="/js2/custom.js"></script>
    <script src="/js2/screenfull.js"></script>
     <%--<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script> --%>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>    
    <link rel="Stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />  
     <script>  
         function checkBrandExist(value) {
              $("#txtBrand").autocomplete({
                 source: function (request, response) {
                     var productId = $(value).val() == "" ? $("#txtBrand").val() : $(value).val();
                     var param = { brandName: productId };
                     $.ajax({  
                         url: "AddProduct.aspx/getBrands",
                         data: JSON.stringify(param),  
                         dataType: "json",  
                         type: "POST",  
                         contentType: "application/json; charset=utf-8",  
                         dataFilter: function (data) { return data; },  
                         success: function (data) {
                             
                             console.log(JSON.stringify(data));  
                             response($.map(data.d, function (item) {  
                                 return {  
                                     value: item.brandName
                                 }  
                             }))  
                         },  
                         error: function (XMLHttpRequest, textStatus, errorThrown) {
                             
                             var err = eval("(" + XMLHttpRequest.responseText + ")");  
                             //alert(err.Message)  
                             // console.log("Ajax Error!");    
                         }  
                     });  
                 },  
                 minLength: 1 //This is the Char length of inputTextBox    
             }); 
         }
         $(document).ready(function () {  
             checkBrandExist('');
         });  
    </script>  
    
    
    <script>
        $(function () {
            $('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

            if (!screenfull.enabled) {
                return false;
            }



            $('#toggle').click(function () {
                screenfull.toggle($('#container')[0]);
            });



        });
    </script>

    <!----->

    <!--pie-chart--->
    <script src="/js2/pie-chart.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            


        });
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
      

    </script>
    <!--skycons-icons-->
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!--content-->
    <!---->

  

        <asp:ScriptManager ID="scriptmanager1" runat="server">
        </asp:ScriptManager>

       <asp:UpdatePanel ID="updatepnl" runat="server">
            <ContentTemplate>


                <div class="blank">


                    <div class="blank-page">

                        <div class="grid-form1">
                            <h3>Product Description</h3>
                            <div class="tab-content">
                                <div class="tab-pane active" id="horizontal-form">


                                    <div class="form-group">
                                        <div class="col-sm-8">
                                            <table>

                                                <tr>

                                                    <td style="text-align: left;">Choose Category
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                            <asp:ListItem Value="1">LifeStyle</asp:ListItem>
                                                            <asp:ListItem Value="4">Agriculture</asp:ListItem>
                                                            <asp:ListItem Value="3">Grocery</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlGender" runat="server" Visible="false" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged">
                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                            <asp:ListItem Value="M">Men</asp:ListItem>
                                                            <asp:ListItem Value="W">Women</asp:ListItem>
                                                            <asp:ListItem Value="K">Kid</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                    </td>

                                                </tr>

                                            </table>


                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>


                                    <%--<div class="form-group">
									<div class="col-sm-8">
                                       
                                        <asp:CheckBoxList ID="cbGender" style="width:60%" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem>Men</asp:ListItem>
                                                        <asp:ListItem>Women</asp:ListItem>
                                                        <asp:ListItem Value="KidBoy">Kid Boy</asp:ListItem>
                                                        <asp:ListItem Value="KidGirl">Kid Girl</asp:ListItem>
                                                    </asp:CheckBoxList>
                                      
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>--%>


                                    <div class="form-group col-sm-6 col-md-6">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Header Title
                                            <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtPTitle" class="form-control1" placeholder="Enter Header Tile" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6 col-md-6" style="display:none;">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Selling Price
                                            <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtPSellingPrice" onkeypress="return isNumberKey(event)" class="form-control1" placeholder="Enter Selling Price" runat="server" TextMode="SingleLine"></asp:TextBox>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6 col-md-6">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Brand Name
                                           <asp:Label ID="Label8" runat="server" Text="" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                           <%-- <asp:DropDownList ID="ddlBrand" runat="server"  CssClass="form-control1">
                                                
                                            </asp:DropDownList>--%>
                                            <asp:TextBox ID="txtBrand" ClientIDMode="Static" class="form-control1" onkeypress="checkBrandExist(this)" placeholder="Enter Brand Name" runat="server" TextMode="SingleLine"></asp:TextBox>

                                           <%-- <asp:TextBox ID="txtBrand" class="form-control1" placeholder="Enter Brand Name" runat="server" TextMode="SingleLine"></asp:TextBox>--%>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>


                                    <div class="form-group col-sm-6 col-md-6">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Color
                                            <asp:Label ID="Label9" runat="server" Text="" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                              <asp:DropDownList ID="ddlColor" runat="server"  CssClass="form-control1">
                                                <asp:ListItem Value="#FF0000" Text="Red">
                                                </asp:ListItem>
                                                 <asp:ListItem Value="#FFFF00" Text="Yellow"></asp:ListItem>
                                                 <asp:ListItem Value="#00FF00" Text="Green"></asp:ListItem>
                                                 <asp:ListItem Value="#9400D3" Text="Pink"></asp:ListItem>
                                                 <asp:ListItem Value="#0000FF" Text="Blue"></asp:ListItem>
                                            </asp:DropDownList>
                                           <%-- <asp:TextBox ID="txtColor" class="form-control1" placeholder="Enter Color" runat="server" TextMode="SingleLine"></asp:TextBox>--%>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6 col-md-6">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Weight(gm)
                                            <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtweight" onkeypress="return isNumberKey(event)" class="form-control1" placeholder="Enter Weight" runat="server" TextMode="SingleLine"></asp:TextBox>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6 col-md-6" style="display:none;">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">MRP
                                            <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtPCostPrice" onkeypress="return isNumberKey(event)" class="form-control1" placeholder="Enter Cost Price" runat="server" TextMode="SingleLine"></asp:TextBox>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>
                                    <div class="form-group col-sm-6 col-md-6">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Dimension
                                            <asp:Label ID="Label11" runat="server" Text="" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtL" onkeypress="return isNumberKey(event)" class="col-sm-3" placeholder="L" runat="server" ></asp:TextBox>
                                            <asp:TextBox ID="txtB" onkeypress="return isNumberKey(event)" class="col-sm-3" placeholder="B" runat="server" ></asp:TextBox>
                                            <asp:TextBox ID="txtH"  onkeypress="return isNumberKey(event)" class="col-sm-3" placeholder="H" runat="server" ></asp:TextBox>
                                           <%-- <input class="col-sm-3" type="number" placeholder="L" id="inputL" runat="server" />
                                            <input class="col-sm-3" type="number" placeholder="B" id="inputB" runat="server" />
                                            <input class="col-sm-3" type="number" placeholder="H" id="inputH" runat="server" />--%>
                                           <%--  <asp:TextBox ID="txtDimention"  class="form-control1" placeholder="Enter Product Dimension" runat="server" TextMode="SingleLine"></asp:TextBox>--%>
                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>
                                    <div class="form-group form-group col-sm-6 col-md-6" style="display:none;">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Quantity
                                            <asp:Label ID="lblRequired" runat="server" Text="*" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtPQuantity" onkeypress="return /\d/.test(String.fromCharCode(((event||window.event).which||(event||window.event).which)));" class="form-control1" placeholder="Enter Quantity of Product" runat="server" TextMode="Number"></asp:TextBox>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>



                                    <div class="form-group col-sm-6 col-md-6">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Product Description
                                            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" /></label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtPDescription" class="form-control1" placeholder="Enter Description" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>



                                    <div class="form-group" style="visibility: hidden;">
                                        <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Measurement
                                            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" /></label>
                                        <div class="col-sm-8">

                                            <asp:RadioButtonList ID="rdbtnMeasurement" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdbtnMeasurement_SelectedIndexChanged">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0">No</asp:ListItem>
                                            </asp:RadioButtonList>

                                        </div>
                                        <div class="col-sm-2" style="display: none;">
                                            <p class="help-block">Your help text!</p>
                                        </div>
                                    </div>





                                    <asp:Panel ID="pnlMeasurement" runat="server">



                                        <%--<div class="form-group">

                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Enter Measurement<asp:Label ID="lblmust" runat="server" Text="*" ForeColor="Red" /></label>

                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtPSize1" CssClass="text-primary" runat="server"></asp:TextBox>

                                                <asp:Button ID="btnPShiftSize1" CssClass="btn-primary" runat="server" Text="Add" OnClick="btnPShiftSize_Click" />

                                            </div>

                                            <div class="col-sm-2">
                                                <p class="help-block"></p>
                                            </div>
                                        </div>--%>


                                        <div class="row">

                                            <div class="col-sm-2 col-xs-12">
                                                <label  class="col-sm-2 control-label" style="text-align: left;">Measurement: <span style="color:red">*</span> </label>
                                                <div class="formInputWrap">
                                                    <asp:TextBox ID="txtPSize" CssClass="form-control1" placeholder="Measurement Title" runat="server"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="col-sm-2 col-xs-12">
                                                <label  class="col-sm-2 control-label" style="text-align: left;">Quantity: <span style="color:red">*</span></label>
                                                <div class="formInputWrap">
                                                      <asp:TextBox ID="txtMeasurementQuantity" placeholder="Measurement Quantity"  onkeypress="return isNumberKey(event)" CssClass="form-control1" runat="server"></asp:TextBox>
                                                </div>

                                            </div>

                                             <div class="col-sm-2 col-xs-12">
                                                <label  class="col-sm-2 control-label" style="text-align: left;">Mrp: <span style="color:red">*</span></label>
                                                <div class="formInputWrap">
                                                     <asp:TextBox ID="txtMeasurementPrice" placeholder="Measurement Price" onkeypress="return isNumberKey(event)" CssClass="form-control1" runat="server"></asp:TextBox>
                                                     
                                                </div>

                                            </div>
                                              <div class="col-sm-2 col-xs-12">
                                                <label  class="col-sm-2 control-label" style="text-align: left;">Selling price: <span style="color:red">*</span></label>
                                                <div class="formInputWrap">
                                                     <asp:TextBox ID="txtSellingPrice" placeholder="Selling Price" onkeypress="return isNumberKey(event)" CssClass="form-control1" runat="server"></asp:TextBox>
                                                     
                                                </div>

                                            </div>
                                             <div class="col-sm-2 col-xs-12">
                                                <label  class="col-sm-2 control-label" style="text-align: left;"></label>
                                               
                                                <div class="formInputWrap">
                                                    <asp:Button ID="btnPShiftSize" style="margin-top: 25px;" CssClass="btn-primary" runat="server" Text="Add" OnClick="btnPShiftSize_Click" />
                                                </div>

                                            </div>

                                        </div>


                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Measurement List<asp:Label ID="Label6" runat="server" Text="*" ForeColor="White" /></label>

                                    <div class="col-sm-8">
                                        <asp:ListBox ID="lbPSizeList" CssClass="list-inline" runat="server" Height="150px" Width="667.5px"></asp:ListBox>

                                    </div>
                                    <div class="col-sm-2">
                                        <p class="help-block">
                                            <asp:Button ID="btnPRemoveSize" CssClass="btn-primary" runat="server" Text="Remove" OnClick="btnPRemoveSize_Click" /></p>
                                    </div>
                                </div>

                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Return Policy<asp:Label ID="Label12" runat="server" Text="*" ForeColor="White" /></label>

                                            <div class="col-sm-8">
                                                <asp:RadioButtonList ID="rbReturnPolicy" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                </asp:RadioButtonList>

                                            </div>

                                        </div>


                                    </asp:Panel>



                                    <div class="row show-grid">
                                        <div class="col-md-6">
                                            Title
                  
                                        </div>
                                        <div class="col-md-6">
                                            Value
                   
                                        </div>
                                    </div>


                                    <div class="row show-grid">
                                        <div class="col-md-6">

                                            <asp:TextBox ID="txtTitle1" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                        </div>
                                        <div class="col-md-6">

                                            <asp:TextBox ID="txtValue1" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>
                                        </div>
                                    </div>

                                    <asp:Panel ID="pnlAddTitle2" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle2" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue2" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>

                                    <asp:Panel ID="pnlAddTitle3" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle3" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue3" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>


                                    <asp:Panel ID="pnlAddTitle4" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle4" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue4" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>


                                    <asp:Panel ID="pnlAddTitle5" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle5" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue5" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>


                                    <asp:Panel ID="pnlAddTitle6" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle6" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue6" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>

                                    <asp:Panel ID="pnlAddTitle7" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle7" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue7" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>


                                    <asp:Panel ID="pnlAddTitle8" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle8" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue8" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>


                                    <asp:Panel ID="pnlAddTitle9" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle9" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue9" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>


                                    <asp:Panel ID="pnlAddTitle10" runat="server">

                                        <div class="row show-grid">
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtTitle10" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtValue10" CssClass="text-primary" runat="server" Width="80%"></asp:TextBox>

                                            </div>
                                        </div>

                                    </asp:Panel>






                                </div>
                            </div>

                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <asp:Button ID="btnProdSubmit" class="btn-primary btn" runat="server" OnClientClick="return validateProduct(this);" Text="Submit" OnClick="btnProdSubmit_Click" />
                                        <asp:Button ID="btnProdCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnProdCancel_Click" />
                                        <asp:Button ID="btnProdReset" class="btn-inverse btn" runat="server" Text="Reset" OnClick="btnProdReset_Click" />
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>

                <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js"></script>
                <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
                <script src="/js2/stdis.js"></script>
                <script src="/js2/sidscript.js"></script>
                <script>
                    $(document).ready(function () {
                        $('#ContentPlaceHolder1_txtPQuantity').on('keydown', function (e) {
                            if (!((e.keyCode > 95 && e.keyCode < 106)
                              || (e.keyCode > 47 && e.keyCode < 58)
                              || e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 39)) {
                                return false;
                            }
                        });
                    })

                </script>
            </ContentTemplate>
        </asp:UpdatePanel>

    <!--//content-->



</asp:Content>


