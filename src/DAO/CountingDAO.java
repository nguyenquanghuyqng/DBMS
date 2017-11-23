package DAO;

import java.sql.*;
import java.util.*;

public class CountingDAO {
	public static int NumberTime(int id, Connection conn) {
		int result=0;
		String sql = "{? = call func_NumberOfTest(?)}";

		try {
			
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1,java.sql.Types.VARCHAR);
			stmt.setInt(2, id);
			
			stmt.executeUpdate();
			 
			 result = stmt.getInt(1);
			 
			System.out.println("Successfully.."+ result);
			 
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
	public static int NumberPoint(int id, Connection conn) {
		int result=0;
		String sql = "{? = call func_ScoreID(?)}";

		try {
			
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1,java.sql.Types.VARCHAR);
			stmt.setInt(2, id);
			
			stmt.executeUpdate();
			 
			 result = stmt.getInt(1);
			 
			System.out.println("Successfully.."+ result);
			 
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
	public static int NumberListen(int id, Connection conn) {
		int result=0;
		String sql = "{? = call func_NumberOfQuestionsListening(?)}";

		try {
			
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1,java.sql.Types.VARCHAR);
			stmt.setInt(2, id);
			
			stmt.executeUpdate();
			 
			 result = stmt.getInt(1);
			 
			System.out.println("Successfully.."+ result);
			 
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
	
	public static int NumberRead(int id, Connection conn) {
		int result=0;
		String sql = "{? = call func_NumberOfQuestionsReading(?)}";

		try {
			
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1,java.sql.Types.VARCHAR);
			stmt.setInt(2, id);
			
			stmt.executeUpdate();
			 
			 result = stmt.getInt(1);
			 
			System.out.println("Successfully.."+ result);
			 
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
	
	public static int NumberUser(int id, Connection conn) {
		int result=0;
		String sql = "{? = call func_NumberOfUser(?)}";

		try {
			
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1,java.sql.Types.VARCHAR);
			stmt.setInt(2, id);
			
			stmt.executeUpdate();
			 
			 result = stmt.getInt(1);
			 
			System.out.println("Successfully.."+ result);
			 
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
}
