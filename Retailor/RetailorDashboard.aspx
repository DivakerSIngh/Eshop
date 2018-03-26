<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Retailor/RetailorPanel.master" AutoEventWireup="true" CodeFile="RetailorDashboard.aspx.cs" Inherits="Retailor_RetailorDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css2/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="/css2/style.css" rel='stylesheet' type='text/css' />
    <link href="/css2/font-awesome.css" rel="stylesheet" />
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"> </script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <!-- Mainly scripts -->
    <script src="/js2/jquery.metisMenu.js"></script>
    <script src="/js2/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="../js2/common.js"></script>
    <link href="/css2/custom.css" rel="stylesheet" />
    <script src="/js2/custom.js"></script>
    <link href="../css2/retailer.css" rel="stylesheet" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

    <script src="/js2/skycons.js"></script>
    <style>
        .bot {
            text-align: center;
            padding: 12px;
        }
    </style>
    <script>
       

        window.onload = function (e) {
            if (window.location.search.includes('flag=ts')) {
                $('#myModal88 .modal-header h4').text('Payment Status');
                $('#myModal88 .modal-body-sub').html('<div id="w"><div id="content"><div class="notify successbox"><h1>Success!</h1><span class="alerticon"><img src="../images/check.png" alt="checkmark" /></span><p>Transaction Completed Successfully</p></div></div></div>');
                $('#myModal88').modal('show');
            }
            else if (window.location.search.includes('flag=tf')) {
                $('#myModal88 .modal-header h4').text('Payment Status');
                $('#myModal88 .modal-body-sub').html('<div id="w"><div id="content"><div class="notify errorbox"><h1>Failure!</h1><span class="alerticon"><img src="../images/error.png" alt="error" /></span><p>Transaction Failed</p></div></div></div>');
                $('#myModal88').modal('show');
            }
        }
        $(function()
        {
            $('#myModal88').on('hidden.bs.modal',function(e)
            {
                location.href = "RetailorDashboard.aspx";
            })
        })

      
    </script>
    <script>
        var app = angular.module('myApp', []);
        
        
         var loginUserId = '<%=hdnUserId.Value%>';
        var action = '<%=hdnTrack.Value%>'
        app.controller('myCtrl', function ($scope, $http, $filter) {
            $scope.currentPage = 0;
            $scope.type = 1;
            $scope.pageSize = 1000000;
            $scope.model = [];
            $scope.query = '';
            $scope.orderList = [];
            $scope.fromdate = "";
            $scope.todate = "";
            $scope.status = "1"
            $scope.getData = function () {
                return $filter('filter')($scope.model, $scope.query)
            }

            $scope.numberOfPages = function () {
                return Math.ceil($scope.getData().length / $scope.pageSize);
            }

            for (var i = 0; i < 65; i++) {
                $scope.model.push("Item " + i);
            }
            $scope.$watch('query', function (newValue, oldValue) {
                if (oldValue != newValue) {
                    $scope.currentPage = 0;
                }
            }, true);

            $scope.getAllProduct = function (action) {
                
                common.httpPost("RetailorDashboard.aspx/getAllOrderList",
                    "{'id':'" + loginUserId + "', 'action':'" + parseInt(1) + "','fromdate':'" + $scope.fromdate + "','todate':'" + $scope.todate + "','status':'" + $scope.status + "'}", false, success = function (data) {
                    
                    $scope.model = data;
                }, failure = function (response) {
                    
                }
                    );
            }
            $scope.changeStatus = function (cartId) {
                common.httpPost("PendingOrder.aspx/updateStatus", "{'cartId':'" + cartId + "'}", false, success = function (data) {
                    
                    $scope.getAllProduct();
                }, failure = function (response) {

                }
                   );
            }
            $scope.getAllProduct(0);

            $scope.apply = function () {                
                $scope.getAllProduct(0);

            }
            $scope.showDesc = function (item) {
                
                $scope.transactionId = item.TRANSACTION_ID
                $scope.userName = item.USER_NAME
                $scope.transactionDate = item.PRODUCT_ID
                $scope.address = item.ADDRESS
                $scope.quantity = item.QUANTITY
                $scope.price = item.DELIVERY_AMOUNT
                $('#orderDetails').modal('show');


            }
        });
        app.filter('startFrom', function () {
            return function (input, start) {
                start = +start; //parse to int
                return input.slice(start);
            }
        });
