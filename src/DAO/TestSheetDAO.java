package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import BEAN.TestSheet;

public class TestSheetDAO {
	
public static List<TestSheet> DisplayTestSheet(Connection conn) {
		
		List<TestSheet> list = new ArrayList<TestSheet>();
		
		String sql = "{ call pr_TestSheet()}";
		try {
			
			Statement stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
				TestSheet ts = new TestSheet();
				
				ts.setTestid(rs.getInt("testid"));
				ts.setTestname(rs.getString("testname"));
				ts.setNumberListen(rs.getInt("numberListen"));
				ts.setNumberRead(rs.getInt("numberRead"));
				ts.setTime(rs.getInt("time"));
				
				list.add(ts);
			}
			
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
}
