using System;

namespace CNSAConcert {
	public partial class Default : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			// Redirect to the Login page if the session does not exist
			if (String.IsNullOrEmpty((string)Session["StudentNumber"]) || String.IsNullOrEmpty((string)Session["Grade"]))
				Response.Redirect("/Login.aspx");
		}
	}
}