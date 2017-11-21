package DAO;

import java.sql.*;
import java.util.*;

import BEAN.Slidebanner;

public class HomeDAO {

	public static List<Slidebanner> DisplaySlidebanner(Connection conn) {

		List<Slidebanner> list = new ArrayList<Slidebanner>();

		String sql = "select * from Slidebanner_View";

		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			
			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Slidebanner sld = new Slidebanner();

				sld.setSlidebannername(rs.getString("slidebannername"));
				sld.setSlidebannercontent(rs.getString("slidebannercontent"));
				sld.setSlidebannerimage(rs.getString("slidebannerimage"));

				list.add(sld);

			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
}
