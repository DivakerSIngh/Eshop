<%@ Page Title="Card Info" Language="C#" MasterPageFile="~/WalletAccount.master" AutoEventWireup="true" CodeFile="CardInfo.aspx.cs" Inherits="CardInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .gift-voucher .card{
            width: 28%;
        }
        .gift-voucher .qty,.gift-voucher .view{
            width: 28%;
            display:inline-block;
        }
        .gift-voucher .logo img {
            float: none;
            padding-top: 6px;
            padding-right: 0;
            width: 54%;
        }
        .gift-voucher .cardText{
            padding-top:40px;
        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            width: 40%;
            background: url(images/back3.jpg);
        }
        .logo img{
            float: right;
            padding-top: 6px;
            padding-right: 6px;
            width: 40%;
        }
        .logo{
            width:100%;
        }
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }
        .body{
            padding: 30px 0;
            text-align:left;
        }
        .card {
            color:#2C313E;
            display: inline-block;

            text-align:center;
        }
        .cardText{
            padding-top:92px;
        }
        .info{
            display:inline-block;
            vertical-align:top;
            width:40%;
            text-align:center;
            margin-top:74px;
        }
        .info label{
            text-align:right;
            width:50%;
        }
        .info div div{
            width:30%;
            display:inline-block;
            text-align:left;
        }
        @media(max-width:870px){
            .card{
                width:50%
            }
            .gift-voucher .card{
            width: 32%;
            }
        }
        @media(max-width: 832px){
            .info{
                width:48%;
                font-size:90%;
            }
            .gift-voucher .card{
                width: 38%;
            }
        }
        @media(max-width:730px){
            .cardText h4{
                font-size: 14px;
            }
            .cardText h6{
                font-size:10px;
            }
            .cardText{
                padding-top:64px;
            }
            .info label,.info span{
                font-size:85%;
            }
            .premium{
                font-size:12px;
            }
        }
        @media(max-width:575px){
            div.my-border,div.details-acc{
                position:relative;
                width:70%;
                margin-left:15%;
            }
            div.details-acc{
                padding-left:0;
                padding-right: 0;
            }
            .info-panel .box {
                width: 26%;
                margin-left: 37%;
                padding-top: 31px;
            }
        }
        @media(max-width: 480px){
           div.my-border,div.details-acc{
                position:relative;
                width:98%;
                margin-left:2%;
            }
           .info label,.info span{
                font-size:60%;
            }
           .cardText h4{
                font-size: 12px;
            }
            .cardText h6{
                font-size:9px;
            }
            .card {
                width: 48%;
                margin-left: 1%;
            }
            .info{
                margin-top: 46px;
            }
            .gift-voucher .cardText {
                padding-top: 20px;
            }
            .gift-voucher .view{
                font-size:70%;
            }
        }
    
        #myModal88 .modal-content{
            width: 40%;
            margin-left: 30%;
        }
        #myModal88 p{
            font-size: 20px;
            font-weight: 400;
            color: crimson;
        }
        #myModal88 select{
            width: 40%;
            padding: 8px 2px;
            outline: none;
            font-size: 90%;
        }
        #myModal88 h5{
            color: #000;
        }
        @media(max-width: 1191px){
            #myModal88 .modal-content{
                width: 50%;
                margin-left: 25%;
            }
        }
        @media(max-width: 872px){
            #myModal88 .modal-content{
                width: 60%;
                margin-left: 20%;
            }
        }
        @media(max-width: 651px){
            #myModal88 .modal-content{
                width: 80%;
                margin-left: 10%;
            }
        }
        @media(max-width: 491px){
            #myModal88 .modal-content{
                width: 96%;
                margin-left: 2%;
                font-size: 16px;
            }
            #myModal88 p{
                font-size: 15px;
            }
            #myModal88 h5{
                font-size: .8em;
            }
            #myModal88 select{
                width: 50%;
            }
        }
        @media(max-width: 399px){
            #myModal88 .modal-content{
                width: 100%;
                margin-left:0;
            }
            #myModal88 select {
                width: 54%;
                font-size: 80%;
            }
        }
        @media(max-width: 319px){
            #myModal88 a.close2{
                font-size: .7em
            }
            #myModal88 select {
                width: 60%;
                font-size: 76%;
            }
        }
    </style>

     <script>
         function GetUserValue() {
             var person = prompt("Please enter your TShirt size : ", "S");
             if (person != null && person != "") {
                 document.getElementById("<%=hdnUserInput.ClientID%>").value = person;
                 return true;
             }
             else
                 return false;
         }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="pnlPremiumCard" runat="server">


         <div class="panel-acc">
             <div class="col-sm-10 table-container">
                <div class="body">
                    <asp:Panel ID="pnlCardShow" runat="server">

                    <a href="#" style="text-decoration:none">
                        <div class="card">
                            <div class="logo"><img src="images/newLogo.png"/></div> 
                            <div class="cardText">
                                <h4>Premium Card</h4>
                                <h4 ><asp:Label ID="lblp1" runat="server" Text=""></asp:Label>&nbsp;<asp:Label ID="lblp2" runat="server" Text=""></asp:Label>&nbsp;<asp:Label ID="lblp3" runat="server" Text=""></asp:Label>&nbsp;<asp:Label ID="lblp4" runat="server" Text=""></asp:Label></h4> 
                                <h6 style="text-align: left;padding-bottom: 8px;padding-left: 16px;"><asp:Label ID="lblName" runat="server" Text=""></asp:Label></h6>
                            </div>
                        </div>

                    </a>

                    <div class="info">
                        <div>
                            <label>Status:</label>
                            <div><asp:Label ID="lblStatus" runat="server" Text="Active"></asp:Label></div>
                        </div>
                        <div>
                            <label>Credit Amount:</label>
                            <div><span>0.00 INR</span></div>
                        </div>
                    </div>

                    </asp:Panel>
                </div>
             </div>
        </div>
     <%--   <div class="panel-acc gift-voucher">
             <div class="col-sm-10 table-container">
                <div class="body">
                    <asp:Panel ID="Panel1" runat="server">

                    <a href="#" style="text-decoration:none">
                        <div class="card" style="background: linear-gradient(to right, #001510, #00bf8f);">
                            <div class="logo"><img src="images/newLogo.png"/></div> 
                            <div class="cardText" style="color:#ffffff">
                                <h4>Gift Voucher</h4>
                                <h4 >XXXX&nbsp;XXXX&nbsp;XXXX</h4> 
                                <h6 padding-bottom: 8px;padding-left: 16px;">INR 100</h6>
                            </div>
                        </div>

                    </a>

                    <div class="info">
                        <div>
                            <label>Status:</label>
                            <div><asp:Label ID="Label1" runat="server" Text="Active"></asp:Label></div>
                        </div>
                        <div>
                            <label>Credit Amount:</label>
                            <div><span>0.00 INR</span></div>
                        </div>
                    </div>

                    </asp:Panel>
                </div>
             </div>
        </div>--%>
        <div class="panel-acc">
             <div class="col-sm-10 table-container">
                <div class="body" style="text-align:center">

        <asp:Panel ID="pnlFreeUser" runat="server">

            <h3>You are not a Premium User</h3> 
            <asp:HiddenField runat="server" ID="hdnUserInput" />
            <a class="btn btn-primary premium" onclick="modalShow();">Go Premium</a>
            <%--<a href="#" >Go Premium</a>--%>
                 <div class="agileits-modal modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88" aria-hidden="true">
		            <div class="modal-dialog" style="margin-top: 180px">
			            <div class="modal-content">
				            <div class="modal-header">
					            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					            <p class="modal-title" id="myModalLabel">Select Your T-shirt size</p>
				            </div>
				            <div class="modal-body modal-body-sub" style="text-align:center"> 
					            <h5 style="font-weight: 500;">Select Size </h5>  
					            <div class="form-group" style="margin-bottom:44px">
                                  <%--  <select style="width:60%;margin-left:20%" class="form-control" id="sel1">
                                        <option value="S">S</option>
                                        <option value="M">M</option>
                                        <option value="L">L</option>
                                        <option value="XL">XL</option>
                                    </select>--%>
                                    <asp:DropDownList ID="ddlsize" runat="server">
                                       <asp:ListItem Text="Small" Value="S"></asp:ListItem>
                                       <asp:ListItem Text="Medium" Value="M"></asp:ListItem>
                                       <asp:ListItem Text="Large" Value="L"></asp:ListItem>
                                    </asp:DropDownList>

					            </div>
                                <asp:LinkButton ID="btnPremium" CssClass="close2"  runat="server" OnClick="btnPremium_Click">Go Premium</asp:LinkButton>
					            <%--<a class="close2" data-dismiss="modal" aria-hidden="true" href="#" >Join Now</a>--%>
				            </div>
			            </div>
		            </div>
	            </div>
	<script>
	    function modalShow() {
	        $('#myModal88').modal('show');
	    }
	    </script>
    

            </asp:Panel>

                    </div>
                 </div>
            </div>


    </asp:Panel>



    <div class="panel-acc gift-voucher">
             <div class="col-sm-10 table-container">
                <div class="body">
                    <asp:Panel ID="pnlGiftVoucher" runat="server">
                        <div class="card" style="background: linear-gradient(to right, #001510, #00bf8f);">
                            <div class="logo"><img src="images/newLogo.png"/></div> 
                            <div class="cardText" style="color:#ffffff">
                                <h4>Gift Voucher</h4>
                                <h4 >XXXX&nbsp;XXXX&nbsp;XXXX</h4> 
                                <h6 padding-bottom: 8px;padding-left: 16px;">INR 100</h6>
                            </div>
                        </div>
                        <div class="info">
                        <div class="qty">
                            <label>Qty:</label>
                            <div><asp:Label ID="lblQty" runat="server" Text="1"></asp:Label></div>
                        </div>
                        <div class="view">
                            <asp:LinkButton ID="btnViewGiftCard" runat="server" style="text-decoration:none" OnClick="btnViewGiftCard_Click">View All</asp:LinkButton>
                        </div>
                    </div>
                        
        
