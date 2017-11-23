package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Localhost;
import DAO.CountingDAO;
import DB.DBConnection;

@WebServlet("/NumberOfQuestion")
public class NumberOfQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NumberOfQuestion() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
				
		int id = Integer.parseInt(request.getParameter("testid"));
		
		int kq = CountingDAO.NumberListen(id, conn);
				
		request.setAttribute("numberlisten", kq);
		
		request.getRequestDispatcher("View/Admin/Counting.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
				
		int id = Integer.parseInt(request.getParameter("testid"));
		
		int kq = CountingDAO.NumberRead(id, conn);
				
		request.setAttribute("numberread", kq);
		
		request.getRequestDispatcher("View/Admin/Counting.jsp").forward(request, response);
	}

}
