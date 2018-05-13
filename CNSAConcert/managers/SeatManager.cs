using CNSAConcert.Models;
using MySql.Data.MySqlClient;

namespace CNSAConcert.Managers {
	public class SeatManager {
		// Table Name
		private const string SEATTABLE = "seats";

		/// <summary>
		/// DB에 예매 정보를 등록하는 메서드 - 학번만 업데이트
		/// </summary>
		/// <param name="seat">Seat class in Models</param>  
		/// <see cref="Seat"/>
		public static int Reserve(Seat seat) {
			// If the reservation fails, -1 is returned
			int result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Update Student Number
				string commandText = string.Format("UPDATE {0} SET Student_Number='{1}' WHERE Row='{2}', Column='{3}';", SEATTABLE, seat.StudentNumber, seat.Row, seat.Column);
				var cmd = new MySqlCommand(commandText, conn);

				// The number of rows affected
				result = cmd.ExecuteNonQuery();

				// Connection Close
				conn.Close();
			}

			return result;
		}

	}
}