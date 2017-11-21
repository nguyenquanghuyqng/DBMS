package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.Localhost;
import BEAN.Result;
import BEAN.ViewCandidateHaveExam;
import DAO.ResultDAO;
import DB.DBConnection;

@WebServlet("/CandidateHaveExam")
public class CandidateHaveExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CandidateHaveExam() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = null;

		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = (Connection) DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
		
		List<ViewCandidateHaveExam> list = ResultDAO.ViewCandidateExam(conn);
		
		request.setAttribute("candidate", list);	
		
		RequestDispatcher rd= request.getRequestDispatcher("View/Admin/ListCandidateHaveExam.jsp");
		rd.forward(request, response);
		
	}

}
