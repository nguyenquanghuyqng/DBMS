package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Account;

public class Counting {
	
	public static List<Account> NumberTime(Connection conn) {

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

}
