<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveCheck.aspx.cs" Inherits="CNSAConcert.ReserveCheck" %>

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


	<!-- 예매확인 -->
	<div class="reservation-check nanum-square" style="text-align: center;">
		<div style="text-align: left; margin-left: 440px;">
			<h1 class="color-pink" style="font-size: 34px; font-weight: 500;">예매 내역 확인</h1>
			<form runat="server">
				<!-- 카드 1 -->
				<div class="reservation-check-div">
					<!-- 예매 정보 -->
					<div>
						<div class="font-size-20">예매 정보</div>
						<div class="color-pink font-size-28">CNSA CONCERT 2018</div>
						<div class="font-size-20">2018/11/30 19:20 ~ 22:10</div>
					</div>

					<!-- 예매자 정보 -->
					<div>
						<div class="font-size-20">예매자 정보</div>
						<div style="margin-top: 19px;">
							<span class="color-pink font-size-24" style="margin-right: 20px;">이름</span>
							<span class="font-size-22"><%= CNSAConcert.Managers.UserManager.GetStudentName((string)Session["StudentNumber"]) %></span>
						</div>
						<div>
							<span class="color-pink font-size-24" style="margin-right: 20px;">학번</span>
							<span class="font-size-22"><%= (string)Session["StudentNumber"] %></span>
						</div>
					</div>

					<!-- 예매 내역 -->
					<div>
						<div class="font-size-20">예매 내역</div>
						<asp:Label runat="server" ID="Reservation" CssClass="color-pink font-size-30"></asp:Label>

					</div>
				</div>
				<div style="content: ''; display: table; clear: both;"></div>
				<br />

				<!-- 카드2 -->
				<div class="reservation-check-div2 chaparralPro">
					<!-- 왼쪽 -->
					<div style="float: left; margin-left: 5px;">
						<div>
							<div class="num-check"></div>
							<%
								bool isFirst = (string)Session["Grade"] == "1";
								var seat = CNSAConcert.Managers.SeatManager.LoadReservation((string)Session["StudentNumber"], (string)Session["Grade"]);
								for (int a = 1; a <= 18; a++) {
							%>
							<div class="num-check<%= (seat.Col == a.ToString() && isFirst) ? " color-pink" : "" %>"><%= a %></div>
							<%} %>
						</div>
						<div style="content: ''; display: table; clear: both;"></div>

						<div>
							<%
								for (int i = 3; i <= 21; i++) {
									if (seat.Row == i.ToString())
										Response.Write("<div><div class=\"num-check color-pink\">" + (char)(64 + i) + "</div>");
									else
										Response.Write("<div><div class=\"num-check\">" + (char)(64 + i) + "</div>");

									for (int j = 1; j <= 18; j++) {
										if (seat.Col == j.ToString() && seat.Row == i.ToString() && isFirst)
											Response.Write("<button class=\"seat-button-check your-seat\" disabled></button>");
										else
											Response.Write("<button class=\"seat-button-check\" disabled></button>");
									}

									Response.Write("</div><div style=\"content: ''; display: table; clear: both;\"></div>\n");
								}
							%>
							<div style="content: ''; display: table; clear: both;"></div>
						</div>
					</div>

					<!-- 오른쪽 -->
					<div style="float: left; margin-left: 44px;">
						<div>
							<%
								for (int a = 1; a <= 18; a++) {
							%>
							<div class="num-check<%= (seat.Col == a.ToString() && !isFirst) ? " color-pink" : "" %>"><%= a %></div>
							<%} %>
						</div>
						<div style="content: ''; display: table; clear: both;"></div>

						<div>
							<%
								for (int i = 3; i <= 19; i++) {
									Response.Write("<div>");

									for (int j = 1; j <= 18; j++) {
										if (seat.Col == j.ToString() && seat.Row == i.ToString() && !isFirst)
											Response.Write("<button class=\"seat-button-check your-seat\" disabled></button>");
										else
											Response.Write("<button class=\"seat-button-check\" disabled></button>");
									}

									Response.Write("</div><div style=\"content: ''; display: table; clear: both;\"></div>\n");
								}
							%>
							<div style="content: ''; display: table; clear: both;"></div>
						</div>
					</div>
					<div style="content: ''; display: table; clear: both;"></div>

					<div>
						<asp:Button runat="server" ID="CancelReservationButton" OnClick="CancelReservationButton_Click" CssClass="cancel-reservation-button" Text="예매 취소하기" />
						<asp:Button runat="server" ID="OkButton" CssClass="ok-reservation-button" OnClick="OkButton_Click" Text="확인" />
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Copyright -->
	<div class="nanum-square about-us-div copyright-page copyright-reservation">Developed by 장지훈, 정원배, 김재훈 Designed by 이호은 Copyright 2018 CNSA CONCERT All Right Reserved</div>
</body>
</html>
