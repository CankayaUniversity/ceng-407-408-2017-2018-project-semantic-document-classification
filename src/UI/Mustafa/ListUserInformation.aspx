<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListUserInformation.aspx.cs" Inherits="ListWorkerInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>List User Information Page</title>
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
<body style="background-image:url(images1.jpg); background-repeat:no-repeat"  >
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
        <li class="active"><a href="Homepage.aspx">Home</a></li>
      </ul>
        <ul class="nav navbar-nav navbar-right">
        <li><a href="Homepage.aspx"><span class="glyphicon glyphicon"></span> Logout</a></li>
      </ul>
    </div>   
  </div>

</nav>
       <div>
    <asp:GridView ID="grdList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="grdList_RowDeleting" OnRowCancelingEdit="grdList_RowCancelingEdit" OnRowEditing="grdList_RowEditing" OnRowUpdating="grdList_RowUpdating">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="User ID" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" Text='<%# Bind("Name")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Surname">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSurname" Text='<%# Bind("Surname")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSurname" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:TemplateField>                               
                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEMailAddress" Text='<%# Bind("Email")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEMailAddress" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:TemplateField>              
                <asp:TemplateField HeaderText="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhone" Text='<%# Bind("Phone")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" Text='<%# Bind("Address")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCity" Text='<%# Bind("City")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:TemplateField>                             
                 <asp:TemplateField HeaderText="Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPassword" Text='<%# Bind("Password")%>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPassword" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:TemplateField>
                
                <asp:CommandField DeleteText="Sil" EditText="Düzenle" HeaderText="Operations" ShowDeleteButton="True" ShowEditButton="True" />
                
            </Columns>
            <EditRowStyle BackColor="#999999" />
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
       
    </form>
</body>
</html>
