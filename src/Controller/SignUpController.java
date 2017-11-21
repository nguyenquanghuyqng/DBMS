package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import java.sql.*;
import java.util.List;

import BEAN.Localhost;
import BEAN.SignUp;
import BEAN.Slidebanner;
import DAO.HomeDAO;
import DAO.SignUpDAO;
import DB.DBConnection;

@WebServlet("/SignUpController")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int t =11;
	public SignUpController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		t++;
		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = (Connection) DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
		
		// Lấy giá trị của trang jsp và gán vào các biến
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repeatpassword = request.getParameter("repeatpassword");
		String email = request.getParameter("email");
		
		// Gọi lại lớp Sign Up
		SignUp sp = new SignUp();
		
		sp.setUsername(username);
		sp.setPassword(password);
		sp.setRepeatpassword(repeatpassword);
		sp.setEmail(email);
		
		SignUpDAO.InsertAccount(request, response, sp,conn,t);
		
		try {
			List<Slidebanner> list = HomeDAO.DisplaySlidebanner(conn);

			request.setAttribute("listslidebanner", list);

			RequestDispatcher rd = request.getRequestDispatcher("View/HomeStudent.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

			request.setAttribute("message", e.getMessage());

		}

	}

}
