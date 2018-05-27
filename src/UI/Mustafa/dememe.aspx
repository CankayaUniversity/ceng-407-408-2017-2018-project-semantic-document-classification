<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dememe.aspx.cs" Inherits="dememe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
   
    <form id="form1" runat="server">
    <div>
     <table class="auto-style1">
        <tr>
            <td>
                <asp:ListBox ID="listSol" runat="server" AutoPostBack="true" OnSelectedIndexChanged="listSol_SelectedIndexChanged" Height="253px" Width="266px"></asp:ListBox>
            </td>
            <td>
                <asp:ListBox ID="listOrta" Visible="false" AutoPostBack="true"  runat="server" Height="220px" Width="229px"></asp:ListBox>
            </td>
            <td>
                <asp:ListBox ID="listSag" Visible="false" AutoPostBack="true"  runat="server" Height="228px" Width="204px"></asp:ListBox>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
