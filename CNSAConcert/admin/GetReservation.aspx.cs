using System;

namespace CNSAConcert.admin {
	public partial class GetReservation : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			if (Session["ISLOGIN"] == null) {
				Response.Redirect("/admin/Login.aspx");
			}
		}
	}
}