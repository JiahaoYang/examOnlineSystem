package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import util.MD5Util;
import util.UserUtil;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet(name = "AddUserServlet", urlPatterns = {"/AddUserServlet"})
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId").trim();
		String userName = request.getParameter("userName").trim();
		String password = MD5Util.encodeByMD5(request.getParameter("password").trim());
		int userType = Integer.parseInt(request.getParameter("selectType").trim());
		
		User user = new User();
		user.setId(userId);
		user.setName(userName);
		user.setPassword(password);
		user.setType(userType);
		
		UserUtil userUtil = new UserUtil();
		boolean success = userUtil.addUser(user);
		if (success)
			response.sendRedirect(request.getContextPath() + "/admin/updateUserSuccess.html");
		else
			response.sendRedirect(request.getContextPath() + "/admin/updateUserFail.html");
	}

}
