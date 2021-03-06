﻿<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Retailor/RetailorPanel.master" AutoEventWireup="true" CodeFile="RetailorDashboard.aspx.cs" Inherits="Retailor_RetailorDashboard" %>

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
        .items1 {
    background: #2083d863;
}
        .clsmodal {
    position: relative;
    padding:0px !important;
    margin: -23px !important;
}

        .items{
            border-bottom: 1px solid white;
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
        $(function () {
            $('#myModal88').on('hidden.bs.modal', function (e) {
                location.href = "RetailorDashboard.aspx";
            })
        })


    </script>
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
           
            $scope.chartData = function () {
                common.httpPost("RetailorDashboard.aspx/getSaleReport", "{'year':'" + 2018 + "','id':'" + loginUserId + "','action':'1'}", false, success = function (data) {
                    
                    $scope.model = data;
                    $.each(data, function (index, item) {

                        $scope.staticArray[item.SALESMONTH-1] = parseInt(item.TOTALSALES);
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
                                '<td style="padding:0"><b>&#8360 {point.y:.1f}</b></td></tr>',
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
                ;
                if ($scope.type == 1)
                {
                    common.httpPost("RetailorDashboard.aspx/getAllOrderList",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(1) + "','fromdate':'" + $scope.fromdate + "','todate':'" + $scope.todate + "','status':'" + $scope.status + "'}", false, success = function (data) {

                       $scope.model = data;
                   }, failure = function (response) {

                   }
                   );
                }
                if ($scope.type == 2) {
                    common.httpPost("RetailorDashboard.aspx/getRetailerPaymentStatus",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(3) + "'}", false, success = function (data) {

                       $scope.model = data;
                   }, failure = function (response) {

                   }
                   );
                }
                if ($scope.type == 3) {
                    common.httpPost("RetailorDashboard.aspx/getRetalerPassbook",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(4) + "'}", false, success = function (data) {

                       $scope.model = data;
                   }, failure = function (response) {

                   }
                   );
                }
               
            }
            $scope.changeStatus = function (cartId, item) {
                
                common.httpPost("PendingOrder.aspx/updateStatus", "{'cartId':'" + cartId + "','lid':'" + item.L_USERID + "','lemailId':'" + item.L_EMAIL + "','lMobile':'" + item.L_MOBILE + "','orderId':'" + item.TRANSACTION_ID + "','address':'" + item.R_ADDRESS + "','productName':'" + item.PRODUCT_TITLE + "'}", false, success = function (data) {

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

            $scope.showDescSettlement = function (item) {

                $scope.TotalAmount = item.TotalAmount
                $scope.Commision_Fee = item.Commision_Fee
                $scope.DELIVERY_AMOUNT = item.DELIVERY_AMOUNT
                $scope.Collection_Fee = item.Collection_Fee
                $scope.Total_Marketplace_Fee = item.Total_Marketplace_Fee
                $scope.GST_Amount = item.GST_Amount
                $scope.Total_Deduction = item.Total_Deduction
                $scope.RETAILOR_PAY_AMOUNT = item.RETAILOR_PAY_AMOUNT
                $scope.Cid = item.Cid;
                $('#settlementAmount').modal('show');


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
    <asp:ScriptManager ID="scc" runat="server"></asp:ScriptManager>
   
       
    <div ng-app="myApp" ng-controller="myCtrl">


        <div class="modal fade" id="settlementAmount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="background: #a8cff0;padding: 42px;">
        <div class="modal-header">
           <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>--%>
        </div>
      <div class="modal-body clsmodal">
       
           <div class="col-sm-12">
               <div class="col-sm-9 "></div>
               <div class="col-sm-3" style="font-weight: bold;"></div>

                <div class="col-sm-8">Item</div>
               <div class="col-sm-4">Amount (Rs.)</div>


               <div class="col-sm-9 items">Selling Price (decided by you)</div>
               <div class="col-sm-3" style="font-weight: bold;">{{TotalAmount}}</div>

                <div class="col-sm-9 items">Commision fee(various across subcategory/verticals)</div>
               <div class="col-sm-3" style="font-weight: bold;"> {{Commision_Fee}}</div>
               
                <div class="col-sm-9 items" ng-if="Cid==1">Shipping Fee (Local Shiping,weight 500 grams)</div>
               <div class="col-sm-3" style="font-weight: bold;" ng-if="Cid==1"> {{DELIVERY_AMOUNT}}</div>

                <div class="col-sm-9 items">Collection Fee (2.9% on the order item value)</div>
               <div class="col-sm-3" style="font-weight: bold;"> {{Collection_Fee}}</div>


                <div class="col-sm-9 items">Total market fee</div>
               <div class="col-sm-3" style="font-weight: bold;"> {{Total_Marketplace_Fee}}</div>


                <div class="col-sm-9 items">GST(18% of marketplace fee including swachh bharat & krishi kalyan cess)</div>
               <div class="col-sm-3" style="font-weight: bold;"> {{GST_Amount}}</div>


                <div class="col-sm-9 items">Total deduction</div>
               <div class="col-sm-3" style="font-weight: bold;"> {{Total_Deduction}}</div>

                 <div class="col-sm-9 items">Settlement value(Amount credited to you)</div>
               <div class="col-sm-3" style="font-weight: bold;"> {{RETAILOR_PAY_AMOUNT}}</div>

               

           
       </div>
      </div>
      <div class="modal-footer">
      <%--  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>--%>
      </div>
    </div>
  </div>
</div>

        <div class="wallet-buttons">
            <div class="col-sm-10 bot">

                <asp:LinkButton PostBackUrl="~/Retailor/RetailorDashboard.aspx?type=1" ID="btnOrderTacking" class="btn btn-primary" runat="server">Order Tracking</asp:LinkButton>
                <asp:LinkButton PostBackUrl="~/Retailor/RetailorDashboard.aspx?type=2" ID="btnPayment" class="btn btn-primary" runat="server">Payment</asp:LinkButton>
                <asp:LinkButton PostBackUrl="~/Retailor/RetailorDashboard.aspx?type=3" ID="btnPassbook" class="btn btn-primary" runat="server">Passbook</asp:LinkButton>
                <%-- <asp:LinkButton ID="btnPassbook" class="btn btn-primary" runat="server" OnClick="btnPassbook_Click" >Passbook</asp:LinkButton>--%>
              
            </div>
        </div>



        <div class="agileits-modal modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88"
            aria-hidden="true">
            <div class="modal-dialog" style="text-align: justify">
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
            <div class="table-wrapper clearfix" style="padding: 15px;">Order Tracking
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center" width="50">S.No order</th>
                            <th>Transaction No</th>
                            <th>Transaction Date</th>
                            <th>Product Title</th>
                            <th>Measurement</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="item in model  | filter:query | orderBy: orderList | startFrom:currentPage*pageSize | limitTo:pageSize"" ng-cloak>
                            <td class="text-center">{{$index+1}}</td>
                          <%--  <td><a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a></td>--%>
                              <td><a href="OrderDetail.aspx?Tid={{item.TRANSACTION_ID}}&Rid={{'<%=hdnUserId.Value%>'}}">{{item.TRANSACTION_ID}}</a></td>
                            <td class="text-center">{{item.TRANSACTION_DATE}}</td>
                            <td class="text-center">{{item.PRODUCT_TITLE}}</td>
                            <td class="text-center">{{item.MEASUREMENT}}</td>
                            <td class="text-center">{{item.QUANTITY}}</td>
                            <td ng-if="item.STATUS==1">Pending</td>
                            <td ng-if="item.STATUS==2">Shipped</td>
                            <td ng-if="item.STATUS==3">Picked By Logistic</td>
                            <td ng-if="item.STATUS==4">In-Transit</td>
                            <td ng-if="item.STATUS==5" style="color:green">Delivered</td>
                            <td ng-if="item.STATUS==6">Un-Delivered</td>
                            <td ng-if="item.STATUS==7" style="color:red">Canceled</td>
                            <td ng-if="item.STATUS==1"><a ng-click="changeStatus(item.CART_ID,item)"><span class="dispatch">Ready To Shipped <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                            <td ng-if="item.STATUS==2">Shipped</td>
                            <td ng-if="item.STATUS==3">Picked By Logistic</td>
                            <td ng-if="item.STATUS==4">In-Transit</td>
                            <td ng-if="item.STATUS==5" style="color:green">Delivered</td>
                            <td ng-if="item.STATUS==6">Un-Delivered</td>
                            <td ng-if="item.STATUS==7" style="color:red">Canceled</td>

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
                           <th>Settlement Amount</th>
                           <th>Delivery Amount</th>
                          <th>Status</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr ng-repeat="item in model  | filter:query | orderBy: orderList | startFrom:currentPage*pageSize | limitTo:pageSize"" ng-cloak>
                          <td class="text-center">{{$index+1}}</td>
                          <td><a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a></td>
                           <td><a ng-click="showDescSettlement(item)">{{item.RETAILOR_PAY_AMOUNT}}</a></td>
                             <td>{{item.DELIVERY_AMOUNT}}</td>
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
           
</asp:Content>

