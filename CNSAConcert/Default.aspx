<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CNSAConcert.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CNSA CONCERT</title>

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css?ver=0.1">
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css?ver=0.1">


    <style>
        body {
            background-color: black;
        }

            body:after {
                background-image: url("/assets/images/main_background.jpg");                
                top: 0;
                left: 0;
                position: absolute;
                background-size: 100%;
                opacity: 0.5 !important;
                filter: alpha(opacity=50);
                z-index: -1;
                content: "";
                width: 100%;
                height: 100%;
            }
            
                a:link  { text-decoration: none; color: white}
                a:visited {  text-decoration: none; color: white}
                a:active {  text-decoration: none; color: white}     
                a:hover { text-decoration: underline; color:white} 
       </style>
</head>
<body>
	<div style="margin: 30px 30px;">
		<div>
			<p><span style="color: white; font-size: 40px"><strong>CNSA CONCERT</strong></span><span style="float: right; color: white; margin-left: 30px; font-size: 30px"><a href="/Account.aspx">비밀번호 변경</a></span><span style="float: right; color: white; font-size: 30px;"><a href="/Logout.aspx">로그아웃</a></span></p>
		</div>

		<div style="padding-top: 200px;">
			<img src="cncon_homeImage.png" style="margin-left: 25%;" />
			<hr style="width: 50px; border: 1px solid #5EA9BC; background-color: #5EA9BC" />
		</div>

		<div style="padding-top: 40px;">
			<p style="text-align: center; font-size: 20px; color: white"><strong>이것은 큰사 콘서트 홍보문구 입니다</strong></p>
			<p style="text-align: center; font-size: 20px; color: white"><strong>아직 정해지지 않아서 임의로 넣었습니다</strong></p>
		</div>

		<div style="padding-top: 50px;">
			<span style="margin-left: 15%;">
				<button type="button" class="btn btn-outline-primary" style="color: white; background-color: #5EA9BC; border-color: #5EA9BC; width: 300px; height: 80px; font-size: 30px;" onclick="reserve()"><strong>예매하기</strong></button>
			</span>
			<span style="margin-right: 15%; float: right">
				<button type="button" class="btn btn-outline-primary" style="color: white; background-color: #5EA9BC; border-color: #5EA9BC; width: 300px; height: 80px; font-size: 30px;" onclick="reserveCheck()"><strong>예약 확인 및 취소</strong></button>
			</span>
		</div>
	</div>

	<script>
		function reserve() {
			window.location.href = "/Reserve.aspx";
		}

		function reserveCheck() {
			window.location.href = "/ReserveCheck.aspx";
		}
	</script>
</body>
</html>
