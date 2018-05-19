using CNSAConcert.Managers;
using CNSAConcert.Models;
using System;

namespace CNSAConcert {
	public partial class Reserve : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			// Redirect to the Login page if the session does not exist
			if (String.IsNullOrEmpty((string)Session["StudentNumber"]) || String.IsNullOrEmpty((string)Session["Grade"]))
				Response.Redirect("/Login.aspx");

			if (!String.IsNullOrEmpty(Request.Form["row"]) && !String.IsNullOrEmpty(Request.Form["col"])) {
				int result = SeatManager.Reserve(new Seat {
					Row = Request["row"],
					Col = Request["col"],
					StudentNumber = (string)Session["StudentNumber"]
				}, (string)Session["Grade"]);
				if (result == -2) {
					Response.Write("<script>alert('이미 선택된 좌석입니다'); window.location.replace('/Reserve.aspx');</script>");
				} else if (result == -1) {
					Response.Write("<script>alert('예매에 실패하였습니다'); window.location.replace('/Reserve.aspx');</script>");
				} else if (result == -3) {
					Response.Write("<script>alert('이미 예매하셨습니다'); window.location.replace('/Reserve.aspx');</script>");
				} else {
					Response.Redirect("/");
				}
			}
		}
	}
}