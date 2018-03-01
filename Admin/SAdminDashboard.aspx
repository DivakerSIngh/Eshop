<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="SAdminDashboard.aspx.cs" Inherits="Admin_SAdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css2/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <link href="/css2/style.css" rel='stylesheet' type='text/css' />
    <link href="/css2/font-awesome.css" rel="stylesheet" />
    <script src="/js2/jquery.min.js"> </script>
    <!-- Mainly scripts -->
    <script src="/js2/jquery.metisMenu.js"></script>
    <script src="/js2/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <link href="/css2/custom.css" rel="stylesheet" />
    <script src="../js2/common.js"></script>
    <script src="/js2/custom.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
     <style>
        .containers{
           background: white;
    margin: 19px;
        }
        .retailerDiv {
       background: #ff98008c;
    margin: 17px;
    color: white;
    font-size: 20px;
    padding: 43px;
}
        #btnSearch{
                margin-top: 26px;
    border: none;
    padding: 7px;
    background: #ffc673;
    color: white;
    border-radius: 5px;
        }
    </style>
   <%-- <script src="/js2/screenfull.js"></script>
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

    <!--pie-chart---> --%>
    <script>
         var app = angular.module('myApp', []);
         var chartData = ['jan', 'feb', 'mar', 'apr', 'may', 'jun',
        'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
         var staticArray_Retailer = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
         var staticArray_Logistic = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
         ;
         app.controller('myCtrl', function ($scope, $http) {
            $scope.model = [];
            $scope.staticArray_Retailer = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            $scope.staticArray_Logistic = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            $scope.chartData = ['jan', 'feb', 'mar', 'apr', 'may', 'jun','jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
            
            $scope.chartData = function () {
                common.httpPost("SAdminDashboard.aspx/getSaleReportForRetailer", "{'year':'" + 2018 + "','action':'4'}", false, success = function (data) {
                    $scope.model = data;
                    $.each(data, function (index, item) {
                        $scope.staticArray_Retailer[index] = parseInt(item.TOTALSALES);
                        $scope.staticArray_Logistic[index] = parseInt(item.TOTALSALES_LOGISTIC);
                    });
                    Highcharts.chart('chartData', {
                        chart: {
                            type: 'line'
                        },
                        title: {
                            text: 'Dashboard Chart'
                        },
                        credits: {
                            enabled: true
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
                              name: 'Retailer',
                              data:$scope.staticArray_Retailer
                          },
                          {
                              name: 'Logistic',
                              data: $scope.staticArray_Logistic
                          }
                        ]
                    });
                }, failure = function (response) {

               }
              );
            }
            $scope.chartData();
        })

    </script>
    <script src="/js2/pie-chart.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#demo-pie-1').pieChart({
                barColor: '#3bb2d0',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-2').pieChart({
                barColor: '#fbb03b',
                trackColor: '#eee',
                lineCap: 'butt',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-3').pieChart({
                barColor: '#ed6498',
                trackColor: '#eee',
                lineCap: 'square',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });


        });

    </script>
    <!--skycons-icons-->
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     
    <div class="blank containers" ng-app="myApp" ng-controller="myCtrl">

    <div id="##demo-pie-1">

    </div>
   
        <div class="row">
        <div class="col-sm-4">
            <div class="retailerDiv">
                <div>
                    Total Retailer:  200 
                </div>
                 <div>
                    Total Amount: $ 209990 
                </div>

            </div>
        </div>
             <div class="col-sm-4">
            <div class="retailerDiv">
                <div>
                    Total Logistic:  200 
                </div>
                 <div>
                    Total Amount: $ 209990 
                </div>

            </div>
        </div>
    </div>

          <div class="row col-sm-12 col-xs-12">
               <div class="row">
        <div class="col-sm-12">
            <div  class="col-sm-4">
                <label>Start Date</label>
                 <input type="date" class="form-control" />
            </div>

             <div  class="col-sm-4">
                <label>End Date</label>
                 <input type="date" class="form-control" />
            </div>
            <div  class="col-sm-4">
               <input type="button" value="Search" id="btnSearch" />
            </div>
           
        </div>
    </div>
         <div id="chartData" style="min-width: 310px; height: 389px; margin: 0 auto"></div>
        
     </div>
        </div>

  

</asp:Content>

