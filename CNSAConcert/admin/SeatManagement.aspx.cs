using MySql.Data.MySqlClient;
using System;

namespace CNSAConcert.admin {
	public partial class SeatManagement : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
			if (Session["ISLOGIN"] == null) {
				Response.Redirect("/admin/Login.aspx");
			}
		}

		protected void AddButton_Click(object sender, EventArgs e) {
			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Delete Student Number
				var cmd = new MySqlCommand("", conn);

				int row = int.Parse(Row.Text);
				int col = int.Parse(Col.Text);
				for (int i = 1; i <= row; i++) {
					for (int j = 1; j <= col; j++) {
						cmd.CommandText = $"INSERT INTO seats{Grade.Text}(Row, Col) VALUES ('{i}', '{j}');";

						// The number of rows affected
						cmd.ExecuteNonQuery();
					}
				}

				// Connection Close
				conn.Close();
			}
		}
	}
}