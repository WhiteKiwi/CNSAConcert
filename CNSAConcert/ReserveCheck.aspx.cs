using CNSAConcert.Managers;
using CNSAConcert.Models;
using System;

namespace CNSAConcert {
	public partial class ReserveCheck : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			// Redirect to the Login page if the session does not exist
			if (string.IsNullOrEmpty((string)Session["StudentNumber"]) || string.IsNullOrEmpty((string)Session["Grade"]))
				Response.Redirect("/Login.aspx");

			Seat seat = SeatManager.LoadReservation((string)Session["StudentNumber"], (string)Session["Grade"]);
			if (seat.Row == "-1" || seat.Col == "-1") {
				Reservation.Text = "?열 ?번";
				Response.Write("<script>alert('예매 내역이 존재하지 않습니다.'); location.href='/';</script>");
			} else {
				if ((string)Session["Grade"] == "1")
					Reservation.Text = "CN - " + NumberToABC(int.Parse(seat.Row)) + "열 - " + seat.Col;
				else
					Reservation.Text = "SA - " + NumberToABC(int.Parse(seat.Row)) + "열 - " + seat.Col;
			}
		}

		private string NumberToABC(int n) {
			char result = (char)(64 + n);
			return result.ToString();
		}

		protected void CancelReservationButton_Click(object sender, EventArgs e) {
			SeatManager.CancelReservation((string)Session["StudentNumber"], (string)Session["Grade"]);
			Response.Redirect("/");
		}

		protected void OkButton_Click(object sender, EventArgs e) {
			Response.Redirect("/");
		}
	}
}