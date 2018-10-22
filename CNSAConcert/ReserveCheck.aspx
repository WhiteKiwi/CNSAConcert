<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReserveCheck.aspx.cs" Inherits="CNSAConcert.ReserveCheck" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CNSA CONCERT</title>

	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css?ver=0.1">

	<style>
		.cancel-button {
			font-size: 30px;
			color: white;
			background-color: #7AC8DC;
			border-color: #7AC8DC;
		}

		.seat-label {
			font-size: 40px;
			margin-left: 658px;
		}

		.image-style{
			margin-left: 1500px; height: 80px; width: 80px;
		}
	</style>
</head>
<body>
	<form runat="server">
		<div style="margin: 20px 0px 20px 150px;">
			<div>
				<asp:ImageButton ID="homeButton" runat="server" ImageUrl="/assets/images/black_home.png" CssClass="image-style" OnClick="homeButton_Click" />
			</div>

			<div style="margin-top: 100px;">
				<h1 style="font-size: 40px; background-color: #7AC8DC; width: 350px; padding-left: 10px; color: white"><strong>예매 확인 및 취소</strong></h1>
			</div>
			<br />
			<div>
				<hr style="width: 1600px; border: 1px solid slategray; background-color: slategray; float: left; margin-bottom: 20px;" />
				<br />
				<div style="margin-top: 30px;">
					<span style="font-size: 40px;">공연날짜</span><span style="font-size: 40px; margin-left: 500px;">예매정보</span><span style="font-size: 40px; margin-left: 500px">상태</span>
				</div>

				<hr style="width: 1600px; border: 1px solid slategray; background-color: slategray; float: left" />
				<div style="margin-top: 150px;">
					<span style="font-size: 40px;">2018.11.30</span><span style="font-size: 40px; margin-left: 470px;">CN구역</span><span style="font-size: 40px; margin-left: 500px;">예매완료</span>
				</div>

				<div style="margin-top: 30px;">
					<asp:Label runat="server" ID="Reservation" CssClass="seat-label"></asp:Label>
					<span style="font-size: 40px; margin-left: 497px;">
						<asp:Button runat="server" ID="CancelButton" OnClick="CancelButton_Click" Text="예매 취소" CssClass="btn btn-primary cancel-button" />
					</span>
				</div>
				<hr style="width: 1600px; border: 1px solid slategray; background-color: slategray; float: left; margin-top: 100px;" />
			</div>
		</div>
	</form>
</body>
</html>
