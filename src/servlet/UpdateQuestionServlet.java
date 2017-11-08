package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Question;
import util.QuestionUtil;

/**
 * Servlet implementation class UpdateQuestionServlet
 */
@WebServlet(name = "UpdateQuestionServlet", urlPatterns = {"/UpdateQuestionServlet"})
public class UpdateQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuestionServlet() {
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
		
		int quesId = Integer.parseInt(request.getParameter("hiddenQuesId").trim());
		String courseType = request.getParameter("course");
		String strCourse = "";
		if ("1".equals(courseType))
			strCourse = "selectCourse";
		else
			strCourse = "createCourse";
		String course = request.getParameter(strCourse).trim();
		int type = Integer.parseInt(request.getParameter("selectType").trim());
		String ques = request.getParameter("ques").trim();
		
		String keyA = null;
		String keyB = null;
		String keyC = null;
		String keyD = null;
		String answer = "";
		Question question = new Question();
		
		if (type == 1) {
			keyA = "正确";
			keyB = "错误";
			answer = request.getParameter("judgeAns").trim();
		}
		else if (type == 2) {
			keyA = request.getParameter("KeyA").trim();
			keyB = request.getParameter("KeyB").trim();
			keyC= request.getParameter("KeyC").trim();
			keyD = request.getParameter("KeyD").trim();
			answer = request.getParameter("sinAns").trim();
		}
		else {
			keyA = request.getParameter("KeyA").trim();
			keyB = request.getParameter("KeyB").trim();
			keyC= request.getParameter("KeyC").trim();
			keyD = request.getParameter("KeyD").trim();
			String[] strAns = request.getParameterValues("mulAns");
			for (String ans : strAns) 
				answer += (ans + " ");
			answer = answer.substring(0, answer.length()-1);
		}
		
		question.setId(quesId);
		question.setCourse(course);
		question.setType(type);
		question.setQues(ques);
		question.setKeyA(keyA);
		question.setKeyB(keyB);
		question.setKeyC(keyC);
		question.setKeyD(keyD);
		question.setAnswer(answer);
		
		QuestionUtil qsUtil = new QuestionUtil();
		boolean success = qsUtil.updateQuestion(question);
		if (success)
			response.sendRedirect(request.getContextPath() + "/admin/updateQuesSuccess.html");
		else
			response.sendRedirect(request.getContextPath() + "/admin/updateQuesFail.html");
	}

}
