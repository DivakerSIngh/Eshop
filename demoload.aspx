<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demoload.aspx.cs" Inherits="demoload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">

        #overlay {
    position: fixed;
    z-index: 99;
    top: 0px;
    left: 0px;
    background-color: #f8f8f8;
    width: 100%;
    height: 100%;
    filter: Alpha(Opacity=90);
    opacity: 0.9;
    -moz-opacity: 0.9;
}            
#theprogress {
    background-color: #fff;
    border:1px solid #ccc;
    padding:10px;
    width: 300px;
    height: 30px;
    line-height:30px;
    text-align: center;
    filter: Alpha(Opacity=100);
    opacity: 1;
    -moz-opacity: 1;
}
#modalprogress {
    position: absolute;
    top: 40%;
    left: 50%;
    margin: -11px 0 0 -150px;
    color: #990000;
    font-weight:bold;
    font-size:14px;
}

    </style>

</head>
<body>
    <form id="form1" runat="server">
 
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
          <asp:UpdateProgress ID="prgLoadingStatus" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="pnl">
    <ProgressTemplate>
        <div id="overlay">
            <div id="modalprogress">
               
                <div id="theprogress">
                    <asp:Image ID="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="/images/loading.gif" />
                    Please wait...
                </div>
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>  
        
        <asp:UpdatePanel runat="server" ID="pnl"> 

            <ContentTemplate>
                <div>
        this page loading is complete......

        this


            </div>

            </ContentTemplate>

        </asp:UpdatePanel>
        
        

    </form>
</body>
</html>
