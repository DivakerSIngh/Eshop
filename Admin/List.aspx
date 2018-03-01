<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="Admin_List" %>

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
    <script src="/js2/custom.js"></script>
   
    <script src="/js2/skycons.js"></script>
     <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        #btnSearch,#btnExport{
                margin-top: 26px;
    border: none;
    padding: 7px;
    background: #ffc673;
    color: white;
    border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="blank containers">

    
   
        

          <div class="row col-sm-12 col-xs-12">
               <div class="row">
        <div class="col-sm-12">
            <div  class="col-sm-3">
                <label>Start Date</label>
                 <input type="date" class="form-control" />
            </div>

             <div  class="col-sm-3">
                <label>End Date</label>
                 <input type="date" class="form-control" />
            </div>
            <div  class="col-sm-3">
               <input type="button" value="Search" id="btnSearch" />
            </div>
             <div  class="col-sm-3">
               <input type="button" value="Export Data" id="btnExport" />
            </div>
           
        </div>
    </div>
         <div id="chartData" style="min-width: 310px; height: 389px; margin: 0 auto">

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
                        <th>Amount
                   
                        </th>
                       



                    </tr>
                </thead>
                <tbody>
                    <tr >
                        <td class="text-center">1</td>
                        <td>asdasdasdasd</td>
                        <td>asdasd</td>
                        <td>rewetr456456</td>
                        <td>asdasdasd34234f  </td>
                        <td>asdasd4 sarsdfdsf</td>
                       
                    </tr>
                      <tr >
                        <td class="text-center">1</td>
                        <td>asdasdasdasd</td>
                        <td>asdasd</td>
                        <td>rewetr456456</td>
                        <td>asdasdasd34234f  </td>
                        <td>asdasd4 sarsdfdsf</td>
                       
                    </tr>
                      <tr >
                        <td class="text-center">1</td>
                        <td>asdasdasdasd</td>
                        <td>asdasd</td>
                        <td>rewetr456456</td>
                        <td>asdasdasd34234f  </td>
                        <td>asdasd4 sarsdfdsf</td>
                       
                    </tr>
                      <tr >
                        <td class="text-center">1</td>
                        <td>asdasdasdasd</td>
                        <td>asdasd</td>
                        <td>rewetr456456</td>
                        <td>asdasdasd34234f  </td>
                        <td>asdasd4 sarsdfdsf</td>
                       
                    </tr>
                   
                </tbody>
                <tfoot>
                                       
                                    </tfoot>
            </table>


        </div>
         </div>
        
     </div>
        </div>
</asp:Content>

