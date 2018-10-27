namespace CNSAConcert.Models {
	/// <summary>
	/// users table Model
	/// </summary>
	public class User {
		// User's ID
		public string  StudentNumber { get; set; }

		// User's Password
		public string Password { get; set; }

		// User's Name
		public string Name { get; set; }

		// User's Grade
		public string Grade { get; set; }
	}
}