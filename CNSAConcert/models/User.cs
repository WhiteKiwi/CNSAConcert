﻿namespace CNSAConcert.Models {
	/// <summary>
	/// users table Model
	/// </summary>
	public class User {
		// User's ID
		public string  StudentNumber { get; set; }

		// User's Password
		private string password;
		public string Password {
			get {
				// password Returns a hash value on request
				return (password + "sGSf4YnR6I6I8Kj,GaCVwGSDfhRQ24i56lU6I3qI445EyoFN35J4Q38oy7").GetHashCode().ToString();
			}
			set {
				password = value;
			}
		}

		// User's Name
		public string Name { get; set; }

		// User's Grade
		public string Grade { get; set; }
	}
}