<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Logistic/LogisticPanel.master" AutoEventWireup="true" CodeFile="PendingOrder.aspx.cs" Inherits="Retailor_PendingOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css2/retailer.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

    <script src="../js2/common.js"></script>

 
    <script>
        var app = angular.module('myApp', []);
        

        var loginUserId = '<%=hdnUserId.Value%>';
        var action = '<%=hdnTrack.Value%>'
        
        app.controller('myCtrl', function ($scope, $http, $filter) {
            $scope.currentPage = 0;
            $scope.type = action;
            $scope.pageSize = 1000000;
            $scope.model = [];
            $scope.query = '';
            $scope.orderList = [];
            $scope.fromdate = new Date();
            $scope.todate = new Date();
            $scope.status = ""
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
                
                common.httpPost("PendingOrder.aspx/getAllOrderList",
                    "{'id':'" + loginUserId + "', 'action':'" + parseInt(action) + "','fromdate:''" + $scope.fromdate + "','todate:''" + $scope.todate + "','status:''" + $scope.status + "'}", false, success = function (data) {
                    
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
    <asp:HiddenField runat="server" ID="hdnUserId" ClientIDMode="Static" />
      <asp:HiddenField runat="server" ID="hdnTrack" ClientIDMode="Static" />
    <div ng-app="myApp" ng-controller="myCtrl">
       

         <div class="col-xs-12 col-sm-4 col-md-4" style="padding: 20px;">
                           <label> From Date: </label>  <input type="date" id="fromdate" placeholder="from date" title="Type here to search" ng-model="fromdate" class="form-control" />
                        </div>

         <div class="col-xs-12 col-sm-4 col-md-4" style="padding: 20px;">
                           <label> To Date: </label>  <input type="date" id="todate" placeholder="to date" title="Type here to search" ng-model="todate" class="form-control" />
                        </div>

        <div class="col-xs-12 col-sm-4 col-md-4" style="padding: 20px;">
                           <label> Status: </label>  
            <select class="form-control" ng-model="status">
                <option value="" selected disabled>Select Status</option>
                <option value="1">Order Placed</option>
                <option value="2">Ready To Dispatched</option>
                <option value="3">Shipped</option>
                <option value="4">Delievered</option>
                <option value="5">Canceled</option>
            </select>        
                        </div>

          <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center;padding: 10px;">
                          <input type="button" value="Apply" class="btn-primary btn"  ng-click="apply()"/>
              <input type="button" value="Cancel"  class="btn-default btn"/>
                        </div>


        <div class="table-wrapper clearfix" style="padding: 19px;">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" width="50">S.No</th>
                        <th>Title
              
                        </th>
                        <th>Description
                

                        </th>
                        <th>UserName</th>


                        <th>City
                   
                  
                        </th>
                        <th>Selling Price
                   
                        </th>
                        <th>Cost
                
                        </th>
                        <th>Description
                
                        </th>
                          <th>Amount
                
                        </th>
                          <th>User Email
                
                        </th>
                        
                        <th width="300" ng-if="type=='p'">Action              
                        </th>
                         <th width="300" ng-if="type=='t'">Status              
                        </th>



                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in model | filter:query | orderBy: orderList | startFrom:currentPage*pageSize | limitTo:pageSize"">
                        <td class="text-center">{{$index+1}}</td>
                        <td>{{item.PRODUCT_TITLE}}</td>
                        <td>{{item.PRODUCT_DECSRIPTION}}</td>
                        <td>{{item.USER_NAME}}</td>
                        <td>{{item.USER_CITY}}</td>
                        <td>{{item.SELLINGPRICE}}</td>
                        <td>{{item.COSTPRICE}}</td>
                         <td>{{item.PRODUCT_DECSRIPTION}}</td>
                        <td>{{item.DELIVERY_AMOUNT}}</td>
                         <td>{{item.USER_EMAIL_ID}}  {{item.STATUS}}</td>
                        <td  ng-if="type=='p'"><a ng-click="changeStatus(item.CART_ID)"><span class="dispatch">Ready To Dispatch <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span></a></td>
                         <td  ng-if="type!='p'">
                           <span style="color: black;" ng-if="item.STATUS==1">Booked</span>
                             <span style="color: black;" ng-if="item.STATUS==2">Ready To Shiped</span>
                             <span style="color: black;" ng-if="item.STATUS==3">Dispatch</span>
                         </td>
                    </tr>
                   
                </tbody>
                <tfoot>
                                        <tr class="pagination-wrap">
                                            <td colspan="8" class="text-right">
                                                <div class="paging">
                                                    <button ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1" class="paginbutton">
                                                        Previous
                                                    </button> 
                                                    <button class="counting paginbutton">{{currentPage+1}}/{{numberOfPages()}}  </button>
                                                    <button ng-disabled="currentPage >= getData().length/pageSize - 1" ng-click="currentPage=currentPage+1" class="paginbutton">
                                                        Next
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tfoot>
            </table>


        </div>
    </div>

</asp:Content>
