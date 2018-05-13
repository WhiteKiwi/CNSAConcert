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
			
		/// <summary>
		/// Check the <c>User</c>'s Id and pw
		/// </summary>
		/// <param name="studentNumber">User's Student Number</param>  
		/// <param name="password">User's Password</param>  
		/// <see cref="User.StudentNumber"/>
		/// <see cref="User.Password"/>
		public static bool LoginCheck(string studentNumber, string inputPassword) {
			// Returns false if the ID and password do not match
			bool result = false;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Password
				string commandText = string.Format("SELECT Password FROM {0} WHERE Student_Number='{1}';", USERTABLE, studentNumber);
				var cmd = new MySqlCommand(commandText, conn);

				// Check User's Password
				if ((int)cmd.ExecuteScalar() == (inputPassword + "sGSf4YnR6I6I8Kj,GaCVwGSDfhRQ24i56lU6I3qI445EyoFN35J4Q38oy7").GetHashCode())
					result = true;
				
				// Connection Close
				conn.Close();
			}

			return result;
		}

	}
}