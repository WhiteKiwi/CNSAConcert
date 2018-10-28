<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CNSAConcert.Default" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CNSA CONCERT</title>
	<link rel="shortcut icon" href="/assets/img/favicon.png" />

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css">

	<link rel="stylesheet" href="/assets/css/font.css">
	<script src="/assets/js/jquery-1.11.1.min.js"></script>
</head>
<body>
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

	<!-- 메인 탑 -->
	<div class="main-top">
		<div class="kcc-eunyoung">
			가족과 함께하는 행복한 2018 큰사 콘서트<br />
			여러분을 초대합니다.
		</div>
		<br />
		<br />
		<br />
		<button class="go-reservation nanum-square" onclick="location.href='/Reserve.aspx'">좌석 예매하기</button>
	</div>

	<!-- 소개 -->
	<div id="About-Concert" class="main-first">
		<!-- 왼쪽 -->
		<div>
			<div>
				<h1 class="kcc-eunyoung">열정의 집합, 그 표출의 순간</h1>
				<span>충남삼성고등학교 학생들은 1인1기를 통해<br />
					자신만의 특기로 음악적 소양을 기르며<br />
					미래의 융합적 인재로 커 나갈 준비를 해나가고 있습니다.</span>
				<br />
				<br />
				<br />
				<br />
				<br />
				<img src="/assets/img/cncon5.jpeg" width="650" />

				<div style="width: 270px; height: 350px; background-color: #EBEBEB; margin-left: -160px; margin-top: -464px;"></div>
			</div>
		</div>

		<!-- 오른쪽 -->
		<div>
			<div>
				<img src="/assets/img/cncon4.jpeg" width="650" />

				<h1 class="kcc-eunyoung">예술적 소양을 기르다</h1>
				<span>충남삼성고등학교 학생들은 1인1기를 통해<br />
					자신만의 특기로 음악적 소양을 기르며<br />
					미래의 융합적 인재로 커 나갈 준비를 해나가고 있습니다.</span>
			</div>
		</div>
	</div>
	<div style="content: ''; display: table; clear: both;"></div>
	<br />
	<br />
	<br />

	<!-- 중간에 좌측에 붙어있는 사각형 -->
	<div>
		<div style="height: 160px; width: 100px; background-color: #464646"></div>
	</div>

	<!-- 세 번째 소개 -->
	<div class="main-third">
		<img src="/assets/img/cncon6.jpeg" width="1200" />
		<div>
			<h1 class="kcc-eunyoung">모두가 하나 되는 순간</h1>
			<span>충남삼성고등학교 학생들은 1인1기를 통해<br />
				자신만의 특기로 음악적 소양을 기르며<br />
				미래의 융합적 인재로 커 나갈 준비를 해나가고 있습니다.</span>
		</div>
	</div>
	<div style="content: ''; display: table; clear: both;"></div>

	<!-- 중간에 우측에 붙어있는 사각형 -->
	<div>
		<div style="float: right; height: 300px; width: 550px; background-color: #464646; margin-top: -56px;"></div>
	</div>

	<br />
	<br />
	<br />
	<br />

	<!-- 네 번째 소개 -->
	<div class="main-fourth">
		<div>
			<h1 class="kcc-eunyoung">잊지 못할 또 하나의 추억</h1>
		</div>
	</div>
	<div style="content: ''; display: table; clear: both;"></div>

	<div style="background-image: url('/assets/img/cncon7.jpeg'); background-size: cover; height: 500px; margin-top: -40px;">
		<br />
		<br />
		<span class="expression">충남삼성고등학교 학생들은 1인1기를 통해</span><br />
		<span class="expression">자신만의 특기로 음악적 소양을 기르며</span><br />
		<span class="expression">미래의 융합적 인재로 커 나갈 준비를 해나가고 있습니다.</span><br />
	</div>

	<!-- Copyright -->
	<div class="copyright">Developed by 장지훈, 정원배, 김재훈, 김지은, 김산 Designed by 이호은 Copyright 2018 CNSA CONCERT All Right Reserved</div>


	<!-- Navbar - 스크롤하면 색바뀌게!! -->
	<script>
		var element_position = $('#About-Concert').offset().top;
		var screen_height = $(window).height();
		var activation_offset = 0.05;//determines how far up the the page the element needs to be before triggering the function
		var activation_point = element_position - (screen_height * activation_offset);
		var max_scroll_height = $('body').height() - screen_height - 5;//-5 for a little bit of buffer

		//Does something when user scrolls to it OR
		//Does it when user has reached the bottom of the page and hasn't triggered the function yet
		$(window).on('scroll', function () {
			var y_scroll_pos = window.pageYOffset;

			var element_in_view = y_scroll_pos > activation_point;
			var has_reached_bottom_of_page = max_scroll_height <= y_scroll_pos && !element_in_view;

			if (element_in_view || has_reached_bottom_of_page) {
				$('#nav').addClass("scrolled");
			} else {
				$('#nav').removeClass("scrolled");
			}
		});
	</script>

</body>
</html>
