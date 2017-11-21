package DAO;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import BEAN.Account;
import BEAN.Question;

public class EditAcount {

	public static List<Account> SelectAccount(int id, Connection conn) {

		List<Account> list = new ArrayList<Account>();

		String sql = "select * from users where userid = " + id + "";

//		System.out.println(id);

		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);

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
			ptmt.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return list;
	}

	public static boolean UpdateData(HttpServletRequest request, int id, Account acc, Connection conn) {

		boolean t = false;
		
//		String sql = "UPDATE users set username=?, pass=?, email=?, roleid=? where userid="+id+"";
//
//		try {
//
//			PreparedStatement ptmt = conn.prepareStatement(sql);
//
//			ptmt.setString(1, acc.getUsername());
//			ptmt.setString(2, acc.getPass());
//			ptmt.setString(3, acc.getEmail());
//			ptmt.setInt(4, acc.getRoleid());
//
//			int kt = ptmt.executeUpdate();
//			
//			System.out.println("Kt "+kt);
//
//			if (kt != 0) {
//
//				// request.setAttribute("message", "Insert data success");
//				return t =  true;
//			} 
//			ptmt.close();
//
//		} 
		

		try {

			CallableStatement ptmt = conn.prepareCall("{call pr_UpdateUser(?, ?, ?, ?, ?)}");

			ptmt.setString(1, acc.getUsername());
			ptmt.setString(2, acc.getPass());
			ptmt.setString(3, acc.getEmail());
			ptmt.setInt(4, acc.getRoleid());
			ptmt.setInt(5, id);

			int kt = ptmt.executeUpdate();
			
			System.out.println("Kt "+kt);

			if (kt != 0) {

				// request.setAttribute("message", "Insert data success");
				return t =  true;
			} 
			ptmt.close();

		} 
		
		
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return t;

	}
}
