<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/SAdminPanel.master" CodeFile="ViewReceipt.aspx.cs" Inherits="Admin_ViewReceipt" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <style>
        .imgstyle{
            height: 213px;
    width: 430px;
     background: red;
    transition: width 2s;
     transition: height 2s;
    -webkit-transition: width 2s; /* Safari 3.1 to 6.0 */
     -webkit-transition: height 2s; /* Safari 3.1 to 6.0 */
        }


        img.imgstyle:hover{
             width: 100%;
              height: 100%;
        }
    </style>
    <script runat="server">
        private string bindImage(object img)
        {
            return "data:image/png;base64," + Convert.ToBase64String((byte[])img);
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <form id="reciept" runat="server" class="form-horizontal">
    <asp:ScriptManager ID="scriptmanager1" runat="server">
    </asp:ScriptManager>
    <div style="margin-left: 17px;
    margin-top: 53px;
    background: white;
    padding: 22px;">
        <div class="col-sm-12">
            <div class="row">

           
            <div class="col-sm-1">
                <label>Logistic</label>
            </div>
            <div class="col-sm-4">
                 <asp:DropDownList ID="ddlLogistic" runat="server" OnSelectedIndexChanged="ddlLogistic_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
            </div>

            <div class="col-sm-2">
                <label>Transaction Id</label>
            </div>
            <div class="col-sm-4">
                <asp:TextBox ID="txttranId" runat="server" CssClass="form-control">

                </asp:TextBox>
            </div>
                 </div>
            <div class="row" style="text-align:center;">
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click" Text="Search" />
            </div>
           
        </div>
        <br />
         <br />
         <br />
        <div style="margin-top: 18px;
    margin-left: 21%;">
           <asp:ListView ID="lstView" runat="server" GroupPlaceholderID="groupPlaceHolder1"  
          ItemPlaceholderID="itemPlaceHolder1" OnPagePropertiesChanging="lstView_PagePropertiesChanging">  
          <LayoutTemplate>  
              <table border="1">  
                  <tr>  
                      <th>Order Id  
                      </th>  
                      <th>Logistic  
                      </th>  
                      <th>Receipt   
                      </th>  
                       
                  </tr>  
                  <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>  
                  <tr>  
                      <td colspan="3">  
                          <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstView" PageSize="2">  
                              <Fields>  
                                  <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"  
                                      ShowNextPageButton="false" />  
                                  <asp:NumericPagerField ButtonType="Link" />  
                                  <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />  
                              </Fields>  
                          </asp:DataPager>  
                      </td>  
                  </tr>  
              </table>  
          </LayoutTemplate>  
          <GroupTemplate>  
              <tr>  
                  <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>  
              </tr>  
          </GroupTemplate>  
          <ItemTemplate>  
              <div>

             
              <td>  
                  <%# Eval("TRANS_ID") %>  
              </td>  
              <td>  
                  <%# Eval("LID") %>  
              </td>  
              <td>  
                <asp:Image CssClass="imgstyle" ImageUrl='<%#bindImage(Eval("IMAGE")) %>' runat="server" />  
              </td>  
                   </div>
             
          </ItemTemplate>  
      </asp:ListView>  
        </div>
    </div>
       </form>
</asp:Content>