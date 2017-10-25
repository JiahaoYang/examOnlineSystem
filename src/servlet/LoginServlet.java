package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import util.TestSetUtil;
import util.UserFlagUtil;
import util.UserUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");
		response.setCharacterEncoding("utf8");

		String userId = request.getParameter("userId").trim();
		String password = request.getParameter("password").trim();
		String testTime = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		String course = new String(request.getParameter("course").getBytes("iso8859-1"), "utf-8").trim();
		
		UserUtil userUtil = new UserUtil();
		UserFlagUtil ufUtil = new UserFlagUtil();
		TestSetUtil tsUtil = new TestSetUtil();
		
		boolean userSuccess = userUtil.checkUser(userId, 3);
		boolean success = userUtil.checkUser(userId, password, 3);
		
		//用户名，类型，密码验证成功
		if (success) {
			int flag = ufUtil.isSubmit(userId, course, testTime);
			//今日有相关考试信息
			if (tsUtil.getTestSet(course, testTime) != null) {
				//未考试
				if (flag  == 0) {
					HttpSession session = request.getSession(true);	//参数为true，没有session则创建
					session.setAttribute("userId", userId);
					session.setAttribute("course", course);
					session.setAttribute("testTime", testTime);
					
					response.sendRedirect(request.getContextPath() + "/student/welcome.jsp");
				}
				//试卷已提交
				else if (flag == 1) {
					response.sendRedirect(request.getContextPath() + "/student/login.jsp?flag=submit");
				}
				//考生未参与本场考试
				else {
					response.sendRedirect(request.getContextPath() + "/student/login.jsp?flag=noStuExamInfo");
				}
			}
			//无相关考试
			else {
				response.sendRedirect(request.getContextPath() + "/student/login.jsp?flag=noExam");
			}
		}
		//密码错误
		else if (userSuccess) {
			response.sendRedirect(request.getContextPath() + "/student/login.jsp?flag=error");
		}
		//查无此人
		else {
			response.sendRedirect(request.getContextPath() + "/student/login.jsp?flag=nobody");
		}
	}
}
