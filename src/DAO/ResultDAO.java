package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Statement;

import BEAN.HighPoint;
import BEAN.Result;
import BEAN.ViewCandidateHaveExam;

public class ResultDAO {
	
	
	public static List<Result> DisplayResult(int start, int count, Connection conn) {
		
		List<Result> list = new ArrayList<Result>();

		String sql = "select * from result limit "+(start-1)+", "+count+"";
		try {

			PreparedStatement ptmt = conn.prepareCall(sql);
			
			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				
				Result rt = new Result();
				
				rt.setResultid(rs.getInt("resultid"));
				rt.setNumcorrectanswerread(rs.getInt("numcorrectanswerread"));
				rt.setNumcorrectanswerlisten(rs.getInt("numcorrectanswerlisten"));
				rt.setPoint(rs.getInt("point"));
				rt.setTestid(rs.getInt("testid"));
				rt.setUserid(rs.getInt("userid"));

				
				list.add(rt);
			}
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
	public static int CountRow(Connection conn) {

		int count = 0;

		String sql = "select count(*) from result";

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
	
	public static List<ViewCandidateHaveExam> ViewCandidateExam(Connection conn) {
		
		List<ViewCandidateHaveExam> list = new ArrayList<ViewCandidateHaveExam>();
		
		String sql = "{ call pr_AllExam()}";
		try {
			
			Statement stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				ViewCandidateHaveExam ve = new ViewCandidateHaveExam();
				
				ve.setUserid(rs.getInt("userid"));
				ve.setUsername(rs.getString("username"));
				ve.setEmail(rs.getString("email"));
				ve.setPoint(rs.getInt("point"));
				
				list.add(ve);
			}
			
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
	
	public static List<ViewCandidateHaveExam> ViewCandidateDontExam(Connection conn) {
		
		List<ViewCandidateHaveExam> list = new ArrayList<ViewCandidateHaveExam>();
		
		String sql = "{ call pr_DontExam()}";
		try {
			
			Statement stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				ViewCandidateHaveExam ve = new ViewCandidateHaveExam();
				
				ve.setUserid(rs.getInt("userid"));
				ve.setUsername(rs.getString("username"));
				ve.setEmail(rs.getString("email"));
				
				list.add(ve);
			}
			
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}

	public static List<HighPoint> ViewHighPoint(Connection conn) {
		
		List<HighPoint> list = new ArrayList<HighPoint>();
		
		String sql = "{ call pr_Medal()}";
		try {
			
			Statement stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				HighPoint hp = new HighPoint();
				
				hp.setUserid(rs.getInt("userid"));
				hp.setUsername(rs.getString("username"));
				hp.setTotal(rs.getInt("Times"));
				hp.setMedal(rs.getString("Medal"));
				
				list.add(hp);
			}
			
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
}