</script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div ng-app="myApp" ng-controller="myCtrl">

    
      <div class="wallet-buttons">
                    <div class="col-sm-10 bot">
                     
                        <asp:LinkButton PostBackUrl="~/Retailor/RetailorDashboard.aspx?type=1" ID="btnOrderTacking" class="btn btn-primary" runat="server">Order Tarcking</asp:LinkButton>
                        <asp:LinkButton PostBackUrl="~/Retailor/RetailorDashboard.aspx?type=2" ID="btnPayment" class="btn btn-primary" runat="server">Payment</asp:LinkButton>
                        <asp:LinkButton PostBackUrl="~/Retailor/RetailorDashboard.aspx?type=3" ID="btnPassbook" class="btn btn-primary" runat="server">Passbook</asp:LinkButton>
                       <%-- <asp:LinkButton ID="btnPassbook" class="btn btn-primary" runat="server" OnClick="btnPassbook_Click" >Passbook</asp:LinkButton>--%>
                    </div>
                </div>



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

         <div class="agileits-modal modal fade" id="orderDetails" tabindex="-1" role="dialog" 
		aria-hidden="true">
		<div class="modal-dialog" style="text-align:justify">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Order Details</h4>
				</div>
				<div class="modal-body modal-body-sub"> 
					<div>
                        Transaction Id : {{transactionId}}
					</div>
                    <div>
                        User Name : {{userName}}
					</div>
                    <div>
                        Date: {{transactionDate}}
					</div>
                    <div>
                       Address : {{address}}
					</div>
                      <div>
                       Quantity : {{quantity}}
					</div>
                      <div>
                       Price : {{price}}
					</div>
				</div>
			</div>
		</div>
	</div>

     <asp:HiddenField runat="server" ID="hdnType" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="hdnUserId" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="hdnTrack" ClientIDMode="Static" />
   

     <asp:Panel ID="pnlOrderTracking" runat="server">
          <div class="table-wrapper clearfix" style="padding: 19px;">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" width="50">S.No order</th>
                        <th>Transaction No</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in model">
                        <td class="text-center">{{$index+1}}</td>
                        <td><a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a></td>
                        <td ng-if="item.STATUS==1">Pending</td>
                         <td ng-if="item.STATUS==2">Ready To Shipped</td>
                         <td ng-if="item.STATUS==3">Delieverd</td>
                        <td  ng-if="item.STATUS==1"><a ng-click="changeStatus(item.CART_ID)"><span class="dispatch">Ready To Shipped <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                         <td ng-if="item.STATUS==2">Ready To Shipped</td>
                         <td ng-if="item.STATUS==3">Delieverd</td>
                         
                    </tr>
                </tbody>
            </table>


        </div>
     </asp:Panel>

     <asp:Panel ID="pnlPayment" runat="server">
         paymenttttt
          <div class="table-wrapper clearfix" style="padding: 19px;">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" width="50">S.No  paym</th>
                        <th>Transaction No</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in model">
                        <td class="text-center">{{$index+1}}</td>
                        <td>{{item.transactionNo}}</td>
                        <td>{{item.status}}</td>
                        <td  ng-if="type=='p'"><a ng-click="changeStatus(item.CART_ID)"><span class="dispatch">Ready To Dispatch <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                        
                    </tr>
                </tbody>
            </table>


        </div>
     </asp:Panel>

    <asp:Panel ID="pnlPassbook" runat="server">

        pasasasasas
         <div class="table-wrapper clearfix" style="padding: 19px;">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" width="50">S.No tran</th>
                        <th>Transaction No</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in model">
                        <td class="text-center">{{$index+1}}</td>
                        <td>{{item.transactionNo}}</td>
                        <td>{{item.status}}</td>
                        <td  ng-if="type=='p'"><a ng-click="changeStatus(item.CART_ID)"><span class="dispatch">Ready To Dispatch <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                        
                    </tr>
                </tbody>
            </table>


        </div>
     </asp:Panel>

    </div>

</asp:Content>

