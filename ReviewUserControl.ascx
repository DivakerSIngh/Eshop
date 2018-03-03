<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReviewUserControl.ascx.cs" Inherits="ReviewUserControl" %>

<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js" charset="utf-8"></script>--%>

<%--<script src="js/rating.js"></script>--%>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="js/Stars/rating.css" rel="stylesheet" />
<script src="js/Stars/rating.js"></script>
<script>
    $(document).ready(function () {
        
      
        //setTimeout(function () { $('.rating').rating(); }, 300)
    });
    
    </script>

<div id="myModal" class="modal fade" role="dialog" style="width:50%;left: 23%;">
  <div class="modal-dialog">
   
    <!-- Modal content-->
      <asp:HiddenField id="userControlProduct" runat="server" ClientIDMode="Static"/>
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="headingProduct">Review Product for </h4>
      </div>
      <div class="modal-body">
        <p>

        </p>
          Rate : <div class="rate"> 
              <asp:TextBox  ID="txtrating" ClientIDMode="Static" runat="server" class="rating rating5"></asp:TextBox>
             <%-- <input type="text" class="rating rating5" id="rating" />--%>

                 </div>
         <p>Comments:</p> 
          <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine" style="width:400px;" ></asp:TextBox>
          
      </div>
      <div class="modal-footer">
          <asp:Button ID="btnSave" runat="server" class="btn btn-default" Text="Submit Review"  OnClick="btnSave_Click" />
        
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
      
  </div>
</div>
