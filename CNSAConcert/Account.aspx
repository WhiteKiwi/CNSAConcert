<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="CNSAConcert.Account" %>

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
	<div id="nav" class="navbar">
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

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<!-- 변경 칸 -->
	<div class="account-div">
		<form runat="server" class="chaparralPro-light-italic input-div">
			<h1 class="nanum-square">비밀번호 변경</h1>
			<h2 class="nanum-square">계정 도용 방지를 위해 반드시 비밀번호를 변경해주세요.<br />
				초기 비밀번호는 학번입니다.<br />
				비밀번호 미변경으로 인한 계정 도용 사례의 책임은 본인에게 있습니다.<br />
				절대 다른 사람에게 계정을 알려주지 마십시오.</h2>
			<br />
			<br />
			<div class="title-text">Current Password*</div>
			<asp:TextBox runat="server" ID="OldPassword" TextMode="Password" CssClass="form-control underline-input"></asp:TextBox><br />
			<br />
			<br />
			<br />
			<div class="title-text">New Passsword*</div>
			<asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control underline-input"></asp:TextBox><br />
			<br />
			<br />
			<br />
			<div class="title-text">Confirm Password*</div>
			<asp:TextBox runat="server" ID="NewPassword2" TextMode="Password" CssClass="form-control underline-input"></asp:TextBox><br />
			<br />
			<br />
			<br />
			<div style="width: 100%; text-align: center;">
				<asp:Button runat="server" ID="ApplyButton" Text="확인" CssClass="account-button nanum-square" OnClick="ApplyButton_Click"/>
			</div>
		</form>
	</div>

	<!-- Copyright -->
	<div class="nanum-square about-us-div copyright-page">Developed by 장지훈, 정원배, 김재훈, 김지은, 김산 Designed by 이호은, 정지우 Copyright 2018 CNSA CONCERT All Right Reserved</div>
</body>
</html>
