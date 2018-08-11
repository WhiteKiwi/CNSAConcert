<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveCheck.aspx.cs" Inherits="CNSAConcert.ReserveCheck" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form runat="server">
		<asp:Label runat="server" ID="Reservation"></asp:Label>
		<br/>
        <asp:Button runat="server" ID="CancelButton" OnClick="CancelButton_Click" Text="예매 취소" />
    </form>
</body>
</html>
