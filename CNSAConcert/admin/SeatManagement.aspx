<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeatManagement.aspx.cs" Inherits="CNSAConcert.admin.SeatManagement" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form runat="server">
		<h1>학년</h1>
		<asp:TextBox runat="server" ID="Grade"></asp:TextBox>
		<h1>Row</h1>
		<asp:TextBox runat="server" ID="Row"></asp:TextBox>
		<h1>Col</h1>
		<asp:TextBox runat="server" ID="Col"></asp:TextBox>
		<asp:Button runat="server" ID="AddButton" OnClick="AddButton_Click" Text="추가" />
    </form>
</body>
</html>
