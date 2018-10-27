<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="CNSAConcert.AboutUs" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CNSA CONCERT</title>

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css">

	<link rel="stylesheet" href="/assets/css/font.css">
</head>
<body class="background">
	<!-- NAVBAR -->
	<div id="nav" class="navbar">
		<div style="margin-top: 10px; margin-left: 20px;">
			<a href="/Default.aspx"><img src="/assets/img/CNSALOGO.png" width="50" /></a>
		</div>
		<div><a href="/Account.aspx" class="nanum-square">비밀번호 변경</a></div>
		<div><a href="/Reserve.aspx" class="nanum-square">예매</a></div>
		<div><a href="/ReserveCheck.aspx" class="nanum-square">예매 확인</a></div>
		<div><a href="/AboutUs.aspx" class="nanum-square">About us</a></div>
		<div style="float: right;"><a href="/Logout.aspx" class="nanum-square">로그아웃</a></div>
	</div>
	<div style="content: ''; display: table; clear: both;"></div>

	<!-- LOGO -->
	<div class="cncon-logo about-logo">
		<div class="chaparralPro-light-italic">2018</div>
		<div class="palatino-linotype">CNSA CONCERT</div>
		<div class="chaparralPro-light-italic">ticketing page</div>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<!-- 이름 -->
	<div class="about-us-div" style="font-size: 24px;">
		<div><span class="chaparralPro">Director </span><span class="nanum-square">장지훈</span></div>
		<div><span class="chaparralPro">Front-End Developer </span><span class="nanum-square">김재훈</span></div>
		<div><span class="chaparralPro">Front-End Developer </span><span class="nanum-square">김지은</span></div>
		<div><span class="chaparralPro">Back-End Developer </span><span class="nanum-square">정원배</span></div>
		<div><span class="chaparralPro">Lead Designer </span><span class="nanum-square">이호은</span></div>
	</div>

	<br />
	<br />
	<br />
	<br />

	<!-- Copyright -->
	<div class="chaparralPro-light-italic about-us-div" style="font-size: 18px;">CNSA CONCERT TICKETING PAGE 2018 ⓒ All Right Reserved</div>
</body>
</html>
