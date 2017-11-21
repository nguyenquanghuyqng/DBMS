package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Account;
import BEAN.Localhost;
import BEAN.Slidebanner;
import DAO.HomeDAO;
import DAO.LoginDAO;
import DB.DBConnection;

@WebServlet("/SignInController")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignInController() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("View/Register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;

		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());


		if (request.getCharacterEncoding() == null)
			request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("user");
		String pass = request.getParameter("pass");

		Account acc = new Account();

		acc.setUsername(name);
		acc.setPass(pass);

		boolean kt = LoginDAO.Validate(name, pass, conn);

		if (kt) {

			try {
				List<Slidebanner> list = HomeDAO.DisplaySlidebanner(conn);

				request.setAttribute("listslidebanner", list);

				RequestDispatcher rd = request.getRequestDispatcher("View/HomeStudent.jsp");
				rd.forward(request, response);
				return;

			} catch (Exception e) {

				request.setAttribute("message", e.getMessage());

			}
		}

		boolean roleid = LoginDAO.Roleid(name, pass, conn);

		if (roleid) {

			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/HomeAdmin.jsp");
			rd.forward(request, response);
			return;

		} else {
			// request.setAttribute("message", "Login Failed");
			RequestDispatcher rd = request.getRequestDispatcher("View/Register.jsp");
			rd.forward(request, response);
			

		}
	}

}
