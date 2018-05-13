<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="CNSAConcert.Account" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
</head>
<body>
	<form runat="server">
		<asp:Textbox runat="server" ID="OldPassword" TextMode="Password"></asp:Textbox><br />
		<asp:Textbox runat="server" ID="NewPassword" TextMode="Password"></asp:Textbox><br />
		<asp:Textbox runat="server" ID="NewPassword2" TextMode="Password"></asp:Textbox><br />
		<br />
		<asp:Button runat="server" ID="ApplyButton" Text="Apply" OnClick="ApplyButton_Click" />
	</form>
</body>
</html>
