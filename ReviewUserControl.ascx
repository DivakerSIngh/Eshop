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
        debugger
      
        setTimeout(function () { $('.rating').rating(); }, 300)
        });
    </script>

<div id="myModal" class="modal fade" role="dialog" style="width:50%;left: 23%;">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Review Product</h4>
      </div>
      <div class="modal-body">
        <p>

        </p>
          Rate : <div class="rate">  <input type="text" class="rating rating5" /></div>
         <p>Comments:</p> <textarea id="txtReview" rows="3" style="width:400px;"></textarea>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-success">Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
