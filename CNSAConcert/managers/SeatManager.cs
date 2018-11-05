using CNSAConcert.Models;
using MySql.Data.MySqlClient;
using System;

namespace CNSAConcert.Managers {
	public class SeatManager {
		// Table Name
		private const string SEATTABLE = "seats";

		/// <summary>
		/// DB에 예매 정보를 등록하는 메서드 - 학번만 업데이트
		/// </summary>
		/// <param name="seat">Seat class in Models</param>  
		/// <see cref="Seat"/>
		public static int Reserve(Seat seat, string grade) {
			// If the reservation fails, -1 is returned
			int result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Check Is left Seat
				string commandText = string.Format("SELECT Student_Number FROM {0} WHERE Row='{1}' AND Col='{2}';", SEATTABLE + grade, seat.Row, seat.Col);
				var cmd = new MySqlCommand(commandText, conn);

				var rdr = cmd.ExecuteReader();
				rdr.Read();
				if (rdr.IsDBNull(0)) {
					rdr.Close();
					
					// Command Text - Update Student Number
					cmd.CommandText = string.Format("UPDATE {0} SET Student_Number='{1}' WHERE Row='{2}' AND Col='{3}';", SEATTABLE + grade, seat.StudentNumber, seat.Row, seat.Col);

					try {
						// The number of rows affected
						result = cmd.ExecuteNonQuery();
					} catch (MySqlException e) {
						result = -3;
					}
				} else {
					rdr.Close();

					// 이미 선택된 좌석일 경우 -2 반환
					result = -2;
				}

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
		public static int CancelReservation(string studentNumber, string grade) {
			// If cancel fails, -1 is returned
			int result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Delete Student Number
				string commandText = string.Format("UPDATE {0} SET Student_Number=NULL WHERE Student_Number='{1}';", SEATTABLE + grade, studentNumber);
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
		/// <see cref="Seat.Col"/>
		public static int AddSeat(string row, string column, string grade) {
			// Return -1 if seat addition fails
			int result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Password
				string commandText = string.Format("INSERT INTO {0}(Row, Col) VALUES ('{1}', '{2}');", SEATTABLE + grade, row, column);
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
		public static Seat LoadReservation(string studentNumber, string grade) {
			// Return -1 if search fails
			var result = new Seat(studentNumber);

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Seat
				string commandText = string.Format("SELECT * FROM {0} WHERE Student_Number='{1}';", SEATTABLE + grade, studentNumber);
				var cmd = new MySqlCommand(commandText, conn);

				// Reader 가져오기
				var rdr = cmd.ExecuteReader();

				// Load 성공 시 실행
				if (rdr.Read()) {
					result.Row = ((int)rdr["Row"]).ToString();
					result.Col = ((int)rdr["Col"]).ToString();
				}

				// Connection Close
				conn.Close();
			}

			return result;
		}

		/// <summary>
		/// 매진된 자리들을 가져오는 메서드
		/// </summary>
		/// <param name="grade">학년</param>
		/// <see cref="Seat.Row"/>
		/// <see cref="Seat.Col"/>
		public static bool[,] GetSoldOutSeats(string grade) {
			var result = new bool[23, 19];

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Seat
				string commandText = string.Format("SELECT * FROM {0} WHERE Student_Number is not NULL;", SEATTABLE + grade);
				var cmd = new MySqlCommand(commandText, conn);

				// Reader 가져오기
				var rdr = cmd.ExecuteReader();

				// Load 성공 시 실행
				while (rdr.Read()) {
					result[(int)rdr["Row"] - 1, (int)rdr["Col"] - 1] = true;
				}

				// Connection Close
				conn.Close();
			}

			return result;
		}

		/// <summary>
		/// 잔여석의 수를 가져오는 메서드
		/// </summary>
		/// <param name="grade">학년</param>
		/// <returns></returns>
		public static int GetLeftSeatsCount(string grade) {
			var result = -1;

			// Connect to DB
			using (var conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConcertDB"].ConnectionString)) {
				conn.Open();

				// Command Text - Select Seat
				string commandText = string.Format("SELECT count(*) FROM {0} WHERE Student_Number IS NULL;", SEATTABLE + grade);
				var cmd = new MySqlCommand(commandText, conn);
				
				result = Convert.ToInt32(cmd.ExecuteScalar());

				// Connection Close
				conn.Close();
			}

			return result;
		}
	}
}