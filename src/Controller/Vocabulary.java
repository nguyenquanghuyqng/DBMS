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

import BEAN.Localhost;
import DAO.VocabularyDAO;
import DB.DBConnection;

@WebServlet("/Vocabulary")
public class Vocabulary extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Vocabulary() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());

		List<BEAN.Vocabulary> list = VocabularyDAO.DisplayVocabulary(conn);
		
		request.setAttribute("vocabulary", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("View/Vocabulary.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
