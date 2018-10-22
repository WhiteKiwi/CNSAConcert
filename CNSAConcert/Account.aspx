<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="CNSAConcert.Account" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>CNSA CONCERT</title>

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css?ver=0.1">
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css?ver=0.1">

	<style>
		body {
			background-color: lightskyblue;
		}

			body:after {
				background-image: url("/assets/images/getinback.png");
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

		.input-form {
			width: 50%;
			margin-left: 25%;
			height: 50px;
		}

		.image-style {
			width: 80px; height: 80px; margin-left: 1500px;
		}

		.btn {
			background-color: #163F5E;
		}
	</style>
</head>
<body>
	<form runat="server">
		<div style="margin: 30px 30px;">
			<asp:ImageButton ID="HomeButton" runat="server" ImageUrl="/assets/images/home.png" CssClass="image-style" OnClick="HomeButton_Click"/>
			<div>
				<img src="/assets/images/lock.png" style="width: 250px; height: 250px; margin-left: 800px;" />
				<h1 style="margin-left: 800px; margin-top: 30px; color: white">비밀번호 변경</h1>
			</div>

			<div style="margin-left: 400px; background-color: white; width: 1000px; padding-top: 30px; height: 400px;">
				<div class="form-group">
					<asp:TextBox runat="server" ID="OldPassword" TextMode="Password" placeholder="현재 비밀번호" CssClass="form-control input-form" Font-Bold="true"></asp:TextBox><br />
				</div>

				<div class="form-group">
					<asp:TextBox runat="server" ID="NewPassword" TextMode="Password" placeholder="새 비밀번호" CssClass="form-control input-form" Font-Bold="true"></asp:TextBox><br />
				</div>

				<div class="form-group">
					<asp:TextBox runat="server" ID="NewPassword2" TextMode="Password" placeholder="새 비밀번호 확인" CssClass="form-control input-form" Font-Bold="true"></asp:TextBox><br />
				</div>

				<asp:Button runat="server" ID="ApplyButton" Text="확인" CssClass="input-form btn btn-primary" OnClick="ApplyButton_Click" Font-Size="X-Large" Font-Bold="true"/>
			</div>
		</div>
	</form>
</body>
</html>
