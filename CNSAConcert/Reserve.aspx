<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="CNSAConcert.Reserve" %>

<!DOCTYPE html>
<html>
<!DOCTYPE html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css?ver=0.1">
</head>
<body>
	<%
		var leftSeats = CNSAConcert.Managers.SeatManager.GetLeftSeats((string)Session["Grade"]);
		for (int i = 1; i <= 17; i++) {
			Response.Write("<span>");
			for (int j = 1; j <= 17; j++) {
				if (leftSeats[i, j]) {
					// 매진석
					Response.Write("<button class=\"reservation-button reserved\"  onclick=\"selectSeat(" + i + ", " + j + ")\"></button>");
				} else {
					// 빈자리
					Response.Write("<button class=\"reservation-button\" onclick=\"selectSeat(" + i + ", " + j + ")\"></button>");
				}
			}
			Response.Write("</span><br/>");
		}
	%>
	<br />

	<form method="post">
		<input id="row" name="row" type="hidden" value="" />
		<input id="col" name="col" type="hidden" value="" />
		<button type="submit">예매</button>
	</form>
	<script>
		function selectSeat(row, col) {
			document.getElementById("row").value = row;
			document.getElementById("col").value = col;
		}
	</script>
</body>
</html>
<!DOCTYPE html>
