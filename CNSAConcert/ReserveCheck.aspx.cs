﻿using CNSAConcert.Managers;
using CNSAConcert.Models;
using System;

namespace CNSAConcert {
	public partial class ReserveCheck : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			// Redirect to the Login page if the session does not exist
			if (String.IsNullOrEmpty((string)Session["StudentNumber"]) || String.IsNullOrEmpty((string)Session["Grade"]))
				Response.Redirect("/Login.aspx");

			Seat seat = SeatManager.LoadReservation((string)Session["StudentNumber"], (string)Session["Grade"]);
			if (seat.Row == "-1" || seat.Col == "-1") {
				if ((string)Session["Grade"] == "1")
					Reservation.Text = "CN - X - X";
				else if ((string)Session["Grade"] == "2")
					Reservation.Text = "SA - X - X";
			} else {
				if ((string)Session["Grade"] == "1")
					Reservation.Text = "CN - " + NumberToABC(int.Parse(seat.Row)) + " - " + seat.Col;
				else if ((string)Session["Grade"] == "2")
					Reservation.Text = "SA - " + NumberToABC(int.Parse(seat.Row)) + " - " + seat.Col;
			}
		}

		protected void CancelButton_Click(object sender, EventArgs e) {
			SeatManager.CancelReservation((string)Session["StudentNumber"], (string)Session["Grade"]);
			Response.Redirect("/ReserveCheck.aspx");
		}

		//
		private string NumberToABC(int n) {
			char result = (char)(64 + n);
			return result.ToString();
		}
	}
}