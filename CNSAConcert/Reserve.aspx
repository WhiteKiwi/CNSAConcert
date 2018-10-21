<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="CNSAConcert.Reserve" %>

<!DOCTYPE html>
<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CNSA CONCERT</title>

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css?ver=0.1">
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css?ver=0.1">
</head>
<body>
	<!-- 본문에 대한 코드 -->
	<div class=" col-9 container" style="text-align: left; float: left; padding: 2rem; position: relative;">
		<!-- 제목 -->
		<br>
		<h1 style="width: 50%; color: white; background-color: #707070; margin-left: 350px; padding: 10px 0px 10px 0px; text-align: center"><strong>Stage</strong></h1>
		<h1 style="text-align: center; margin-bottom: 45px;"><strong><asp:Label runat="server" ID="AREA"></asp:Label></strong></h1>
		<%
            bool[,] soldOutSeats = CNSAConcert.Managers.SeatManager.GetSoldOutSeats((string)Session["Grade"]);
            for (int i = 3; i <= 21; i++) {
                Response.Write("<div style=\"margin-left: 210px; margin-top: 5px;\">");

                Response.Write("<span class=\"badge badge-primary\" style=\"font-size: 20px; background-color: gainsboro; color: black; width: 80px; margin-right: 10px; float: left;\">" + (char)(64 + i) + "</span><div style=\"float: left; padding-top: 2.5px;\">");

                for (int j = 1; j <= 19; j++) {
                    if (!soldOutSeats[i - 1, j - 1])
                        Response.Write("<span style=\"margin-right: 5px;\"><a href=\"javascript:selectSeat(" + i + ", " + j + ")\" class=\"badge badge-primary\" style=\"background-color: #5BC0DE; font-size: 20px; width: 40px; padding-top: 20px;\">   </a></span>");
                    else
                        Response.Write("<span style=\"margin-right: 5px;\"><a href=\"javascript:selectSeat(" + i + ", " + j + ")\" class=\"badge badge-primary sold-out\" style=\"background-color: #5BC0DE; font-size: 20px; width: 40px; padding-top: 20px;\">   </a></span>");
                }

                Response.Write("</div></div><div style=\"clear: both;\"></div>\n");
            }
		%>
	</div>

	<div class="col-3 border border-bottom-0 border-secondary text-left" style="padding: 1rem; float: left; overflow: auto; background-color: #EFF0EB; height: 100%">

		<table style="width: 450px; height: 800px; margin-bottom: 20px; background-color: #EFF0EB; border-left: 3px solid #707070; border-right: 3px solid #707070; float: right">
			<tr style="margin-top: 64px;">
				<td>

					<div style="width: 207px; height: 341px; background-color: #FFFFFF; float: left; margin-left: 43px; margin-top: 55px; border: 3px solid #707070">
					</div>

					<div style="width: 144.7px; height: 321.5px; float: right; margin-right: 43px; margin-top: 50px; margin-bottom: 64px">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
						<hr style="border: 2px solid  #707070; margin-bottom: 15px; background-color: #707070;">
					</div>

				</td>
			</tr>

			<tr>
				<td style="border-top: 3px solid #707070;">
					<div style="margin-top: 30px;">
						<b style="margin-left: 80px; font-size: 30px;">잔여석</b>
					</div>

					<div>
						<table style="width: 304px; background-color: #FFFFFF; margin-top: 10px; margin-bottom: 60px; margin-left: 65px; border: 3px solid #707070;">

							<tr>
								<td>
									<p style="margin-left: 7px; margin-bottom: 1px"><font size="4">CN구역(1학년): <asp:Label runat="server" ID="OneBae"></asp:Label></font></p>
									<br />
									<p style="margin-left: 7px"><font size="3">SA구역(2학년): <asp:Label runat="server" ID="TwoBae"></asp:Label></font></p>
								</td>
							</tr>

							<tr>
								<td style="border-top: 3px solid #707070;">
									<p style="margin-left: 7px">선택좌석</p>

									<div style="width: 26.35px; height: 26.35px; background-color: #5BC0DE; margin-left: 7px; margin-bottom: 35px; float: left;"></div>
									<div id="seat" style="margin-bottom: 20px; float: left; display: none;">
										&nbsp;<asp:Label runat="server" ID="Grade" name="grade"></asp:Label><span id="reservation" name="reservation"></span>
									</div>
								</td>
							</tr>
						</table>
					</div>


					<form method="post" runat="server">
						<input id="row" name="row" type="hidden" value="" />
						<input id="col" name="col" type="hidden" value="" />
						<button style="width: 220px; height: 102px; background-color: #FFFFFF; color: black;" onclick="backhome()" type="button"><font size="6"><b>취소</b></font></button>
						<button type="submit" style="width: 220px; height: 102px; background-color: #707070; float: right; color: white;"><font size="6"><b>예매하기</b></font></button>
					</form>
				</td>
			</tr>
		</table>
	</div>

	<script>
		function selectSeat(row, col) {
			document.getElementById("row").value = row;
			document.getElementById("col").value = col;
			// grade display: none;
			document.getElementById("seat").style.display = "block";
			document.getElementById("reservation").innerText = String.fromCharCode(64 + row) + "열-" + (col < 10 ? "0" + col : col) + "번";

			// "#reservation".Text row + "-" + col
		}

		function backhome() {
			window.location.href = "/";
		}
	</script>
</body>
</html>
