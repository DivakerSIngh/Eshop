<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Logistic/LogisticPanel.master" AutoEventWireup="true" CodeFile="LogisticDashboard.aspx.cs" Inherits="Logistic_LogisticDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

          
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
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <!-- Mainly scripts -->
    <script src="/js2/jquery.metisMenu.js"></script>
    <script src="../js2/jquery.slimscroll.min.js"></script>
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
        .noRecord{
            text-align: center;
    color: red;
        }
        span.spnLable {
    font-size: 13px;
    color: grey;
}
        .txtSearch{
            margin-left: 19px;

        }
    </style>
   
    <script>
        var app = angular.module('myApp', []);
        var chartData = ['jan', 'feb', 'mar', 'apr', 'may', 'jun',
      'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
        var staticArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        
        var loginUserId = '<%=hdnUserId.Value%>';
        var action = '<%=hdnTrack.Value%>'
        app.controller('myCtrl', function ($scope, $http, $filter) {
            $scope.staticArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            $scope.chartData = ['jan', 'feb', 'mar', 'apr', 'may', 'jun',
     'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
            $scope.currentPage = 0;
            $scope.type = $('#hdnType').val();
            $scope.pageSize = 1000000;
            $scope.model = [];
            $scope.query = '';
            $scope.orderList = [];
            $scope.fromdate = "";
            $scope.todate = "";
            $scope.status = "0"
            $scope.logisticId = loginUserId;
            $scope.chartData = function () {
                common.httpPost("LogisticDashboard.aspx/getSaleReport", "{'year':'" + 2018 + "','id':'" + loginUserId + "','action':'2'}", false, success = function (data) {
                    
                    $scope.model = data;
                    $.each(data, function (index, item) {

                        $scope.staticArray[index + 1] = parseInt(item.TOTALSALES);
                    });

                    Highcharts.chart('chartData', {
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: 'Dashboard Chart'
                        },
                        credits: {
                            enabled: false
                        },
                        xAxis: {
                            categories: [
                                'Jan',
                                'Feb',
                                'Mar',
                                'Apr',
                                'May',
                                'Jun',
                                'Jul',
                                'Aug',
                                'Sep',
                                'Oct',
                                'Nov',
                                'Dec'
                            ],
                            crosshair: true
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: 'Monthly Sales'
                            }
                        },
                        tooltip: {
                            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                '<td style="padding:0"><b>{point.y:.1f} $</b></td></tr>',
                            footerFormat: '</table>',
                            shared: true,
                            useHTML: true
                        },
                        series: [
                          {
                              name: 'User',
                              data: $scope.staticArray
                          }]
                    });

                }, failure = function (response) {

                }
                    );
            }
            if ($scope.type == "0") {
                $scope.chartData();
            }
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
               
                if ($scope.type == 1)
                {
                    common.httpPost("LogisticDashboard.aspx/getAllOrderList",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(2) + "','fromdate':'" + $scope.fromdate + "','todate':'" + $scope.todate + "','status':'" + $scope.status + "'}", false, success = function (data) {
                     
                       $scope.model = data;
                   }, failure = function (response) {

                   }
                   );
                }
                if ($scope.type == 2) {
                    common.httpPost("LogisticDashboard.aspx/getRetailerPaymentStatus",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(3) + "'}", false, success = function (data) {

                       $scope.model = data;
                   }, failure = function (response) {

                   }
                   );
                }
                if ($scope.type == 3) {
                    common.httpPost("LogisticDashboard.aspx/getRetalerPassbook",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(4) + "'}", false, success = function (data) {

                       $scope.model = data;
                   }, failure = function (response) {

                   }
                   );
                }
               
            }
            $scope.changeStatus = function (cartId,status) {
                common.httpPost("LogisticDashboard.aspx/updateStatus", "{'cartId':'" + cartId + "','status':'" + status + "'}", false, success = function (data) {

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
                $scope.transactionDate = item.TRANSACTION_DATE
                $scope.userName = item.USER_NAME
                $scope.address = item.ADDRESS
                $scope.productTitle = item.PRODUCT_TITLE
                $scope.productDescription = item.PRODUCT_DECSRIPTION
                $scope.productMeasurement = item.MEASUREMENT
                $scope.quantity = item.QUANTITY
                $scope.price = item.SELLINGPRICE
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <form id="frmlogistic" runat="server">
         <asp:ScriptManager runat="server"></asp:ScriptManager>
    
    <div ng-app="myApp" ng-controller="myCtrl">


        <div class="wallet-buttons">
            <div class="col-sm-10 bot">

                <asp:LinkButton PostBackUrl="~/Logistic/LogisticDashboard.aspx?type=1" ID="btnOrderTacking" class="btn btn-primary" runat="server">Order Tracking</asp:LinkButton>
                <asp:LinkButton PostBackUrl="~/Logistic/LogisticDashboard.aspx?type=2" Visible="false" ID="btnPayment" class="btn btn-primary" runat="server">Payment</asp:LinkButton>
                <asp:LinkButton PostBackUrl="~/Logistic/LogisticDashboard.aspx?type=3" Visible="false" ID="btnPassbook" class="btn btn-primary" runat="server">Passbook</asp:LinkButton>
                <%-- <asp:LinkButton ID="btnPassbook" class="btn btn-primary" runat="server" OnClick="btnPassbook_Click" >Passbook</asp:LinkButton>--%>
            </div>
        </div>



        

        <div class="agileits-modal modal fade" id="orderDetails" tabindex="-1" role="dialog"
            aria-hidden="true">
            <div class="modal-dialog" style="text-align: justify">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Order Details</h4>
                    </div>
                    <div class="modal-body modal-body-sub">
                        <div>
                           <span class="spnLable"> Transaction Id  :</span> {{transactionId}}
                        </div>
                        <div>
                          <span class="spnLable">  Date :</span> {{transactionDate}}
                        </div>
                        <div>
                          <span class="spnLable">  User Name :</span> {{userName}}
                        </div>
                        <div>
                          <span class="spnLable">  Address : </span>{{address}}
                        </div>
                        <div>
                          <span class="spnLable">  Product Title :</span> {{productTitle}}
                        </div>
                        <div>
                          <span class="spnLable">  Description :</span> {{productDescription}}
                        </div>
                        <div>
                          <span class="spnLable">  Measurement : </span>{{productMeasurement}}
                        </div>
                        <div>
                          <span class="spnLable">  Quantity :</span> {{quantity}}
                        </div>
                        <div>
                          <span class="spnLable">  Price :</span> {{price}}
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>

        <asp:HiddenField runat="server" ID="hdnType" ClientIDMode="Static" Value="0" />
        <asp:HiddenField runat="server" ID="hdnUserId" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnTrack" ClientIDMode="Static" />

       
        <asp:Panel ID="pnlOrderTracking" runat="server">
             <input type="text" class="txtSearch" ng-model="query" placeholder="Search any" />
            <div class="table-wrapper clearfix" style="padding: 19px;">Order Tracking
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center" width="50">S.No order</th>
                            <th>Transaction No</th>
                            <th>Quantity</th>
                            <th>Retailer Address</th>
                            <th>Retailer Email</th>
                            <th>Retailer Name</th>
                            <th>Current Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="item in model  | filter:query | orderBy: orderList | startFrom:currentPage*pageSize | limitTo:pageSize"" ng-cloak>
                            <td class="text-center">{{$index+1}}</td>
                            <td><a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a></td>
                            <td class="text-center">{{item.ITEM_QTY}}</td>
                            <td class="text-center">{{item.R_ADDRESS}}</td>
                            <td class="text-center">{{item.R_EMAIL}}</td>
                            <td class="text-center">{{item.R_NAME}}</td>
                             <td ng-if="item.STATUS==2">
                                 Ready To dispatch
                             </td>
                             <td ng-if="item.STATUS==3">
                                Picked
                             </td>
                             <td ng-if="item.STATUS==4">
                                Out for deilievery
                             </td>
                             <td ng-if="item.STATUS==5">
                                Deilievered
                             </td>
                             <td ng-if="item.STATUS==6">
                                UnDelievered
                             </td>
                             <td ng-if="item.STATUS==7">
                                Canceled
                             </td>
                            <td ng-if="item.STATUS==2"><a ng-click="changeStatus(item.CART_ID,3)"><span class="dispatch">Picked<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                             <td ng-if="item.STATUS==3"><a ng-click="changeStatus(item.CART_ID,4)"><span class="dispatch">Out for deilievery<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                             <td ng-if="item.STATUS==4"><a ng-click="changeStatus(item.CART_ID,5)"><span class="dispatch">Deilievered<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                             <td ng-if="item.STATUS==6">UnDelievered</td>
                             <td ng-if="item.STATUS==7">Canceled</td>
                            <td ng-if="item.STATUS==5">
                                <a href="UploadReceipt.aspx?tid={{item.TRANSACTION_ID}}&lid={{logisticId}}" target="_blank">
                                Upload Receipt
                                    </a></td>
                        </tr>

                    </tbody>
                   
                </table>

                   <div class="noRecord" ng-if="model.length<1">
                  <h3>
                      No Record Found
                  </h3>
              </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlPayment" runat="server">
             <input type="text" class="txtSearch" ng-model="query" placeholder="Search any" />
          <div class="table-wrapper clearfix" style="padding: 19px;">Payment
              <table class="table table-striped table-bordered">
                  <thead>
                      <tr>
                          <th class="text-center" width="50">S.N.</th>
                          <th>Transaction No</th>
                          <th>Status</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr ng-repeat="item in model  | filter:query | orderBy: orderList | startFrom:currentPage*pageSize | limitTo:pageSize"" ng-cloak>
                          <td class="text-center">{{$index+1}}</td>
                          <td><a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a></td>
                          <td>{{item.RETAILOR_PAY_STATUS}}</td>
                      </tr>
                  </tbody>
                 
              </table>

              <div class="noRecord" ng-if="model.length<1">
                  <h3>
                      No Record Found
                  </h3>
              </div>
          </div>
        </asp:Panel>

          <asp:Panel ID="pnlChart" runat="server">
         <div class="col-sm-12 col-xs-12">
        <div id="chartData" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

    </div>
        </asp:Panel>

        <asp:Panel ID="pnlPassbook" runat="server">
             <input type="text" class="txtSearch" ng-model="query" placeholder="Search any" />
         <div class="table-wrapper clearfix" style="padding: 19px;">Passbook
             <table class="table table-striped table-bordered">
                 <thead>
                     <tr>
                         <th class="text-center" width="50">S.No</th>
                         <th>Transaction No</th>
                         <th>Amount</th>
                         <th>Date</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr ng-repeat="item in model  | filter:query | orderBy: orderList | startFrom:currentPage*pageSize | limitTo:pageSize"" ng-cloak>
                         <td class="text-center">{{$index+1}}</td>
                         <td>{{item.TRANSACTION_ID}}</td>
                         <td>{{item.RETAILOR_PAY_AMOUNT}}</td>
                         <td>{{item.RETAILOR_PAY_DATE}}</td>
                     </tr>
                 </tbody>
             </table>
                <div class="noRecord" ng-if="model.length<1">
                  <h3>
                      No Record Found
                  </h3>
              </div>

         </div>
        </asp:Panel>

    </div>
   </form>

</asp:Content>