<div class="panel-acc gift-voucher">
             <div class="col-sm-10 table-container" style="margin-bottom: 20px;border:none">
                <div class="body">
        <asp:Panel ID="pnlGiftList" runat="server">

            <asp:Repeater ID="rptGiftVoucherList" runat="server">

                                    <HeaderTemplate>
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Voucher Code</th>
                        <th>Status</th>
                    </tr>
                </thead>
                 </HeaderTemplate>
                                    <ItemTemplate>

                <tbody>
                    <tr>
                        <td>  <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("SNo") %>'></asp:Label></td>
                        <td>  <asp:Label ID="lblGVCode" runat="server" Text='<%# Eval("GVId") %>'></asp:Label></td>
                        <td>
                            <asp:LinkButton ID="lbtnUsegiftVoucher" runat="server" OnClick="lbtnUsegiftVoucher_Click" Text='<%# Eval("GStatus") %>'></asp:LinkButton></td>
                    </tr>
                    </ItemTemplate>
                                    <FooterTemplate>

                </tbody>
            </table>
         
                                        
                                    </FooterTemplate>

                                </asp:Repeater>


        </asp:Panel>
                    </div>
                 </div>
    </div>

                    

                    </asp:Panel>
                </div>
             </div>
        </div>


</asp:Content>

