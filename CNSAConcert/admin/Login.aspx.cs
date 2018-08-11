using System;

namespace CNSAConcert.admin {
	public partial class Login : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {

		}

		protected void LoginButton_Click(object sender, EventArgs e) {
			if (UserID.Text == "CNSAConcert" && Password.Text == "cncon2018") {
				Session["ISLOGIN"] = "TRUE";
				Response.Redirect("/admin/SeatManagement.aspx");
			}
		}
	}
}