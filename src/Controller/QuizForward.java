package Controller;

import java.io.IOException;
import java.nio.file.attribute.UserPrincipalLookupService;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QuizDAO;
import DB.DBConnection;
import BEAN.Localhost;
import BEAN.Reading;

@WebServlet("/QuizForward")
public class QuizForward extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuizForward() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
		
		List<Reading> list = QuizDAO.DisplayQuestion(conn);

		request.setAttribute("listquiz", list);
		RequestDispatcher rd = request.getRequestDispatcher("View/Quiz.jsp");
		rd.forward(request, response);
	}

}
