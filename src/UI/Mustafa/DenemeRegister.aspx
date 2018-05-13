<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DenemeRegister.aspx.cs" Inherits="DenemeRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
</head>
<body style="background-image:url(supertemiz.jpg);">
    <form runat="server" style="background-color:transparent; width: 1185px; margin-left: 442px;">
      <div style="margin-left: 0px">&nbsp;<asp:Label ID="lblReservation" runat="server" Font-Bold="True" Text="REGISTRATION" Font-Size="35pt" Font-Underline="True"></asp:Label></div>
          <asp:Label ID="lblName" runat="server" Text="Name:" Font-Bold="True"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="TextBoxName" runat="server" placeholder="Name"></asp:TextBox>
          <br />
          <br />
          <asp:Label ID="lblSurname" runat="server" Text="Surname:" Font-Bold="True"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxSurname" runat="server" placeholder="Surname" ></asp:TextBox>
          <br />
          <br />
          <asp:Label ID="lblCity" runat="server" Text="City:" Font-Bold="True"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxCity" runat="server" placeholder="City" ></asp:TextBox>
          <br />
          <br />
        <asp:Label ID="lblPhone" runat="server" Text="Phone:" Font-Bold="True"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxPhone" runat="server" placeholder="Phone"></asp:TextBox>
          <br />
          <br />
          <asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxEmail" TextMode="Email" runat="server" placeholder="Email"></asp:TextBox>
          <br />
          <br />
        <asp:Label ID="lblAddress" runat="server" Text="Address:" Font-Bold="True"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxAddress" runat="server" placeholder="Age"></asp:TextBox>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
          <br />
          <br />
          <asp:Label ID="lblPassword" runat="server" Text="Password:" Font-Bold="True"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
          <br />
          <br />
          <asp:Label ID="lblPasswordRepeat" runat="server" Text="Password(Repeat):" Font-Bold="True"></asp:Label>
          &nbsp;
        <asp:TextBox ID="TextBoxPasswordCheck" TextMode="Password" runat="server" placeholder="Password Again"></asp:TextBox>
          <br />
          <br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="ButtonRegister" runat="server" Text="Register" OnClick="ButtonRegister_Click" Font-Bold="True" Height="50px" Width="129px" />
          <br />
          <br />
          <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="Passwords don't match!" ControlToCompare="TextBoxPasswordCheck" ControlToValidate="TextBoxPassword"></asp:CompareValidator>
          <br />
          <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label> 
    </form>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="Login.aspx">Sign In</a> 
</body>
</html>
