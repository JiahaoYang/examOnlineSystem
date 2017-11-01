package servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Question;
import entity.TestRecord;
import entity.TestSet;
import util.PaperUtil;
import util.QuestionUtil;
import util.TestRecordUtil;
import util.TestSetUtil;
import util.UserFlagUtil;

/**
 * Servlet implementation class CorrectPaperServlet
 */
@WebServlet(name = "CorrectPaperServlet", urlPatterns = {"/CorrectPaperServlet"})
public class CorrectPaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorrectPaperServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession(true);
		String userId = (String)session.getAttribute("userId");
		String course = (String)session.getAttribute("course");
		String testTime = (String)session.getAttribute("testTime");
		
		Map<Integer,String> answers = new HashMap<>();	//所有试题及对应答案
		QuestionUtil qsUtil = new QuestionUtil();
		List<Question> questions = qsUtil.getAnswers();
		for (Question question : questions)
			answers.put(question.getId(), question.getAnswer());
		
		TestSetUtil tsUtil = new TestSetUtil();
		TestSet testSet = tsUtil.getTestSet(course, testTime);
		ArrayList<TestRecord> records = new ArrayList<>();	//考生答题信息（题号，题目id，分数，考生答案）
		int totalScore = 0;
		
		for (int i = 0; i < testSet.getJudgeCnt(); ++i) {
			TestRecord record = new TestRecord();
			int quesId = Integer.parseInt(request.getParameter("judgeId" + i));
			String stuAns = request.getParameter("judge" + i + "Value");
			stuAns = (stuAns==null ? "" : stuAns);
			
			String ans = answers.get(quesId);
			int score = (ans.equalsIgnoreCase(stuAns) ? testSet.getJudgeScore() : 0);
			System.out.println("quesId: "+ quesId + "stuAns:" + stuAns + "score:" + score);
			
			record.setUserId(userId);
			record.setQuesId(quesId);
			record.setQuesType(1);
			record.setCourse(course);
			record.setQuesNum(i);
			record.setScore(score);
			record.setStuAnswer(stuAns);
			record.setTestTime(testTime);
			
			totalScore += score;
			records.add(record);
		}
		
		for (int i = 0; i < testSet.getSingleCnt(); ++i) {
			TestRecord record = new TestRecord();
			int quesId = Integer.parseInt(request.getParameter("singleId" + i));
			String stuAns = request.getParameter("single" + i + "Value");
			stuAns = (stuAns==null ? "" : stuAns);
			
			String ans = answers.get(quesId);
			int score = (ans.equalsIgnoreCase(stuAns) ? testSet.getSingleScore() : 0);
			System.out.println(quesId + "stuAns:" + stuAns + "score:" + score);
			
			record.setUserId(userId);
			record.setQuesId(quesId);
			record.setQuesType(2);
			record.setCourse(course);
			record.setQuesNum(i);
			record.setScore(score);
			record.setStuAnswer(stuAns);
			record.setTestTime(testTime);
			
			totalScore += score;
			records.add(record);
		}
		
		for (int i = 0; i < testSet.getMulCnt(); ++i) {
			TestRecord record = new TestRecord();
			int quesId = Integer.parseInt(request.getParameter("mutiId" + i));
			String[] paras = request.getParameterValues("muti" + i + "Value");
			String stuAns = "";
			if (paras != null) {
				for (String para : paras)
					stuAns += (para)+" ";
				stuAns = stuAns.substring(0, stuAns.length()-1);
			}

			
			String ans = answers.get(quesId);
			int score = (ans.equalsIgnoreCase(stuAns) ? testSet.getMulScore() : 0);
			System.out.println(quesId + "stuAns:" + stuAns + "score:" + score);
			
			record.setUserId(userId);
			record.setQuesId(quesId);
			record.setQuesType(3);
			record.setCourse(course);
			record.setQuesNum(i);
			record.setScore(score);
			record.setStuAnswer(stuAns);
			record.setTestTime(testTime);
			
			totalScore += score;
			records.add(record);
		}
		
		TestRecordUtil trUtil = new TestRecordUtil();
		PaperUtil paperUtil = new PaperUtil();
		
		boolean success = trUtil.insertRecord(records) && paperUtil.createPaper(userId, course, totalScore);
		if (success) {
			new UserFlagUtil().setUserFlag(userId, course, testTime);
			response.sendRedirect(request.getContextPath() + "/student/finish.jsp");
		}
		else {
			response.sendRedirect(request.getContextPath() + "/student/fail.html");
		}
	}

}
