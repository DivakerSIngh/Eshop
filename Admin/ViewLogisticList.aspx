<%@ Page Title="Logistic List" Language="C#" MasterPageFile="~/Admin/SAdminPanel.master" AutoEventWireup="true" CodeFile="ViewLogisticList.aspx.cs" Inherits="Logistic_ViewLogisticList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="/ToastMessage/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="/ToastMessage/toastr.css" rel="stylesheet" type="text/css" />
    <script src="/ToastMessage/toastr.js" type=" text/javascript"></script>

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
     <script runat="server">
        private bool CheckVisible(object sta)
        {
            var isvalid = false;
            var status=  Convert.ToString(sta);
            if (status == "N")
            {
                isvalid = true;
            }else
            {
                isvalid = false;
            }
            return isvalid;
        }
         private bool CheckVisibleActive(object sta)
        {
            var isvalid = false;
            var status=  Convert.ToString(sta);
            if (status == "Y")
            {
                isvalid = true;
            }else
            {
                isvalid = false;
            }
            return isvalid;
        }

        

    </script>
    <!----->

    <!--pie-chart--->
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

         <!--content-->
                <!---->
                	<form runat="server" class="form-horizontal">
                <div class="blank">


                    <div class="blank-page">
                      Logistic List
                        <asp:GridView ID="gv_LogisticList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" ForeColor="#003366" Text= '<%#Container.DataItemIndex+1 %>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" ForeColor="#003366" Text='<%#Eval("title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-warning" CommandArgument='<%#Eval("lid") %>' OnCommand="LinkButton1_Command">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkBlock" Visible='<%# CheckVisible(Eval("LStatus"))%>' runat="server" class="btn btn-warning" style="margin:10px 0;" BackColor="#ff0000" CommandArgument='<%#Eval("userid") %>' OnCommand="lnkBlock_Command">Block</asp:LinkButton>
                                        <asp:LinkButton ID="lnkActive" Visible='<%# CheckVisibleActive(Eval("LStatus"))%>' runat="server" class="btn btn-warning" style="margin:10px 0;" BackColor="#33cc33" CommandArgument='<%#Eval("userid") %>' OnCommand="lnkActive_Command">Active</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#999999" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </div>
                </div>
                </form>
                <!--//content-->


</asp:Content>

