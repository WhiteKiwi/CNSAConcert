<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CNSAConcert.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CNSA CONCERT</title>

	<link rel="stylesheet" type="text/css" href="/assets/css/style.css?ver=0.1">
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css?ver=0.1">

	<style>
		body {
			background-color: white;
		}

			body:after {
				background-image: url("/assets/images/login-background.jpg");
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

		.student-number {
			width: 70%;
			margin-left: 15%;
			margin-top: 20px;
			height: 50px;
			border-color: white;
		}

		.password {
			width: 70%;
			margin-left: 15%;
			height: 50px;
		}

		.login-button {
			width: 70%;
			margin-left: 15%;
			height: 50px;
		}
	</style>
</head>
<body>

	<form runat="server">
		<br />
		<br />
		<br />
		<div style="margin-left: 700px; background-color: rgba( 255, 255, 255, 0.5 ); width: 500px; margin-top: 30px; height: 600px;">
			<br />
			<br />
			<img src="/assets/images/personicon.png" style="width: 100px; height: 100px; margin-left: 200px;" />
			<div>
				<div class="form-group">
					<br />
					<br />
					<asp:TextBox runat="server" ID="StudentNumber" TextMode="SingleLine" CssClass="form-control student-number" placeholder="ID"></asp:TextBox>
				</div>
				<br />
				<div class="form-group">
					<asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="PASSWORD" CssClass="form-control password"></asp:TextBox>
				</div>
				<br />
				<asp:Button runat="server" ID="SignInButton" Text="LOGIN" OnClick="SignInButton_Click" CssClass="btn btn-primary login-button" />
			</div>
		</div>
	</form>
</body>
</html>
