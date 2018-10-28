using CNSAConcert.Managers;
using CNSAConcert.Models;
using System;

namespace CNSAConcert {
	public partial class Reserve : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			// Redirect to the Login page if the session does not exist
			if (string.IsNullOrEmpty((string)Session["StudentNumber"]) || string.IsNullOrEmpty((string)Session["Grade"]))
				Response.Redirect("/Login.aspx");

			Grade.Text = (string)Session["Grade"] == "1" ? "CN-" : "SA-";
			AREA.Text = (string)Session["Grade"] == "1" ? "CN" : "SA";


			Name.Text = UserManager.GetStudentName((string)Session["StudentNumber"]);
		}
	}
}