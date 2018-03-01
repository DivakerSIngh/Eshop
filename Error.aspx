<%@ Page Title="Error" Language="C#" MasterPageFile="~/homeMasterPage.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
      margin: 0;
      padding: 0;
      background: #e7ecf0;
      font-family: Arial, Helvetica, sans-serif;
  }
  *{
      margin: 0;
      padding: 0;
  }
  p{
      font-size: 12px;
      color: #373737;
      font-family: Arial, Helvetica, sans-serif;
      line-height: 18px;
  }
  p a{
      color: #218bdc;
      font-size: 12px;
      text-decoration: none;
  }
  a{
      outline: none;
  }
  .f-left{
      float:left;
  }
  .f-right{
      float:right;
  }
  .clear{
      clear: both;
      overflow: hidden;
  }

  @media(max-width:480px){
      h2{
          font-size: 17px;
      }
  }

  #block_error{
      width: 70%;
      height: auto;
      border: 1px solid #cccccc;
      margin: 10% 0;
      margin-left: 15%;
      -moz-border-radius: 4px;
      -webkit-border-radius: 4px;
      border-radius: 4px;
      -webkit-box-shadow: 0px 0px 44px -8px rgba(0,0,0,0.75);
      -moz-box-shadow: 0px 0px 44px -8px rgba(0,0,0,0.75);
      box-shadow: 0px 0px 44px -8px rgba(0,0,0,0.75);
  }
  #block_error div{
      padding: 66px 40px 40px 42px;
  }
  #block_error div h2{
      color: #218bdc;
      font-size: 24px;
      display: block;
      padding: 0 0 14px 0;
      border-bottom: 1px solid #cccccc;
      margin-bottom: 12px;
      font-weight: normal;
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="block_error">
        <div>
         <h2>Error 404. &nbspOops you've have encountered an error</h2>
        <p>
        It apperrs that Either something went wrong or the page doesn't exist anymore..<br />
        This website is temporarily unable to service your request as it has exceeded it’s resource limit. Please check back shortly.
        </p>
        </div>
    </div>
</asp:Content>

