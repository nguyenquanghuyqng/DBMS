package DAO;

import java.util.*;

import BEAN.Reading;
import BEAN.Result;

import java.sql.*;

//
public class QuizDAO {

	public static List<Reading> DisplayQuestion(Connection conn) {

		List<Reading> list = new ArrayList<Reading>();

		String sql = "select readnumber, readcontent, option1, option2, option3,"
				+ "option4, correctanswer, readtestid from Reading";
		// String sql ="{ call pr_Lietkefiledoc() }";
		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				int number = rs.getInt("readnumber");
				String read = rs.getString("readcontent");
				String option1 = rs.getString("option1");
				String option2 = rs.getString("option2");
				String option3 = rs.getString("option3");
				String option4 = rs.getString("option4");
				String correctanswer = rs.getString("correctanswer");
				int readtestid = rs.getInt("readtestid");

				if (readtestid == 2) {

					Reading ibt = new Reading();

					ibt.setReadnumber(number);
					ibt.setReadcontent(read);
					ibt.setOption1(option1);
					ibt.setOption2(option2);
					ibt.setOption3(option3);
					ibt.setOption4(option4);
					ibt.setCorrectanswer(correctanswer);

					list.add(ibt);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public static List<Reading> GetCorrectAnswer(Connection conn) {

		List<Reading> list = new ArrayList<Reading>();

		String sql = "select readnumber, readcontent, option1, option2, option3, option4, correctanswer from Reading";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				int readnumber = rs.getInt("readnumber");
				String readcontent = rs.getString("readcontent");
				String option1 = rs.getString("option1");
				String option2 = rs.getString("option2");
				String option3 = rs.getString("option3");
				String option4 = rs.getString("option4");
				String correctanswer = rs.getString("correctanswer");

				Reading ibt = new Reading();

				ibt.setReadnumber(readnumber);
				ibt.setReadcontent(readcontent);
				ibt.setOption1(option1);
				ibt.setOption2(option2);
				ibt.setOption3(option3);
				ibt.setOption4(option4);
				ibt.setCorrectanswer(correctanswer);

				list.add(ibt);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	public static int GetCountRow(Connection conn) {
		int count = 0;

		String sql = "select count(*) from Reading where readtestid=" + 2 + "";
		PreparedStatement ptmt;

		try {
			ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			rs.next();
			count = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}
	
	// Chưa xong phần insert Result khi thi xong

	public static void InsertResult(Result rs, Connection conn) {

		String sql = "insert into result(point,userid) values(?,?)";

		try {
			
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ptmt.setInt(1, rs.getPoint());
			ptmt.setInt(2, rs.getUserid());
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
