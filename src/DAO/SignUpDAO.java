package DAO;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.SignUp;

public class SignUpDAO {

	public static void InsertAccount(HttpServletRequest request,HttpServletResponse response, 
			SignUp sp , Connection conn ,int t) throws ServletException, IOException {
		
		
		try {
			
			CallableStatement ptmt = conn.prepareCall("{call pr_InsertAccount(?, ?, ?, ?)}");
			
			if(sp.getPassword().equals(sp.getRepeatpassword())) {
				
				ptmt.setInt(1, t);
				ptmt.setString(2, sp.getUsername());
				ptmt.setString(3, sp.getPassword());
				ptmt.setString(4, sp.getEmail());
				// Thực hiện câu lệnh truy vấn
				ptmt.executeUpdate();
				
			}
			else {
				
				request.setAttribute("message", "Sign Up fail");
				request.getRequestDispatcher("View/Register.jsp").forward(request, response);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
}
