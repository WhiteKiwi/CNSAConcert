using CNSAConcert.Managers;
using System;

namespace CNSAConcert {
	public partial class Login : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {

		}

		protected void SignInButton_Click(object sender, EventArgs e) {
			if (UserManager.LoginCheck(StudentNumber.Text, Password.Text)) {
				// Save student number and grade in session if user success to log in
				Session["StudentNumber"] = StudentNumber.Text;
				Session["Grade"] = StudentNumber.Text.ToCharArray()[1] == '7' ? "2" : "1";

				// Redirect to main page
				Response.Redirect("/");
			} else {
				// 실패 시 alert 띄우기
				Response.Write("<script>alert('ID와 PW를 다시 한번 확인해 주세요.');</script>");
			}
		}
	}
}