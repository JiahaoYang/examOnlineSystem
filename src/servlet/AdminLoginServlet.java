package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.MD5Util;
import util.UserUtil;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/AdminLoginServlet"})
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
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
		response.setCharacterEncoding("utf-8");
		
		String adminId = request.getParameter("adminId");
		String password = MD5Util.encodeByMD5(request.getParameter("password"));
		
		UserUtil userUtil = new UserUtil();
		boolean success = userUtil.checkUser(adminId, password, 1);
		if (success) {
			response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
			HttpSession session = request.getSession(true);
			session.setAttribute("adminId", adminId);
		}
		else {
			response.sendRedirect(request.getContextPath() + "/admin/login.jsp?flag=error");
		}
	}

}
