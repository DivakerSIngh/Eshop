<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/EmployeePanel.master" AutoEventWireup="true" CodeFile="AddUsers.aspx.cs" Inherits="Employee_AddUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>

          
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
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="../js2/common.js"></script>
    <link href="/css2/custom.css" rel="stylesheet" />
    <script src="/js2/custom.js"></script>
    <script src="/js2/screenfull.js"></script>
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

    <!--pie-chart--->
   
    <script src="/js2/skycons.js"></script>
    

    <script>
        var app = angular.module('myApp', []);
        app.controller('UserController', ['$scope', '$http', employeeController]);
       
        function employeeController($scope, $http) {
            $scope.User = {};
            $scope.UserList = [];
            $scope.loading = false;
            $scope.updateShow = false;
            $scope.addShow = true;
            common.httpPost("AddUsers.aspx/getUser", "{}", false, success = function (data) {
                
                $scope.UserList = JSON.parse(data);
                $scope.loading = false;
            }, failure = function (response) { });



         
            $scope.add = function () {
                
                $scope.loading = true;
                common.httpPost("AddUsers.aspx/addUser", "{'mobile':" + $scope.User.Mobile + ",'loginId':" + $('#hdnLoginId').val() + "}", false, success = function (data) {
                    if ($scope.UserList.length == JSON.parse(data).length) {
                        toastr.error('Mobile no already exist !');
                    } else {
                        $scope.User.Mobile = "";
                        toastr.success('User added successfull !');
                    }
                    $scope.UserList = JSON.parse(data);
                    $scope.loading = false;
                }, failure = function (response) { });

            }

            $scope.edit = function (item) {
                $scope.userId = item.UserId;
                $scope.User.Mobile = item.Mobile;
                $scope.updateShow = true;
                $scope.addShow = false;
            }
            $scope.update = function () {
                $scope.loading = true;
                common.httpPost("AddUsers.aspx/updateUser", "{'mobile':'" + $scope.User.Mobile + "','loginId':'" + $scope.userId + "'}", false, success = function (data) {
                    $scope.UserList = JSON.parse(data);
                    $scope.User.Mobile = "";
                    $scope.updateShow = false;
                    $scope.addShow = true;
                    $scope.loading = false;
                }, failure = function (response) { });
            }

           
            $scope.delete = function (item) {
               
                $scope.loading = true;
                common.httpPost("AddUsers.aspx/deleteUser", "{'mobile':'" + item.Mobile + "','loginId':'" + item.UserId + "'}", false, success = function (data) {
                    $scope.UserList = JSON.parse(data);
                    $scope.User.Mobile = "";
                    $scope.updateShow = false;
                    $scope.addShow = true;
                    $scope.loading = false;
                }, failure = function (response) { });
            }
            $scope.cancel = function () {
                $scope.updateShow = false;
                $scope.addShow = true;
                $scope.newemployee = '';
                $scope.User.Mobile = "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnadd" runat="server">

  
     <div ng-app="myApp" ng-controller="UserController">
   
    <form name="addUser" style="width: 600px; margin: 0px auto;"> 
         <div class="loader" ng-if="loading"></div>
                    <div class="form-group">  
                        <label for="cname" class="col-sm-2 control-label">Mobile no:</label>  
                        <div class="col-sm-10 space">  
                            <input type="text" maxlength="10" class="form-control" id="mobile" placeholder="Mobile No" ng-model="User.Mobile" required />  
                        </div>  
                    </div>  
                   
                    <br />  
                    <div class="form-group space">  
                        <div class="col-sm-offset-2 col-sm-10" style="padding: 16px;">  
                            <input type="submit" value="Insert" ng-click="add()" ng-show="addShow" ng-disabled="!addUser.$valid" class="btn btn-primary" />  
                            <input type="submit" value="Update" ng-click="update()" ng-show="updateShow" ng-disabled="!addUser.$valid" class="btn btn-primary" />  
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
                            <th>Password</th>  
                            <th>Registration_Mode</th>  
                            <th>RegistrationType</th>  
                            <th>Actions</th>  
                        </tr>  
                        <tr ng-repeat="item in UserList">  
                            <td>  
                                <p>{{ item.UserId }}</p>  
                            </td>  
                            <td>  
                                <p>{{ item.Mobile }}</p>  
                            </td>  
                            <td>  
                                <p>{{ item.UPwd }}</p>  
                            </td>  
                             <td>  
                                <p>{{ item.Registration_Mode }}</p>  
                            </td> 
                             <td>  
                                <p>{{ item.RegistrationType }}</p>  
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
     <form runat="server" class="form-horizontal">
     <asp:ScriptManager ID="scriptmanager1" runat="server">
</asp:ScriptManager>
           <asp:HiddenField ID="hdnLoginId" runat="server" ClientIDMode="Static" />
        <asp:UpdatePanel ID="updatepnl" runat="server" Visible="false">
<ContentTemplate>

     <div class="grid_3 grid_5">
	     <h3 class="head-top">Add User</h3>
	     <div class="but_list">
	       <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Manual</a></li>
			  <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Excel</a></li>
			  <li role="presentation" class="dropdown">
			    <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents">Dropdown <span class="caret"></span></a>
			    <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
			      <li><a href="#dropdown1" tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">@fat</a></li>
			      <li><a href="#dropdown2" tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a></li>
			    </ul>
			  </li>
			</ul>
		<div id="myTabContent" class="tab-content">
		  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
		    <table>
                <tr>
                    <td>

                        <asp:TextBox ID="txtMobile" class="form-control1" placeholder="Ente Mobile Number" runat="server"></asp:TextBox>

                    </td>
                    <td>

                         <asp:Button ID="btnCreate" class="btn-primary btn" runat="server" Text="Create" OnClick="btnCreate_Click" />

                    </td>
                </tr>
		    </table>
		  </div>
		  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
		    <table>
                <tr>
                    <td>

                        <asp:FileUpload ID="fupExcel" runat="server" />

                    </td>
                    <td>

                         <asp:Button ID="btnExcel" class="btn-primary btn" runat="server" Text="Create"  />

                    </td>
                </tr>
		    </table>
		  </div>
		  <div role="tabpanel" class="tab-pane fade" id="dropdown1" aria-labelledby="dropdown1-tab">
		    <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
		  </div>
		  <div role="tabpanel" class="tab-pane fade" id="dropdown2" aria-labelledby="dropdown2-tab">
		    <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
		  </div>
		</div>
   </div>
   </div>
  </div>

    </ContentTemplate>
            </asp:UpdatePanel>
        </form>



</asp:Content>

