package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.UserUtil;

/**
 * Servlet implementation class TeacherLoginServlet
 */
@WebServlet(name = "TeacherLoginServlet", urlPatterns = {"/TeacherLoginServlet"})
public class TeacherLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherLoginServlet() {
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
		
		String teacherId = request.getParameter("teacherId").trim();
		String password = request.getParameter("password").trim();
		String course = request.getParameter("course").trim();
		
		UserUtil userUtil = new UserUtil();
		boolean userSuccess = userUtil.checkUser(teacherId, 2);
		boolean success = userUtil.checkUser(teacherId, password, 2);
		
		if (success) {
			HttpSession session = request.getSession(true);
			session.setAttribute("teacherId", teacherId);
			session.setAttribute("course", course);
			response.sendRedirect(request.getContextPath() + "/teacher/main.jsp");
		}
		else if (userSuccess)
			response.sendRedirect(request.getContextPath() + "/teacher/login.jsp?flag=error");
		else
			response.sendRedirect(request.getContextPath() + "/teacher/login.jsp?flag=nobody");
	}

}
