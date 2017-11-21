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

import BEAN.Account;
import BEAN.Localhost;
import BEAN.SignUp;
import BEAN.Slidebanner;
import DAO.AccountDAO;
import DAO.HomeDAO;
import DAO.SignUpDAO;
import DB.DBConnection;

@WebServlet("/InsertAccount")
public class InsertAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int t = 14;

	public InsertAccount() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("View/Admin/InsertAccount.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		t++;
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
		
		Connection conn = null;

		// Lấy địa chỉ Ip, uername đã đc set trong localhost
		List<Localhost> entries = (List<Localhost>) getServletContext().getAttribute("localhost");

		Localhost lc = entries.get(0);

		conn = (Connection) DBConnection.CreateConnection("localhost", lc.getIp(), lc.getDatabase(), lc.getUserName(),
				lc.getPassword());
		// Lấy giá trị của trang jsp và gán vào các biến
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		int roleid = Integer.parseInt(request.getParameter("roleid"));

		// Gọi lại lớp Sign Up
		Account acc = new Account();

		acc.setUsername(username);
		acc.setPass(password);
		acc.setEmail(email);
		acc.setFullname(fullname);
		acc.setRoleid(roleid);
		
		AccountDAO.InsertUser(request, acc, conn, t);

		try {
			List<Account> list = AccountDAO.DisplayAccount(pageid, count, conn);
			
			int sumrow=AccountDAO.CountRow(conn);
			
			int maxpageid= (sumrow/count)+1;
			
			request.setAttribute("maxpageid", maxpageid);
					
			request.setAttribute("numberpage", Integer.parseInt(pageidstr));
			
			request.setAttribute("account", list);
			
			RequestDispatcher rd= request.getRequestDispatcher("View/Admin/UpdateDeleteAcount.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

			request.setAttribute("message", e.getMessage());

		}

	}

}
