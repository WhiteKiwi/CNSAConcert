namespace CNSAConcert.Models {
	/// <summary>
	/// seats table Model
	/// </summary>
	public class Seat {
		// 행 (가로)
		public string Row { get; set; }

		// 열 (세로줄)
		public string Col { get; set; }

		// Student Number
		public string StudentNumber { get; set; }
	}
}