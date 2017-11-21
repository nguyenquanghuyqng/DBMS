package DAO;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import BEAN.Account;
import BEAN.Question;

public class AccountDAO {

	public static List<Account> DisplayAccount(int start, int count, Connection conn) {

		List<Account> list = new ArrayList<Account>();

		String sql = "select * from Users_View limit " + (start - 1) + ", " + count + "";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Account acc = new Account();

				acc.setUserid(rs.getInt("userid"));
				acc.setUsername(rs.getString("username"));
				acc.setPass(rs.getString("pass"));
				acc.setEmail(rs.getString("email"));
				acc.setRoleid(rs.getInt("roleid"));

				list.add(acc);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public static List<Account> DisplayAccount_2(Connection conn) {

		List<Account> list = new ArrayList<Account>();

		String sql = "select * from Users";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				Account acc = new Account();

				acc.setUserid(rs.getInt("userid"));
				acc.setUsername(rs.getString("username"));
				acc.setPass(rs.getString("pass"));
				acc.setEmail(rs.getString("email"));
				acc.setRoleid(rs.getInt("roleid"));

				list.add(acc);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
	public static boolean DeleteAccount(int id, Connection conn) {

		boolean t = false;

		// Sử dụng trigger là khi xóa bảng user thì những  user có kết quả thi bên bảng result sẽ xóa theo
		String sql = "Delete From users Where userid =?";

		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			t = true;
		}
		
//		 String sql = "{ call pr_DeleteUser(?)}";
//			
//		 try {
//			 CallableStatement stmt = conn.prepareCall(sql);
//			 stmt.setInt(1, id);
//			 stmt.executeUpdate();
//			 
//			 System.out.println("Delete successfully..");
//			 t = true;
//		 }
		 

		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	// Hàm trả về tổng số hàng trong một table

	public static int CountRow(Connection conn) {

		int count = 0;

		String sql = "select count(*) from Users";

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
	
	public static void InsertUser(HttpServletRequest request, Account acc, Connection conn,int t) {

		try {

			CallableStatement ptmt = conn.prepareCall("{call pr_InsertUser(?, ?, ?, ?, ?)}");
			
			ptmt.setInt(1, t);
			ptmt.setString(2, acc.getUsername());
			ptmt.setString(3, acc.getPass());
			ptmt.setString(4, acc.getEmail());
			ptmt.setInt(5, 2);
			
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				
				request.setAttribute("message", "Insert data from excel to mysql  success");
				
			} 
			else {
				
				request.setAttribute("message", "Insert data from excel to mysql  failed");
				
			}
			ptmt.close();
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
	}
	
	public static boolean UpdatetUser(HttpServletRequest request, Account acc, Connection conn, int id) {

		boolean t = false;
		try {

			CallableStatement ptmt = conn.prepareCall("{call pr_UpdateUser(?, ?, ?, ?, ?)}");
			
			ptmt.setString(1, acc.getUsername());
			ptmt.setString(2, acc.getPass());
			ptmt.setString(3, acc.getEmail());
			ptmt.setInt(4, acc.getRoleid());
			ptmt.setInt(5, id);
			
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
