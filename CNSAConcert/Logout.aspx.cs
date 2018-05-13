using System;

namespace CNSAConcert {
	public partial class Logout : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			Session["StudentNumber"] = "";
			Session["Grade"] = "";

			Response.Redirect("/Login.aspx");
		}
	}
}