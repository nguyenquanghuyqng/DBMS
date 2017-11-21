package DAO;

import java.sql.*;
import java.util.*;
import javax.naming.spi.DirStateFactory.Result;
import javax.swing.JOptionPane;

import com.mysql.jdbc.PreparedStatement;


public class LoginDAO {

	public static boolean Validate(String name, String pass, Connection conn) {
		
		String username = null;
		String password = null;

		boolean t = false;

		java.sql.PreparedStatement ptmt = null;

		String sql = "select username, pass, roleid from users_view";

		try {
			ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				username = rs.getString("username");
				password = rs.getString("pass");
				int roleid = rs.getInt("roleid");
				
				if ((username.equals(name)) && (password.equals(pass)) && roleid == 2) {
					t = true;
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	public static boolean Roleid(String name, String pass, Connection conn) {
		
		String username = null;
		String password = null;

		boolean t = false;

		java.sql.PreparedStatement ptmt = null;

		String sql = "select username, pass, roleid from users_view";

		try {
			ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				username = rs.getString("username");
				password = rs.getString("pass");
				int roleid = rs.getInt("roleid");
				
				if ((username.equals(name)) && (password.equals(pass)) && roleid == 1) {
					t = true;
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
		
	}
}
