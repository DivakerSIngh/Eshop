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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"> </script>
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
    <script>
       
        $(window.onload(function ()
        {
            if (window.location.search.includes('flag=ts')) {
                $('#myModal88 .modal-header h4').text('Payment Status');
                $('#myModal88 .modal-body-sub').html('<div id="w"><div id="content"><div class="notify successbox"><h1>Success!</h1><span class="alerticon"><img src="../images/check.png" alt="checkmark" /></span><p>Transaction Completed Successfully</p></div></div></div>');
                //callGiftVoucherMethod();
                $('#myModal88').modal('show');
            }
            else if (window.location.search.includes('flag=tf')) {
                $('#myModal88 .modal-header h4').text('Payment Status');
                $('#myModal88 .modal-body-sub').html('<div id="w"><div id="content"><div class="notify errorbox"><h1>Failure!</h1><span class="alerticon"><img src="../images/error.png" alt="error" /></span><p>Transaction Failed</p></div></div></div>');
                //callGiftVoucherMethod();
                $('#myModal88').modal('show');
            }
        })) 
        
       // })

        //function callGiftVoucherMethod() {
        //    $('#sendGiftVoucher').click()

        //}
    </script>
    <script>
        var app = angular.module('myApp', []);
        var chartData = ['jan', 'feb', 'mar', 'apr', 'may', 'jun',
       'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
        var staticArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var loginUserId = '<%=hdnUserId.Value%>';
        app.controller('myCtrl', function ($scope, $http, $filter) {
            $scope.model = [];
            $scope.staticArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            $scope.chartData = ['jan', 'feb', 'mar', 'apr', 'may', 'jun',
     'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
            $scope.chartData = function () {
                common.httpPost("RetailorDashboard.aspx/getSaleReport", "{'year':'" + 2018 + "','id':'" + loginUserId + "','action':'1'}", false, success = function (data) {

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
                              name: 'User',
                              data: $scope.staticArray
                          }]
                    });

                }, failure = function (response) {

                }
                    );
            }
            $scope.chartData();
        })
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <asp:Button ID="sendGiftVoucher" runat="server" ClientIDMode="Static" OnClick="sendGiftVoucher_Click" Style="display: none;" />
    <asp:HiddenField runat="server" ID="hdnUserId" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="hdnTrack" ClientIDMode="Static" />
    <div class="col-sm-12 col-xs-12" ng-app="myApp" ng-controller="myCtrl">

        <asp:LinkButton ID="lnkPendingOrders" CssClass="columngroup totalUser" runat="server" OnClick="lnkPendingOrders_Click">

            <div class="inner">
                <figure>
                    <i class="fa fa-users"></i>
                </figure>
                <h2>Order Tracking</h2>
                <p>
                    Pending Order :
           <asp:Button Style="border: none; background: none;" runat="server" ID="lblPendingOrder"></asp:Button>
                </p>
                <div class="clearfix"></div>
                <p>
                    <asp:Button Style="border: none; background: none;" runat="server" Text="Track Order " ID="Button1" OnClick="Button1_Click"></asp:Button>
                </p>
            </div>
        </asp:LinkButton>


        <asp:LinkButton ID="lnkpaymentHistory" CssClass="columngroup procedure" runat="server" OnClick="lnkpaymentHistory_Click">
    <div  class="inner totalpayment">
      <figure >
        <i  class="fa fa-product-hunt"></i>
      </figure>
      <h2 >Payment History</h2>
      <p >114</p>
      <div  class="clearfix"></div>
      
    </div>
        </asp:LinkButton>

        <asp:LinkButton ID="LinkButton1" CssClass="columngroup condition" runat="server" OnClick="lnkpaymentHistory_Click">
 
    <div  class="inner totaltarnsaction" >
      <figure >
        <i  class="fa fa-contao"></i>
      </figure>
      <h2 >Privay & Policy</h2>
      <p >79</p>
      <div  class="clearfix"></div>
      
    </div>
        </asp:LinkButton>
    </div>
    <div class="col-sm-12 col-xs-12">
        <div id="chartData" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

    </div>





</asp:Content>

