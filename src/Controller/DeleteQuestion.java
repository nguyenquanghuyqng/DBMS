package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Account;
import BEAN.Localhost;
import BEAN.Question;
import DAO.AccountDAO;
import DAO.QuestionDAO;
import DB.DBConnection;

@WebServlet("/DeleteQuestion")
public class DeleteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteQuestion() {
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
		
		int id = Integer.parseInt(request.getParameter("index"));
		
		boolean kt = QuestionDAO.DeleteQuestion(id, conn);
		
		if (kt) {
			
			String pageidstr= request.getParameter("pageid");
			
			int count =5;
			
			// Ep kieu Int
			int pageid=Integer.parseInt(pageidstr);
			
			// Neu pageid == 1 thi se khong phan trang
			// Neu pageid != 1 thi se phan trang
			
			if(pageid==1){
				
			}
			else{
				
				pageid=pageid-1;
				pageid=pageid*count + 1;
				
			}

			List<Question> list = QuestionDAO.DisplayQuestion(pageid, count, conn);
			
			int sumrow=QuestionDAO.CountRow(conn);
			
			int maxpageid= (sumrow/count)+1;
			
			request.setAttribute("maxpageid", maxpageid);
						
			request.setAttribute("numberpage", Integer.parseInt(pageidstr));
			
			request.setAttribute("questions", list);
			
			RequestDispatcher rd= request.getRequestDispatcher("View/Admin/UpdateDeleteQuestion.jsp");
			rd.forward(request, response);
		}

		else {
			
			request.setAttribute("error", "Xóa tài khoản thất bại");
			RequestDispatcher rd= request.getRequestDispatcher("View/Admin/UpdateDeleteQuestion.jsp");
			rd.forward(request, response);
		}
	}

}
