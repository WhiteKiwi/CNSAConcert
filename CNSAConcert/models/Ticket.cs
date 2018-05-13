namespace CNSAConcert.Models {
	/// <summary>
	/// tickets table Model
	/// </summary>
	public class Ticket {
		// 행 (가로)
		public int Row { get; set; }

		// 열 (세로줄)
		public int Column { get; set; }

		// Student Number
		private int StudentNumber { get; set; };
	}
}