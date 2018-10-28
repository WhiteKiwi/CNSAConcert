<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="CNSAConcert.Reserve" %>

<!DOCTYPE html>
<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CNSA CONCERT</title>
	<link rel="shortcut icon" href="/assets/img/favicon.png" />

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css">

	<link rel="stylesheet" href="/assets/css/font.css">
</head>
<body class="background">
	<!-- NAVBAR -->
	<div id="nav" class="navbar" style="position: relative;">
		<div style="margin-top: 10px; margin-left: 20px;">
			<a href="/Default.aspx">
				<img src="/assets/img/CNSALOGO.png" width="50" /></a>
		</div>
		<div><a href="/Account.aspx" class="nanum-square">비밀번호 변경</a></div>
		<div><a href="/Reserve.aspx" class="nanum-square">예매</a></div>
		<div><a href="/ReserveCheck.aspx" class="nanum-square">예매 확인</a></div>
		<div><a href="/AboutUs.aspx" class="nanum-square">About us</a></div>
		<div style="float: right;"><a href="/Logout.aspx" class="nanum-square">로그아웃</a></div>
	</div>
	<div style="content: ''; display: table; clear: both;"></div>

	<!-- 예매 -->
	<div class="reservation">
		<!-- 왼쪽 -->
		<div class="nanum-square">
			<br />
			<asp:Label runat="server" ID="AREA" class="chaparralPro reservation-area-h1"></asp:Label>
			<div class="reservation-alert">
				<h1>안내사항</h1>
				<div>CNSA CONCERT 2018</div>
				<div>장소 : 충남삼성고등학교 충무관</div>
				<div>일시 : 2018년 11월 30일 19시 20분</div>
				<div>티켓을 지참하셔야 출입이 가능합니다.</div>

				<br />
				<br />
				<br />

				<h1>주의사항</h1>
				<div>주의사항은 다음과 같습니다.</div>
				<div>본인만이 본인 좌석을 선택할 수 있으며</div>
				<div>타 학생의 개인정보를 이용하여 좌석</div>
				<div>예매시 불이익이 있을 수 있습니다.</div>
			</div>
		</div>

		<!-- 가운데 -->
		<div>
			<h1 class="nanum-square reservation-title">좌석 선택</h1>
			<div class="reservation-div chaparralPro">
				<div>
					<div class="num"></div>
					<div class="num">1</div>
					<div class="num">2</div>
					<div class="num">3</div>
					<div class="num">4</div>
					<div class="num">5</div>
					<div class="num">6</div>
					<div class="num">7</div>
					<div class="num">8</div>
					<div class="num">9</div>
					<div class="num">10</div>
					<div class="num">11</div>
					<div class="num">12</div>
					<div class="num">13</div>
					<div class="num">14</div>
					<div class="num">15</div>
					<div class="num">16</div>
					<div class="num">17</div>
					<div class="num">18</div>
				</div>
				<div style="content: ''; display: table; clear: both;"></div>

				<%
					bool[,] soldOutSeats = CNSAConcert.Managers.SeatManager.GetSoldOutSeats((string)Session["Grade"]);
					int row = ((string)Session["Grade"]) == "1" ? 21 : 19;
					for (int i = 3; i <= row; i++) {
						Response.Write("<div><div class=\"num\">" + (char)(64 + i) + "</div>");

						for (int j = 1; j <= 18; j++) {
							if (!soldOutSeats[i - 1, j - 1])
								Response.Write("<button class=\"seat-button\" onclick=\"selectSeat(" + i + ", " + j + ")\"></button>");
							else
								Response.Write("<button class=\"seat-button soldout\" disabled></button>");
						}

						Response.Write("</div>\n");
					}
				%>
				<div style="content: ''; display: table; clear: both;"></div>
			</div>
		</div>

		<!-- 오른쪽 -->
		<div class="nanum-square">
			<h1 class="reservation-title">티켓 정보</h1>
			<form runat="server" class="reservation-info" method="post" action="/Reservation.aspx">
				<input type="hidden" id="row" name="row" />
				<input type="hidden" id="col"  name="col" />
				<div class="font-size-20" style="color: #2B2B2B; font-weight: 600; margin-bottom: 20px;">콘서트 정보</div>
				<div class="font-size-28 color-pink" style="margin-bottom: 10px;">CNSA CONCERT 2018</div>
				<div class="font-size-20" style="color: #3A3A3A;">2018/11/30 19:20 ~ 22:10</div>
				<br />
				<br />
				<br />

				<div class="font-size-20" style="color: #2B2B2B; font-weight: 600; margin-bottom: 20px;">예매자 정보</div>
				<div class="font-size-24 color-pink" style="margin-bottom: 20px; margin-right: 35px; float: left;">이름</div>
				<div class="font-size-22" style="color: #444444; float: left;">
					<asp:Label runat="server" ID="Name"></asp:Label></div>
				<div style="content: ''; display: table; clear: both;"></div>
				<div class="font-size-24 color-pink" style="margin-bottom: 20px; margin-right: 35px; float: left;">학번</div>
				<div class="font-size-22" style="color: #444444; float: left;"><%= (string)Session["StudentNumber"] %></div>
				<div style="content: ''; display: table; clear: both;"></div>
				<br />
				<br />
				<br />

				<div class="font-size-20" style="color: #2B2B2B; font-weight: 600; margin-bottom: 20px;">얘매 내역</div>
				<div id="seat" style="display: none;">
					<div class="font-size-30 color-pink" style="margin-bottom: 10px;">
						<asp:Label runat="server" ID="Grade"></asp:Label><span id="reservation"></span>
					</div>
				</div>
				<div class="font-size-20" style="color: #454545;">2018년 11월 30일 19시 20분</div>

				<div class="reservation-submit">
					<div>예매 완료 시 좌석 변경이 불가능합니다</div>
					<div>좌석을 다시 한 번 확인해주세요</div>
					<br />
					<button type="submit" class="reservation-submit-button">예매 완료 하기</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Copyright -->
	<div class="nanum-square about-us-div copyright-page copyright-reservation">Developed by 장지훈, 정원배, 김재훈, 김지은, 김산 Designed by 이호은 Copyright 2018 CNSA CONCERT All Right Reserved</div>

	<script>
		function selectSeat(row, col) {
			document.getElementById("row").value = row;
			document.getElementById("col").value = col;
			// grade display: none;
			document.getElementById("seat").style.display = "block";
			document.getElementById("reservation").innerText = String.fromCharCode(64 + row) + "열-" + (col < 10 ? "0" + col : col);

			// "#reservation".Text row + "-" + col
		}
	</script>
</body>
</html>
