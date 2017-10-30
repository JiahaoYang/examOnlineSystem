package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Question;
import entity.TestSet;
import util.QuestionUtil;
import util.TestSetUtil;

/**
 * Servlet implementation class AddTestServlet
 */
@WebServlet("/AddTestServlet")
public class AddTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestServlet() {
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
		
		String courseType = request.getParameter("course");
		String strCourse = "";
		if ("1".equals(courseType))
			strCourse = "selectCourse";
		else
			strCourse = "createCourse";
		
		String course = request.getParameter(strCourse).trim();
		int judgeCnt = Integer.parseInt(request.getParameter("judgeNum").trim());
		int judgeScore = Integer.parseInt(request.getParameter("judgeScore").trim());
		int sinCnt = Integer.parseInt(request.getParameter("sinNum").trim());
		int sinScore= Integer.parseInt(request.getParameter("sinScore").trim());
		int mulCnt = Integer.parseInt(request.getParameter("mulNum").trim());
		int mulScore = Integer.parseInt(request.getParameter("mulScore").trim());
		int totalTime = Integer.parseInt(request.getParameter("totalTime").trim());
		String testTime = request.getParameter("testTime").trim();
		
		TestSet testSet = new TestSet();
		testSet.setCourse(course);
		testSet.setJudgeCnt(judgeCnt);
		testSet.setJudgeScore(judgeScore);
		testSet.setSingleCnt(sinCnt);
		testSet.setSingleScore(sinScore);
		testSet.setMulCnt(mulCnt);
		testSet.setMulScore(mulScore);
		testSet.setTotalTime(totalTime);
		testSet.setTestTime(testTime);
		
		TestSetUtil tsUtil = new TestSetUtil();
		boolean success = tsUtil.insertTest(testSet);
		if (success)
			response.sendRedirect(request.getContextPath() + "/admin/updateTestSuccess.html");
		else
			response.sendRedirect(request.getContextPath() + "/admin/updateTestFail.html");
	}

}
