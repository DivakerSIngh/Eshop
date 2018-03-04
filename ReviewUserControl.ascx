<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReviewUserControl.ascx.cs" Inherits="ReviewUserControl" %>


<div id="myModal" class="modal fade" role="dialog" style="width:50%;left: 23%;z-index: 99999;">
  <div class="modal-dialog">
   
    <!-- Modal content-->
      <asp:HiddenField id="userControlProduct" runat="server" ClientIDMode="Static"/>
       <asp:HiddenField id="hdnSearch" runat="server" ClientIDMode="Static"/>
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
          <asp:Button ID="btnSave" UseSubmitBehavior="false" runat="server" class="btn btn-default" Text="Submit Review"  OnClick="btnSave_Click" />
        
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
      
  </div>
</div>
