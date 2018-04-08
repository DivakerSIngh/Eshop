<%@ Page Title="Product Image" Language="C#" MasterPageFile="~/Employee/EmployeePanel.master" AutoEventWireup="true" CodeFile="AddProductImage.aspx.cs" Inherits="Retailor_AddProductImage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


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
    <style>
        label{
            font-weight:300;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form runat="server">
        <asp:ScriptManager ID="scriptmanager2" runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="updatepnl" runat="server">
            <ContentTemplate>


                <!--banner-->
                <div class="banner" style="text-align:center">

                            <asp:RadioButtonList ID="rbImage" runat="server" style="width:30%;font-weight:200"  RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rbImage_SelectedIndexChanged">
                                <asp:ListItem Value="A">Add Image</asp:ListItem>
                                <asp:ListItem Value="U">Image Preview</asp:ListItem>
                            </asp:RadioButtonList>


                </div>

                <br />

                <div class="banner">

                    <div class="form-group">
                        <%--<label for="focusedinput" class="col-sm-2 control-label" style="text-align: left; width: 130px;">Select Retailer
                            <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" /></label>--%>


                        <table style="width:34%">

                            <tr>

                                <td style="width: 130px; text-align: center;">Select Product
                                </td>
                                <td style="width: 130px; text-align: center;">
                                    <asp:DropDownList ID="ddlProdImage" runat="server" CssClass="dropdown" AutoPostBack="True" OnSelectedIndexChanged="ddlProdImage_SelectedIndexChanged"></asp:DropDownList>
                                </td>

                            </tr>

                        </table>


                        <div class="col-sm-2" style="display: none;">
                            <p class="help-block">Your help text!</p>
                        </div>
                    </div>


                </div>

                <!--//banner-->
                <!--content-->
                <!---->
                <asp:Panel ID="pnladd" runat="server">


                    <div class="blank">


                        <div class="blank-page">

                            <div class="grid-form1">
                                <h3>Add Product&#39;s Image</h3>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="horizontal-form">




                                        <div class="form-group">
                                            <label for="focusedinput" class="col-sm-2 control-label" style="text-align: left;">Select Images
                                                <asp:Label ID="Label4" runat="server" Text="*   Image size should be less than 1 Mb" ForeColor="Red" /></label>
                                            <div class="col-sm-8">

                                                <telerik:RadUpload ID="fileupload" runat="server" Skin="WebBlue"></telerik:RadUpload>

                                            </div>
                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-sm-8 col-sm-offset-2">
                                            <asp:Button ID="btnProdImgSubmit" class="btn-primary btn" runat="server" Text="Submit" OnClick="btnProdImgSubmit_Click" />
                                            <asp:Button ID="btnProdImgCancel" class="btn-default btn" runat="server" Text="Cancel" OnClick="btnProdImgCancel_Click" />
                                          
                                        </div>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                </asp:Panel>


                <asp:Panel ID="pnlUpdate" runat="server">
                    <div class="blank">

                        <div class="blank-page">

                            <div class="grid-form1">
                                <h3>Product's Image Preview</h3>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="horizontal-form1">



                                        <asp:Panel ID="pnlrepeater" runat="server" Style="width: 100%;">



                                            <div style="width: 80%;">

                                                <asp:GridView ID="gv_Images" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" CellSpacing="5" Width="100%" BorderStyle="None" OnRowDataBound="gv_Images_RowDataBound" OnRowCommand="gv_Images_RowCommand">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Image Id">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblImgId" runat="server" Font-Bold="True" ForeColor="#003366" Text='<%# Eval("pimgid") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Image">
                                                            <ItemTemplate>
                                                                <asp:Image ID="imgProd" runat="server" Height="150px" Width="150px" />
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkDelete" runat="server" Font-Bold="True" ForeColor="#003366" CommandName="GetId" CommandArgument='<%#Bind("pimgid") %>'>Delete</asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#999999" HorizontalAlign="Center" Width="100%" />
                                                    <EmptyDataRowStyle Width="100%" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                </asp:GridView>

                                            </div>

                                            <div class="col-sm-2" style="display: none;">
                                                <p class="help-block">Your help text!</p>
                                            </div>






                                        </asp:Panel>

                                    </div>

                                </div>
                            </div>

                        </div>

                    </div>
                </asp:Panel>


            </ContentTemplate>

              <triggers>
                                            <asp:PostBackTrigger ControlID="btnProdImgSubmit" />
                                            </triggers>

        </asp:UpdatePanel>

        </form>

    <!--//content-->


</asp:Content>

