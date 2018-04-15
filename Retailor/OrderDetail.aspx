<%@ Page Title="" Language="C#" MasterPageFile="~/Retailor/RetailorPanel.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Retailor_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
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
    <!--skycons-icons-->
    <script src="/js2/skycons.js"></script>
    <!--//skycons-icons-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="blank">

                    Order Details
                    <div class="blank-page">
                      <div id="form1">
                          <asp:Repeater ID="rptOrderDetail" runat="server" OnItemDataBound="rptOrderDetail_ItemDataBound">
                              <ItemTemplate>
                          <table>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="lblProdId" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label1" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label2" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label3" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label4" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label5" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label6" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label7" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label8" runat="server"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td>Product Id :</td>
                                  <td><asp:Label ID="Label9" runat="server"></asp:Label></td>
                              </tr>
                          </table>
                                  </ItemTemplate>
                         </asp:Repeater>
                      </div>
                        
                    </div>
                </div>
</asp:Content>

