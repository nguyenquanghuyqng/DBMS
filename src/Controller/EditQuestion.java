package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Account;
import BEAN.Localhost;
import BEAN.OneQuestion;
import BEAN.Question;
import DAO.QuestionDAO;
import DB.DBConnection;

@WebServlet("/EditQuestion")
public class EditQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditQuestion() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("index"));
		
		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
		
		List<OneQuestion> list = QuestionDAO.SelectQuestion(id, conn);
		
		request.setAttribute("question", list);
				
		request.getRequestDispatcher("View/Admin/EditOneQuestion.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
		
		int questionid = Integer.parseInt(request.getParameter("index"));
		
		OneQuestion oq = new OneQuestion();
		
		oq.setQuestionnumber(Integer.parseInt(request.getParameter("questionnumber")));
		oq.setQuestioncontent(request.getParameter("questioncontent"));
		oq.setOption1(request.getParameter("option1"));
		oq.setOption2(request.getParameter("option2"));
		oq.setOption3(request.getParameter("option3"));
		oq.setOption4(request.getParameter("option4"));
		oq.setAnswerquestion(request.getParameter("correctanswer"));
		
		boolean kt = QuestionDAO.UpdatetQuestion(request, oq, conn, questionid);
		if(kt) {
			String pageidstr= request.getParameter("pageid");
			// count là số lượng phần tử tối đa hiện ở trang
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
			List<OneQuestion> list = QuestionDAO.SelectQuestion(questionid, conn);
			
			request.setAttribute("question", list);
					
			request.getRequestDispatcher("View/Admin/EditOneQuestion.jsp").forward(request, response);
		}
	}

}
