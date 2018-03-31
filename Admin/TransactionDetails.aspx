<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="TransactionDetails.aspx.cs" Inherits="Admin_TransactionDetails" %>

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
    

   
  
    <script src="/js2/skycons.js"></script>
    <style>
        .ddl{
            margin-left: 11%;
                width: 211px;
        }
        .wallet-buttons{
            margin-left: 37%;
    padding: 14px;
        }
        .filterdiv{
            margin: 20px;
        }
    </style>
    <script>
        debugger;
        var app = angular.module('myApp', []);
        var loginUserId = '<%=ddlRetailer.SelectedValue%>';
        app.controller('myCtrl', function ($scope, $http, $filter) {
            debugger;
            $scope.currentPage = 0;
            $scope.type = $('#hdnType').val();
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
               
                if ($scope.type == 1)
                {
                    debugger;
                    common.httpPost("TransactionDetails.aspx/getPaymentDetail",
                   "{'id':'" + loginUserId + "', 'action':'" + parseInt(5) + "','fromdate':'" + $scope.fromdate + "','todate':'" + $scope.todate + "','status':'" + $scope.status + "'}", false, success = function (data) {

                       $scope.model = data;
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
                $scope.transactionDate = item.TRANSACTION_DATE
                $scope.userName = item.USER_NAME
                $scope.address = item.ADDRESS
                $scope.productTitle = item.PRODUCT_TITLE
                $scope.productDescription = item.PRODUCT_DECSRIPTION
                $scope.productMeasurement = item.MEASUREMENT
                $scope.quantity = item.QUANTITY
                $scope.price = item.SELLINGPRICE
                $('#transactionDetails').modal('show');


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
            <div class="col-sm-6 filterdiv">
                <label class="col-sm-2">Retailer</label>
                <asp:DropDownList ID="ddlRetailer" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            
            <div class="table-wrapper clearfix" style="padding: 19px;">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center" width="50">S.No order</th>
                            <th>Transaction No/ Order No.</th>
                            <th>Transaction Date</th>
                            <th>Product Title</th>
                            <th>Measurement</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="item in model>
                            <td class="text-center">{{$index+1}}</td>
                            <td><a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a></td>
                            <td class="text-center">{{item.TRANSACTION_DATE}}</td>
                            <td class="text-center">{{item.PRODUCT_TITLE}}</td>
                            <td class="text-center">{{item.MEASUREMENT}}</td>
                            <td class="text-center">{{item.QUANTITY}}</td>
                            <td ng-if="item.STATUS==1">Pending</td>
                            <td ng-if="item.STATUS==2">Ready To Shipped</td>
                            <td ng-if="item.STATUS==3">Delieverd</td>
                            <td ng-if="item.STATUS==1"><a ng-click="changeStatus(item.CART_ID)"><span class="dispatch">Ready To Shipped <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                            <td ng-if="item.STATUS==2">Ready To Shipped</td>
                            <td ng-if="item.STATUS==3">Delieverd</td>

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
              <div class="col-sm-6 filterdiv">
                <label class="col-sm-2">Logistic</label>
            <select class="col-sm-4 form-control ddl">
                <option>asdasasd</option>
                 <option>asdasasd</option>
                 <option>asdasasd</option>
            </select>
            </div>
            
            <div class="table-wrapper clearfix" style="padding: 19px;">
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
                        <tr ng-repeat="item in model>
                            <td class="text-center">{{$index+1}}</td>
                            <td><a ng-click="showDesc(item)">{{item.TRANSACTION_ID}}</a></td>
                            <td class="text-center">{{item.TRANSACTION_DATE}}</td>
                            <td class="text-center">{{item.PRODUCT_TITLE}}</td>
                            <td class="text-center">{{item.MEASUREMENT}}</td>
                            <td class="text-center">{{item.QUANTITY}}</td>
                            <td ng-if="item.STATUS==1">Pending</td>
                            <td ng-if="item.STATUS==2">Ready To Shipped</td>
                            <td ng-if="item.STATUS==3">Delieverd</td>
                            <td ng-if="item.STATUS==1"><a ng-click="changeStatus(item.CART_ID)"><span class="dispatch">Ready To Shipped <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                            <td ng-if="item.STATUS==2">Ready To Shipped</td>
                            <td ng-if="item.STATUS==3">Delieverd</td>

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
      </div>
    </form>
</asp:Content>

