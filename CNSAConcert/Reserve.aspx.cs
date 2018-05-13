﻿using CNSAConcert.Managers;
using CNSAConcert.Models;
using System;

namespace CNSAConcert {
	public partial class Reserve : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			// Redirect to the Login page if the session does not exist
			if (String.IsNullOrEmpty((string)Session["StudentNumber"]) || String.IsNullOrEmpty((string)Session["Grade"]))
				Response.Redirect("/Login.aspx");
		}

		protected void ReserveButton_Click(object sender, EventArgs e) {
			SeatManager.Reserve(new Seat {
				Row = Row.Text,
                Col = Column.Text,
				StudentNumber = (string)Session["StudentNumber"]
			}, (string)Session["Grade"]);
		}
	}
}