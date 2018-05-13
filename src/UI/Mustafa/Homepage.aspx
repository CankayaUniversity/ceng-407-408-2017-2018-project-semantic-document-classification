<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>SDC Home Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="jumbotron">
  <div class="container text-center">
    <h1>Semantic Document Classification</h1>      
    <p>Nihan Gümüş - Mustafa Güngör - Merve Uğur</p>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" >SDC</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="AdminHomepage.aspx">Home</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Login.aspx"><span class="glyphicon glyphicon"></span> Login</a></li>
        <li><a href="DenemeRegister.aspx"><span class="glyphicon glyphicon-user"></span> Register</a></li>
      </ul>
    </div>   
  </div>

</nav>
        
       
<div style="float:left; width:46%; height: 343px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Left  <asp:Button ID="Button1" runat="server" Text="Button" />
</div>
<div style="float:right; width:50%;  height: 344px;">
Right  <asp:Button ID="Button2" runat="server" Text="Button" />
</div>
    </form>
</body>
</html>
