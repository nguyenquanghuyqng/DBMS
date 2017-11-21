package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Localhost;
import BEAN.TestSheet;
import DAO.TestSheetDAO;
import DB.DBConnection;

@WebServlet("/UpdateDeleteTest")
public class UpdateDeleteTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateDeleteTest() {
		super();
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
		
		List<TestSheet> list = TestSheetDAO.DisplayTestSheet(conn);
		
		request.setAttribute("testsheet", list);
		
		request.getRequestDispatcher("View/Admin/UpdateDeleteTestSheet.jsp").forward(request, response);
	}

}
