using CNSAConcert.Managers;
using CNSAConcert.Models;
using System;

namespace CNSAConcert {
	public partial class Reservation : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			if (!string.IsNullOrEmpty(Request.Form["row"]) && !string.IsNullOrEmpty(Request.Form["col"])) {
				int result = SeatManager.Reserve(new Seat {
					Row = Request["row"],
					Col = Request["col"],
					StudentNumber = (string)Session["StudentNumber"]
				}, (string)Session["Grade"]);
				if (result == -2) {
					Response.Write("<script>alert('이미 선택된 좌석입니다'); location.href='/Reserve.aspx';</script>");
				} else if (result == -1) {
					Response.Write("<script>alert('예매에 실패하였습니다'); location.href='/Reserve.aspx';</script>");
				} else if (result == -3) {
					Response.Write("<script>alert('이미 예매하셨습니다'); location.href='/';</script>");
				} else {
					Response.Write("<script>alert('예매에 성공하셨습니다'); location.href='/ReserveCheck.aspx';</script>");
				}
			}
		}
	}
}