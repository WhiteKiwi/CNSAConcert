<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CNSAConcert.admin.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
	<form runat="server">
		<h1>ID</h1>
		<asp:TextBox runat="server" ID="UserID" placeholder="ID"></asp:TextBox>
		<h1>PW</h1>
		<asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="PW"></asp:TextBox>
		<asp:Button runat="server" ID="LoginButton" Text="Login" OnClick="LoginButton_Click" />
	</form>
</body>
</html>
