using CNSAConcert.Models;
using MySql.Data.MySqlClient;

namespace CNSAConcert.Managers {
	public class UserManager {
		// Table Name
		private const string USERTABLE = "users";

		/// <summary>
		/// Change Password by <c>User</c> class and newPassword string
		/// </summary>
		/// <param name="user">User class in Models</param>  
		/// <param name="newPassword">Password to change</param>  
		/// <see cref="User"/>
		public static int ChangePassword(User user, string newPassword) {
			// If the password change fails, -1 is returned
			int result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Password
				string commandText = "SELECT Password FROM " + USERTABLE + " WHERE Student_Number='" + user.StudentNumber + "';";
				var cmd = new MySqlCommand(commandText, conn);

				// If the passwords match -> Update Password
				if (user.Password == (string)cmd.ExecuteScalar()) {
					// Change user's password
					user.Password = newPassword;

					// Command Text - Update Password
					commandText = "UPDATE " + USERTABLE + " SET Password='" + user.Password + "' Where Student_Number='" + user.StudentNumber+ "';";
					cmd.CommandText = commandText;

					// The number of rows affected
					result = cmd.ExecuteNonQuery();
				}
				// Connection Close
				conn.Close();
			}

			return result;
		}
	}
}