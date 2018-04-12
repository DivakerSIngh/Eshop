<%@ Page Title="Logistic Info" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="AddLogisticInfo.aspx.cs" Inherits="Logistic_AddLogisticInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
    <script src="/js2/jquery.min.js"> </script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="../js2/common.js"></script>


    <!-- Mainly scripts -->
    <script src="/js2/jquery.metisMenu.js"></script>
    <script src="/js2/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <link href="/css2/custom.css" rel="stylesheet" />
    <script src="/js2/custom.js"></script>
    
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->

     <script>
        var app = angular.module('myApp', []);
        app.controller('retailerController', ['$scope', '$http', employeeController]);
       
        function employeeController($scope, $http) {
            $scope.retailer = {};
            $scope.retailerList = [];
            $scope.loading = false;
            $scope.updateShow = false;
            $scope.addShow = true;
            common.httpPost("AddLogisticInfo.aspx/getLogistic", "{}", false, success = function (data) {
                
                $scope.retailerList = JSON.parse(data);
                $scope.loading = false;
            }, failure = function (response) { });



         
            $scope.add = function () {
                
                $scope.loading = true;
                common.httpPost("AddLogisticInfo.aspx/addLogistic", "{'mobile':" + $scope.retailer.Mobile + ",'loginId':" + $('#hdnLoginId').val() + "}", false, success = function (data) {
                    
                    $scope.retailerList = JSON.parse(data);
                    $scope.loading = false;
                }, failure = function (response) { });

            }

            $scope.edit = function (item) {
                $scope.userId = item.UserId;
                $scope.retailer.Mobile = item.Mobile;
                $scope.updateShow = true;
                $scope.addShow = false;
            }
            $scope.update = function () {
                $scope.loading = true;
                common.httpPost("AddLogisticInfo.aspx/updateLogistic", "{'mobile':'" + $scope.retailer.Mobile + "','loginId':'" + $scope.userId + "'}", false, success = function (data) {
                    $scope.retailerList = JSON.parse(data);
                    $scope.retailer.Mobile = "";
                    $scope.updateShow = false;
                    $scope.addShow = true;
                    $scope.loading = false;
                }, failure = function (response) { });
            }

           
            $scope.delete = function (item) {
               
                $scope.loading = true;
                common.httpPost("AddLogisticInfo.aspx/deleteLogistic", "{'mobile':'" + item.Mobile + "','loginId':'" + item.UserId + "'}", false, success = function (data) {
                    $scope.retailerList = JSON.parse(data);
                    $scope.retailer.Mobile = "";
                    $scope.updateShow = false;
                    $scope.addShow = true;
                    $scope.loading = false;
                }, failure = function (response) { });
            }
            $scope.cancel = function () {
                $scope.updateShow = false;
                $scope.addShow = true;
                $scope.newemployee = '';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <!--content-->
                <!---->
    <asp:Panel ID="pnlAdd" runat="server">

   
    <div ng-app="myApp" ng-controller="retailerController">
   
    <form name="addRetailer" style="width: 600px; margin: 0px auto;"> 
         <div class="loader" ng-if="loading"></div>
                    <div class="form-group">  
                        <label for="cname" class="col-sm-2 control-label">Mobile no:</label>  
                        <div class="col-sm-10 space">  
                            <input type="text" maxlength="10" class="form-control" id="mobile" placeholder="Mobile No" ng-model="retailer.Mobile" required />  
                        </div>  
                    </div>  
                   
                    <br />  
                    <div class="form-group space">  
                        <div class="col-sm-offset-2 col-sm-10" style="padding: 16px;">  
                            <input type="submit" value="Insert" ng-click="add()" ng-show="addShow" ng-disabled="!addRetailer.$valid" class="btn btn-primary" />  
                            <input type="submit" value="Update" ng-click="update()" ng-show="updateShow" ng-disabled="!addRetailer.$valid" class="btn btn-primary" />  
                            <input type="button" value="Reset" ng-click="cancel()" class="btn btn-primary" />  
                        </div>  
                    </div>  
                    <br />  
                </form>
    <div class="row">  
            <div class="col-md-12">  
                <div class="table-responsive">  
                    <table class="table table-bordered table-hover" style="width: 800px; margin-left: 170px;">  
                        <tr>  
                            <th>UserId</th>  
                            <th>Mobile</th>  
                            <th>Status</th>  
                            <th>Password</th>  
                            <th>Actions</th>  
                        </tr>  
                        <tr ng-repeat="item in retailerList">  
                            <td>  
                                <p>{{ item.UserId }}</p>  
                            </td>  
                            <td>  
                                <p>{{ item.Mobile }}</p>  
                            </td>  
                            <td>  
                                <p>{{ item.LStatus }}</p>  
                            </td>  
                             <td>  
                                <p>{{ item.Password }}</p>  
                            </td> 
                            <td>  
                                <p><a ng-click="edit(item)" href="javascript:void(0);">Edit</a> | <a ng-click="delete(item)" href="javascript:void(0);">Delete</a></p>  
                            </td>  
                        </tr>  
                    </table>  
                </div>  
            </div>  
        </div>          
      </div>
    </asp:Panel>




    <asp:Panel ID="pnlView" runat="server">

  
















                	<form runat="server" id="logisticInfoForm" class="form-horizontal">
                         <asp:HiddenField ID="hdnLoginId" runat="server" ClientIDMode="Static" />
                        <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>

        <asp:UpdatePanel ID="updatepnl" runat="server" >
<ContentTemplate>


                    <div class="blank">


                    <div class="blank-page">
                        
                        <div class="grid-form1">
  	       <h3>Logistic Information</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Title <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtLTitle" class="form-control1" placeholder="Enter Title" runat="server"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Address <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtLAddress" class="form-control1" placeholder="Enter Address" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Mobile No. <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtLMob" class="form-control1" placeholder="Enter Mobile Number" runat="server" TextMode="Number"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>



                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Email Address <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" /></label>
									<div class="col-sm-8">
                                <div class="input-group">							
								
									
								
                                        	<span class="input-group-addon">
										<i class="fa fa-envelope-o"></i>
									</span>
                                    <asp:TextBox ID="txtEmail" class="form-control1" placeholder="Email Address" runat="server"></asp:TextBox>
								</div>		
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>


                                <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Description <asp:Label ID="Label6" runat="server" Text="*" ForeColor="White" /></label>
									<div class="col-sm-8">
                                        <asp:TextBox ID="txtLDescription" class="form-control1" placeholder="Enter Logistic Description" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
										
									</div>
									<div class="col-sm-2" style="display:none;">
										<p class="help-block">Your help text!</p>
									</div>
								</div>

                                
                                <div class="form-group">
                                    
									<label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Enter Pincode<asp:Label ID="lblmust" runat="server" Text="*" ForeColor="Red" /></label>

									<div class="col-sm-8">
                                        <asp:TextBox ID="txtLPincode" CssClass="text-primary form-control1" placeholder="Enter Pincode" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <p class="help-block" style="margin: 0;margin-top: 3px;"><asp:Button ID="btnPincodeShift" CssClass="btn-primary" runat="server" Text="Add" OnClick="btnPincodeShift_Click" /></p>
                                    </div>
									<%--<div class="col-sm-2" >
										<p class="help-block"></p>
									</div>--%>
								</div>

                                
                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label" style="text-align:left;">Pincode List<asp:Label ID="Label5" runat="server" Text="*" ForeColor="White" /></label>
									
									<div class="col-sm-8">
                                        <asp:ListBox ID="lbPincodeList" CssClass="list-inline form-control1" runat="server" Height="150px" ></asp:ListBox>
										
									</div>
									<div class="col-sm-2" >
										<p class="help-block"><asp:Button ID="btnRemovePincode" CssClass="btn-primary" runat="server" Text="Remove" OnClick="btnRemovePincode_Click" /></p>
									</div>
								</div>

					</div>
					
      <div class="panel-footer">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
                <asp:Button ID="btnLogSubmit" class="btn-primary btn" runat="server" Text="Submit" OnClick="btnLogSubmit_Click" />
                <asp:Button ID="btnLogCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnLogCancel_Click" />
                <asp:Button ID="btnLogReset" class="btn-inverse btn" runat="server" Text="Reset" OnClick="btnLogReset_Click" />
			</div>
		</div>
	 </div>
                            
    
  </div>

                    </div>
                </div>


    </ContentTemplate>
            </asp:UpdatePanel>

                </form>
          </asp:Panel>
                <!--//content-->
              <%--  <script type="text/javascript" src="/js/bootstrap-3.3.5.min.js" ></script>--%>
	            <script type="text/javascript" src="/js/jquery.validate-1.14.0.min.js" ></script>
	            <script type="text/javascript" src="/js/jquery-validate.bootstrap-tooltip.js"></script>
                <script src="/js2/stdis.js"></script>
                <script src="/js2/sidscript.js"></script>

</asp:Content>

