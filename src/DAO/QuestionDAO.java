package DAO;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import BEAN.Account;
import BEAN.OneQuestion;
import BEAN.Question;

public class QuestionDAO {

	public static List<Question> DisplayQuestion(int start, int count, Connection conn) {

		List<Question> list = new ArrayList<Question>();

		
		String sql = "select * from Reading limit "+(start-1)+", "+count+"";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);
			
			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Question qs = new Question();

				qs.setQuestionid(rs.getInt("readid"));
				qs.setReadnumber(rs.getInt("readnumber"));
				qs.setReadcontent(rs.getString("readcontent"));
				qs.setOption1(rs.getString("option1"));
				qs.setOption2(rs.getString("option2"));
				qs.setOption3(rs.getString("option3"));
				qs.setOption4(rs.getString("option4"));
				qs.setCorrectanswer(rs.getString("correctanswer"));
				qs.setReadtestid(rs.getInt("readtestid"));
				qs.setTestid(rs.getInt("testid"));

				list.add(qs);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public static List<Question> DisplayQuestion_2(Connection conn) {

		List<Question> list = new ArrayList<Question>();

		String sql = "select * from Reading";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				Question qs = new Question();

				qs.setQuestionid(rs.getInt("readid"));
				qs.setReadnumber(rs.getInt("readnumber"));
				qs.setReadcontent(rs.getString("readcontent"));
				qs.setOption1(rs.getString("option1"));
				qs.setOption2(rs.getString("option2"));
				qs.setOption3(rs.getString("option3"));
				qs.setOption4(rs.getString("option4"));
				qs.setCorrectanswer(rs.getString("correctanswer"));
				qs.setReadtestid(rs.getInt("readtestid"));
				qs.setTestid(rs.getInt("testid"));

				list.add(qs);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public static boolean DeleteQuestion(int id, Connection conn) {

		boolean t = false;

//		String sql = "Delete From Reading Where readid =?";
//
//		try {
//			PreparedStatement stmt = conn.prepareStatement(sql);
//			stmt.setInt(1, id);
//			stmt.executeUpdate();
//			t = true;
//		}
		
		 String sql = "{ call pr_DeleteReading(?)}";
			
		 try {
			 CallableStatement stmt = conn.prepareCall(sql);
			 stmt.setInt(1, id);
			 stmt.executeUpdate();
			 
			 System.out.println("Delete successfully  ...");
			 
			 t = true;
		 }

		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}

	public static int CountRow(Connection conn) {

		int count = 0;

//		String sql = "select count(*) from Reading";
//
//		PreparedStatement ptmt;
//		try {
//
//			ptmt = conn.prepareStatement(sql);
//
//			ResultSet rs = ptmt.executeQuery();
//
//			rs.next();
//
//			count = rs.getInt(1);
//
//		} 
		
		String sql = "{ call pr_CountReading()}";
		
		 try {
			 CallableStatement stmt = conn.prepareCall(sql);
			 
			 ResultSet rs = stmt.executeQuery();
			 
			 rs.next();
			 
			 count = rs.getInt(1);
			 
			 System.out.println("Count Reading successfully  ...");
			 
		 }
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;

	}
	
	public static boolean InsertOneQuestion(HttpServletRequest request, OneQuestion oq, Connection conn) {

		boolean t = false;
		try {

			CallableStatement ptmt = conn.prepareCall("{call pr_InsertQuestion(?, ?, ?, ?, ?, ? ,?, ?)}");
			
			ptmt.setString(1, oq.getQuestion());
			ptmt.setInt(2, oq.getQuestionnumber());
			ptmt.setString(3, oq.getQuestioncontent());
			ptmt.setString(4, oq.getOption1());
			ptmt.setString(5, oq.getOption2());
			ptmt.setString(6, oq.getOption3());
			ptmt.setString(7, oq.getOption4());
			ptmt.setString(8, oq.getAnswerquestion());
			
			int kt = ptmt.executeUpdate();
			
			if (kt != 0) {
				
				request.setAttribute("message", "Insert data from excel to mysql  success");
				t =true;
				
			} 
			else {
				
				request.setAttribute("message", "Insert data from excel to mysql  failed");
				t =false;
			}
			ptmt.close();
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return t;
	}
	
	public static List<OneQuestion> SelectQuestion(int id, Connection conn) {

		List<OneQuestion> list = new ArrayList<OneQuestion>();
		
		String sql = "select * from reading where readid = " + id + "";

		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				OneQuestion oq = new OneQuestion();
				oq.setQuestionid(Integer.parseInt(rs.getString("readid")));
				oq.setQuestionnumber(Integer.parseInt(rs.getString("readnumber")));
				oq.setQuestioncontent(rs.getString("readcontent"));
				oq.setOption1(rs.getString("option1"));
				oq.setOption2(rs.getString("option2"));
				oq.setOption3(rs.getString("option3"));
				oq.setOption4(rs.getString("option4"));
				oq.setAnswerquestion(rs.getString("correctanswer"));

				list.add(oq);

			}
			ptmt.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return list;
	}
	public static boolean UpdatetQuestion(HttpServletRequest request, OneQuestion oq, Connection conn, int id) {

		boolean t = false;
		try {

			CallableStatement ptmt = conn.prepareCall("{call pr_UpdateQuestion(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
			ptmt.setString(1, "Reading");
			ptmt.setInt(2, oq.getQuestionnumber());
			ptmt.setString(3, oq.getQuestioncontent());
			ptmt.setString(4, oq.getOption1());
			ptmt.setString(5, oq.getOption2());
			ptmt.setString(6, oq.getOption3());
			ptmt.setString(7, oq.getOption4());
			ptmt.setString(8, oq.getAnswerquestion());
			ptmt.setInt(9, id);
			
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				
				request.setAttribute("message", "Update data success");
				t =true;
			} 
			else {
				
				request.setAttribute("message", "Update data failed");
				t = false;
			}
			ptmt.close();
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return t;
	}
}
