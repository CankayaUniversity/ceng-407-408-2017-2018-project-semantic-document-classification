<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextFile.aspx.cs" Inherits="TextFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
    
        <br />
        <br />
        <br />
        <br />
    
    </div>
        <asp:Button ID="Button1" runat="server" Height="22px" OnClick="Button1_Click" style="margin-top: 0px" Text="Doc2vec" Width="73px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="word2vec" Width="74px" />
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
