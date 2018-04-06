﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="TransactionDetails.aspx.cs" Inherits="Admin_TransactionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    

    <%--<script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
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
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>    
    <link rel="Stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />  
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <script src="../js2/common.js"></script>
    
    <script src="../js2/pace/pace.min.js"></script>
    <link href="../js2/pace/pace.min.css" rel="stylesheet" />
  
    <script src="/js2/skycons.js"></script>
    <style>
        input[readonly=readonly] {
    background: #80808047;
    border: none;
    text-align: center;
}
        span.spnLable {
    font-size: 16px;
}
        .td-details {
    padding: 9px;
}
        .ddl,#ddlRetailer,#ddlSortBy{
          
                width: 211px;
        }
        .modal-body{
            border-bottom: 1px solid #ede9e9;
        }
        .divfooter{
            text-align: center;
        }
        .divfooter input[type=button]{
            margin: 20px;
    background: #0280e1;
    border: none;
    padding: 9px;
    color: #fff;
    font-size: 1em;
    outline: none;
        }
        .wallet-buttons{
            margin-left: 37%;
    padding: 14px;
        }
        .filterdiv{
            margin: 20px;
        }
        .changeStatus{
            background: #337ab7;
    padding: 6px;
        }

    </style>
    <script>
       
        var app = angular.module('myApp', []);
        var loginUserId = '';
        app.controller('myCtrl', function ($scope, $http, $filter) {
           
            common.httpPost("TransactionDetails.aspx/bindRetailer", "{'id':" + 1 + "}", false, success = function (data) { $scope.retailerList = data; }, failure = function (response) { });

            $scope.retailerId = $scope.retailerList[0].USERID;
            $scope.currentPage = 0;
            $scope.sortBy = "1";
            $scope.type = $('#hdnType').val();
            $scope.pageSize = 1000000;
            $scope.model = [];
            $scope.query = '';
            $scope.orderList = [];
            $scope.fromdate = "";
            $scope.todate = "";
            $scope.status = "1"
            $scope.payementType = "";
            $scope.payementStatus = "";
            $scope.date = new Date();
           
            $scope.getRetailerTransaction = function () {
                
               // $('.loader').show();
                if (!$scope.retailerId) alert("Please select retailer first");
                $scope.type = 1;
                $scope.getAllProduct(1);
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
                    loginUserId = $scope.retailerId;
                   
                    common.httpPost("TransactionDetails.aspx/getPaymentDetail",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(5) + "','fromdate':'" + $scope.fromdate + "','todate':'" + $scope.todate + "','status':'" + $scope.status + "','sortBy':'" + $scope.sortBy + "'}", false, success = function (data) {

                       $scope.model = data;
                      // $('.loader').hide();
                   }, failure = function (response) {

                   }
                   );
                }
                if ($scope.type == 2) {
                    common.httpPost("TransactionDetails.aspx/getPaymentDetail",
                  "{'id':'" + loginUserId + "', 'action':'" + parseInt(6) + "','fromdate':'" + $scope.fromdate + "','todate':'" + $scope.todate + "','status':'" + $scope.status + "'}", false, success = function (data) {

                      $scope.model = data;
                  }, failure = function (response) {

                  }
                  );
                }
            }
            $scope.getAllProduct(0);

            $scope.apply = function () {
                $scope.getAllProduct(0);

            }

            $scope.showDesc = function (item) {

                $scope.transactionId = item.TRANSACTION_ID
                $scope.paymentStatus = 'Pending'
                $scope.userName = item.USER_NAME
                $scope.address = item.ADDRESS
                $scope.productTitle = item.PRODUCT_TITLE
                $scope.productDescription = item.PRODUCT_DECSRIPTION
                $scope.productMeasurement = item.MEASUREMENT
                $scope.quantity = item.QUANTITY
                $scope.price = item.SELLINGPRICE
                $('#transactionDetails').modal('show');


            }
            $scope.updateStatus = function () {
                
                $scope.transactionId
                $scope.date = $('input[type=date]').val();
                $scope.payementType
                
                
                common.httpPost("TransactionDetails.aspx/updatePaymentStatus",
                "{'Rid':'" + $scope.retailerId + "', 'transaction_id':'" + $scope.transactionId + "','RETAILOR_PAY_TRANSACTION_NO':'" + $scope.transactionNo + "','RETAILOR_PAY_DATE':'" + $scope.date + "','RETAILOR_PAY_AMOUNT':'" + 0 + "','RETAILOR_PAY_STATUS':'" + $scope.payementStatus + "','RETAILOR_PAY_MODE':'" + $scope.payementType + "'}", false, success = function (data) {
                    //$scope.model = data;
                    $scope.getAllProduct(1);
                    $('#transactionDetails').modal('hide');
                }, failure = function (response) {

                }
                );

            }
           
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form runat="server">
     <asp:ScriptManager ID="scc" runat="server"></asp:ScriptManager>

       
    <div ng-app="myApp" ng-controller="myCtrl">
        <asp:HiddenField ID="hdnType" runat="server" ClientIDMode="Static" Value="1" />
        <asp:HiddenField runat="server" ID="hdnUserId" ClientIDMode="Static" />
        <div class="wallet-buttons">
            <div class="col-sm-10 bot">

                <asp:LinkButton Visible="false" PostBackUrl="~/Admin/TransactionDetails.aspx?type=1" ID="btnRetailer" class="btn btn-primary" runat="server">Retailer</asp:LinkButton>
                <asp:LinkButton Visible="false" PostBackUrl="~/Admin/TransactionDetails.aspx?type=2" ID="btnLogistic" class="btn btn-primary" runat="server">Logistic</asp:LinkButton>
               
            </div>
        </div>
        <asp:Panel ID="pnlRetailer" runat="server">
            <div class="col-sm-12 filterdiv">
                <label class="col-sm-2">Retailer</label>
                <select id="ddlRetailer" class="col-sm-2 form-control" ng-model="retailerId" >
                    <option value="" selected>Select</option>
                    <option ng-repeat="item in retailerList" value="{{item.USERID}}">{{item.USER_NAME}}</option>
                </select>
                <div class="col-sm-6">
                <%--<input type="button" value="Search" class="btn btn-primary" ng-click="getRetailerTransaction()" />--%>
            </div>

                  <label class="col-sm-2">Sort By</label>
                <select id="ddlSortBy" class="col-sm-2 form-control" ng-model="sortBy" >
                    <option value="1">Order Date</option>
                    <option value="2">Payment Date</option>
                </select>
                <div class="col-sm-6">
              
            </div>
                  <input type="button" value="Search" class="btn btn-primary" ng-click="getRetailerTransaction()" />
            </div>
          
            
            <div class="table-wrapper clearfix" style="padding: 19px;">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center" width="50">S.No order</th>
                            <th>Order Id.</th>
                            <th>Order Date</th>
                            <th>Delievered Status</th>
                            <th>Payment Status</th>
                            <th>Amount</th>
                            <th>Payment Date</th>  
                             <th>Action</th>                         
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="item in model" ng-cloack>
                            <td class="text-center">{{$index+1}}</td>
                            <td>
                                <a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a>
                              
                            </td>
                            <td class="text-center">{{item.TRANSACTION_DATE}}</td>
                            <td class="text-center">
                               Delievered

                            </td>
                            <td class="text-center">{{item.RETAILOR_PAY_STATUS}}</td>
                            <td class="text-center">{{item.DELIVERY_AMOUNT}}</td>
                             <td class="text-center">{{item.RETAILOR_PAY_DATE}}</td>
                            
                            <td >{{item.RETAILOR_PAY_STATUS}}</td>
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

         <asp:Panel ID="pnlLogistic" runat="server">
             
        </asp:Panel>



        <%--detail modal popup--%>
         <div class="agileits-modal modal fade" id="transactionDetails" tabindex="-1" role="dialog"
            aria-hidden="true">
            <div class="modal-dialog" style="text-align: justify">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Transaction Details</h4>
                    </div>
                    <div class="modal-body modal-body-sub">
                        <div class="td-details">
                           <span class="spnLable"> Transaction Id  :</span>
                            <input type="text" readonly="readonly" ng-model="transactionId" value="{{transactionId}}" /> 
                        </div>
                        <div  class="td-details">
                          <span class="spnLable">  Payment Mode :</span> 
                            <select ng-model="payementType">
                              <option selected value="">COD</option>
                               <option >Netbanking</option>
                               <option >Cash</option>
                                                                         </select>
                        </div>
                    
                         <div  class="td-details" ng-show="payementType=='Netbanking'">
                          <span class="spnLable"> Transaction No :</span>  <input type="text" value="" ng-model="transactionNo" maxlength="100" />  
                        </div>
                        <div  class="td-details">
                          <span class="spnLable"> Payment Status :</span> 
                             <select ng-model="payementStatus">
                              <option selected value="">Proceed</option>
                               <option>Paid</option>
                               <option>Dispute</option>
                                  <option>Refund</option>
                                                                         </select> 
                        </div>
                        <div  class="td-details">
                          <span class="spnLable">  Date : </span><input type="date" mg-model="date"/>
                        </div>
                       
                       
                    </div>
                    <div class="divfooter">
                        <input type="button" ng-click="updateStatus()" class="btn-default" value="Update Status" />
                    </div>
                </div>
                
            </div>
        </div>
      </div>
    </form>
</asp:Content>

