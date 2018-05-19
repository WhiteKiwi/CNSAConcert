using CNSAConcert.Managers;
using CNSAConcert.Models;
using System;

namespace CNSAConcert {
	public partial class Account : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			// Redirect to the Login page if the session does not exist
			if (String.IsNullOrEmpty((string)Session["StudentNumber"]) || String.IsNullOrEmpty((string)Session["Grade"]))
				Response.Redirect("/Login.aspx");
		}

		protected void ApplyButton_Click(object sender, EventArgs e) {
			// Change password if text in 'newPassword' textbox is same with text in 'newPassword2' textbox
			if (NewPassword.Text == NewPassword2.Text) {
                // Fail to change password if return value of method 'ChangePassword' is -1
				if (UserManager.ChangePassword(new User {
					StudentNumber = (string)Session["StudentNumber"],
					Password = OldPassword.Text
				}, NewPassword.Text) == -1) {
					Response.Write("<script>alert('Please confirm the original password'); window.location.replace('/Account.aspx');</script>");
				} else {
					Response.Write("<script>alert('Success to change password'); window.location.replace('/Account.aspx');</script>");
				}
			} else {
				// Notify If passwords do not match
				Response.Write("<script>alert('Passwords do not match'); window.location.replace('/Account.aspx');</script>");
			}
		}
	}
}