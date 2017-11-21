package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.Localhost;
import DAO.ResultDAO;
import DB.DBConnection;

@WebServlet("/HighPoint")
public class HighPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HighPoint() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;

		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = (Connection) DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
		
		List<BEAN.HighPoint> list = ResultDAO.ViewHighPoint(conn);
		
		request.setAttribute("highpoint", list);	
		
		request.getRequestDispatcher("View/Admin/TopHighPoint.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
