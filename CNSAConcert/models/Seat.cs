namespace CNSAConcert.Models {
	/// <summary>
	/// seats table Model
	/// </summary>
	public class Seat {
		// 행 (가로)
		public int Row { get; set; }

		// 열 (세로줄)
		public int Column { get; set; }

		// Student Number
		public int StudentNumber { get; set; }
	}
}