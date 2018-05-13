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
		public static int Reserve(Seat seat, int grade) {
			// If the reservation fails, -1 is returned
			int result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Update Student Number
				string commandText = string.Format("UPDATE {0} SET Student_Number='{1}' WHERE Row='{2}', Column='{3}';", SEATTABLE + grade, seat.StudentNumber, seat.Row, seat.Column);
				var cmd = new MySqlCommand(commandText, conn);

				// The number of rows affected
				result = cmd.ExecuteNonQuery();

				// Connection Close
				conn.Close();
			}

			return result;
		}

		/// <summary>
		/// DB에서 예매 정보를 삭제하는 메서드 - 학번만 삭제
		/// </summary>
		/// <param name="studentNumber">Seat class in Models</param>  
		/// <see cref="Seat.StudentNumber"/>
		public static int CancelReservation(int studentNumber, int grade) {
			// If cancel fails, -1 is returned
			int result = -1;
			
			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Delete Student Number
				string commandText = string.Format("UPDATE {0} SET Student_Number='-1' WHERE Student_Number='{1}';", SEATTABLE + grade, studentNumber);
				var cmd = new MySqlCommand(commandText, conn);

				// The number of rows affected
				result = cmd.ExecuteNonQuery();

				// Connection Close
				conn.Close();
			}

			return result;
		}

		/// <summary>
		/// DB에 좌석을 추가하는 메서드
		/// </summary>
		/// <param name="row">Member variables in <c>Seat</c> class</param>  
		/// <param name="column">Member variables in <c>Seat</c> class</param>  
		/// <see cref="Seat.Row"/>
		/// <see cref="Seat.Column"/>
		public static int AddSeat(int row, int column, int grade) {
			// Return -1 if seat addition fails
			int result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Password
				string commandText = string.Format("INSERT INTO {0}(Row, Column) VALUES ('{1}', '{2}');", SEATTABLE + grade, row, column);
				var cmd = new MySqlCommand(commandText, conn);

				// The number of rows affected
				result = cmd.ExecuteNonQuery();

				// Connection Close
				conn.Close();
			}

			return result;
		}

		/// <summary>
		/// DB에서 학번으로 좌석을 검색하는 메서드
		/// </summary>
		/// <param name="studentNumber">Member variables in <c>Seat</c> class</param>
		/// <see cref="Seat.StudentNumber"/>
		public static Seat SearchSeat(int studentNumber, int grade) {
			// Return -1 if search fails
			var result = new Seat {
				Row = -1,
				Column = -1,
				StudentNumber = studentNumber
			};

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Seat
				string commandText = string.Format("SELECT * FROM {0} WHERE Student_Number='{1}';", SEATTABLE + grade, studentNumber);
				var cmd = new MySqlCommand(commandText, conn);

				// The number of rows affected
				var rdr = cmd.ExecuteReader();
				rdr.Read();
				result.Row = (int)rdr["Row"];
				result.Column = (int)rdr["Column"];

				// Connection Close
				conn.Close();
			}

			return result;
		}
	}
}