<%@ Page Title="Login Mode" Language="C#" MasterPageFile="~/SAdminPanel.master" AutoEventWireup="true" CodeFile="SelectLoginMode.aspx.cs" Inherits="SelectLoginMode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


      

    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type="text/javascript"></script>


     <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/normalize.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.css">
        <link rel="stylesheet" type="text/css" href="css/style2.css">
        <link rel="stylesheet" type="text/css" href="css/queries.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400" rel="stylesheet">
       

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="panel panel-primary js--panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Select Your Login Mode</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-3">
                        <div class="plan-box js--wp-4">
                            <div>
                                <img src="images/admin.png" alt="Admin Login" class="login-img">
                            </div>
                            <div>
                                <a class="btn btn-primary" href="PanelLogin.aspx?mode=A">Admin Login</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="plan-box js--wp-4">
                            <div>
                                <img src="images/Employees.png" alt="Employee Login" class="login-img">
                            </div>
                            <div>
                                <a class="btn btn-primary" href="PanelLogin.aspx?mode=E">Employee Login</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="plan-box js--wp-4">
                            <div>
                                <img src="images/courier.jpg" alt="Logistics Login" class="login-img">
                            </div>
                            <div>
                                <a class="btn btn-primary" href="PanelLogin.aspx?mode=L">Logistics Login</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="plan-box js--wp-4">
                            <div>
                                <img src="images/1497112683_store-sign.png" alt="Retailer Login" class="login-img">
                            </div>
                            <div>
                               <a class="btn btn-primary" href="PanelLogin.aspx?mode=R" >Retailer Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

</asp:Content>

