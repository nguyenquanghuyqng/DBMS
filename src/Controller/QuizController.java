package Controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.AnswerUser;
import BEAN.Localhost;
import BEAN.Reading;
import DAO.QuizDAO;
import DB.DBConnection;

@WebServlet("/QuizController")
public class QuizController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuizController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());

		int countrow = QuizDAO.GetCountRow(conn);
		
		List<AnswerUser> listansweruser = new ArrayList<AnswerUser>();

		List<Reading> listcorrectanswer = QuizDAO.GetCorrectAnswer(conn);

		for (int i = 1; i <= countrow; i++) {

			String answer = request.getParameter("ans[" + i + "]");
			
			if (answer != null) {

				AnswerUser au = new AnswerUser();
				au.setAnswer(answer);
				au.setNumber(i);
				listansweruser.add(au);
			} else {
				request.setAttribute("msg", "You must choose all option");
				
				List<Reading> list = QuizDAO.DisplayQuestion(conn);

				request.setAttribute("listquiz", list);

				request.getRequestDispatcher("View/Quiz.jsp").forward(request, response);
			}

		}
		
		
		
		// tra ve ket qua duoi dang setAttribute
		request.setAttribute("listcorrectanswer", listcorrectanswer);
		request.setAttribute("listansweruser", listansweruser);

		RequestDispatcher rd = request.getRequestDispatcher("View/Result.jsp");
		rd.forward(request, response);
	}

}
