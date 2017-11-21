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
import DAO.AccountDAO;
import DAO.EditAcount;
import DB.DBConnection;

@WebServlet("/UpdateAccountController")
public class UpdateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateAccountController() {
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

		int userid = (Integer.parseInt(request.getParameter("userid")));
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String email = request.getParameter("email");
		int roleid = (Integer.parseInt(request.getParameter("roleid")));

		Account acc = new Account();

		acc.setUserid(userid);
		acc.setUsername(username);
		acc.setPass(password);
		acc.setEmail(email);
		acc.setRoleid(roleid);

		boolean kt = EditAcount.UpdateData(request, userid, acc, conn);

		if (kt) {
			
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
			
			List<Account> list = AccountDAO.DisplayAccount(pageid, count, conn);
			
			int sumrow=AccountDAO.CountRow(conn);
			
			int maxpageid= (sumrow/count)+1;
			
			request.setAttribute("maxpageid", maxpageid);
					
			request.setAttribute("numberpage", Integer.parseInt(pageidstr));
			
			request.setAttribute("account", list);
			
			RequestDispatcher rd= request.getRequestDispatcher("View/Admin/UpdateDeleteAcount.jsp");
			rd.forward(request, response);
			
		} else {
			
			int id = Integer.parseInt(request.getParameter("index"));
								
			List<Account> list = EditAcount.SelectAccount(id, conn);
			
			request.setAttribute("account", list);
			
			 RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditAccountUser.jsp");
			 rd.forward(request, response);
		}

	}

}
