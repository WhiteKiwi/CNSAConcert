<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="CNSAConcert.Reserve" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<body>
	<form runat="server">
		<asp:TextBox runat="server" ID="Row"></asp:TextBox><br />
		<asp:TextBox runat="server" ID="Column"></asp:TextBox><br />
		<br />
		<asp:Button runat="server" ID="ReserveButton" Text="예매" OnClick="ReserveButton_Click" />
	</form>
</body>
</html>
