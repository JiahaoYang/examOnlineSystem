<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, util.*, servlet.*, entity.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
						request.getServerPort() + path + "/";
	String userId = (String)session.getAttribute("userId");
	String course = (String)session.getAttribute("course");
	String testTime = (String)session.getAttribute("testTime");
	String userName = (String)session.getAttribute("userName");
	
	if (userId != null && course != null) {
		TestSetUtil tsUtil = new TestSetUtil();
		TestSet testSet = tsUtil.getTestSet(course.trim(), testTime.trim());
		ArrayList<Question> questions = new ArrayList<>();
		QuestionUtil qsUtil = new QuestionUtil();
		Question question = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	var time = <%=testSet.getTotalTime()%>*60;
	var show;
	
	function start() {
		show = setInterval(setTime, 1000);
	}
	
	function setTime() {
		var h = parseInt(time/3600);
		if (h < 10)
			h = "0" + h;
		else
			h += "";
		var m = parseInt(time%3600/60);
		if (m < 10)
			m = "0" + m;
		else
			m += "";
		var s = time%3600%60;
		if (s < 10)
			s = "0" + s;
		else
			s += "";
		if (time == 0)
			timeOut();
		else {
			time--;
			document.getElementById("timeSpan").innerHTML = h + ":" + m + ":" + s;
		}
		
		function timeOut() {
			clearInterval(show);
			document.forms[0].submit();
		}
		
		function submit() {
			var okey = confirm("确认交卷?");
			if (okey)
				document.forms[0].submit();
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线测试</title>
</head>
<body onload="start()">
	<h1>科目:<%=course%></h1>
	<div class="head">
		<span><strong>学号:</strong><%=userId%></span>
		<span><strong>考生姓名:</strong><%=userName%></span>
		<span><strong>考试日期:</strong><%=testTime%></span>
		<span><strong>考试剩余时间:</strong></span>
		<span id="timeSpan"></span>
	</div>
	<form action="<%=path%>/CorrectPaperServlet" method="post">
	<div class="main">
	<%
		int typeCnt = 1;
		if (testSet.getJudgeCnt() > 0) {
	%>
		<div class="judge">
		<strong><%=CommUtil.getTypeCnt(typeCnt)%>.判断题</strong>
		(共<%=testSet.getJudgeCnt()%>题，每题<%=testSet.getJudgeScore()%>分)
	<% 
		questions = qsUtil.getQuestionsByType(course, testSet.getJudgeCnt(), 1);
		for (int i = 0; i < questions.size(); ++i) {
			question = questions.get(i);
	%>
		<div>
		<%=(i+1)%>.<%=question.getQues().trim()%>
		</div>
		<input type="radio" name="judge<%=i%>Value" value="yes">正确<br />
		<input type="radio" name="judge<%=i%>Value" value="no">错误<br />
		<input type="hidden" name="judgeId<%=i%>" value="<%=question.getId()%>" />
		</div>
	<%
		}
		typeCnt++;
	%>
	</div>
	<%
		}
	%>
	
	
	
	<%
		if (testSet.getSingleCnt() > 0) {
	%>
		<div class="single">
		<strong><%=CommUtil.getTypeCnt(typeCnt)%>.单选题</strong>
		(共<%=testSet.getSingleCnt()%>题，每题<%=testSet.getMulScore()%>分)
	<% 
		questions = qsUtil.getQuestionsByType(course, testSet.getSingleCnt(), 2);
		for (int i = 0; i < questions.size(); ++i) {
			question = questions.get(i);
	%>
		<div>
		<%=(i+1)%>.<%=question.getQues().trim()%>
		</div>
		<input type="radio" name="single<%=i%>Value" value="A">A.
		<%=question.getKeyA()==null?"":question.getKeyA().trim()%><br/>
		<input type="radio" name="single<%=i%>Value" value="B">B.
		<%=question.getKeyB()==null?"":question.getKeyB().trim()%><br/>
		<input type="radio" name="single<%=i%>Value" value="C">C.
		<%=question.getKeyC()==null?"":question.getKeyC().trim()%><br/>
		<input type="radio" name="single<%=i%>Value" value="D">D.
		<%=question.getKeyD()==null?"":question.getKeyD().trim()%><br/>
		<input type="hidden" name="singleId<%=i%>" value="<%=question.getId()%>" />
	<%
		}
		typeCnt++;
	%>
	</div>
	<%
		}
	%>
	
	
	<%
		if (testSet.getMulCnt() > 0) {
	%>
		<div class="muti">
		<strong><%=CommUtil.getTypeCnt(typeCnt)%>.多选题</strong>
		(共<%=testSet.getMulCnt()%>题，每题<%=testSet.getMulScore()%>分)
	<% 
		questions = qsUtil.getQuestionsByType(course, testSet.getMulCnt(), 3);
		for (int i = 0; i < questions.size(); ++i) {
			question = questions.get(i);
	%>
		<div>
		<%=(i+1)%>.<%=question.getQues().trim()%>
		</div>
		<input type="checkbox" name="muti<%=i%>Value" value="A">A.
		<%=question.getKeyA()==null?"":question.getKeyA().trim()%><br/>
		<input type="checkbox" name="muti<%=i%>Value" value="B">B.
		<%=question.getKeyB()==null?"":question.getKeyB().trim()%><br/>
		<input type="checkbox" name="muti<%=i%>Value" value="C">C.
		<%=question.getKeyC()==null?"":question.getKeyC().trim()%><br/>
		<input type="checkbox" name="muti<%=i%>Value" value="D">D.
		<%=question.getKeyD()==null?"":question.getKeyD().trim()%><br/>
		<input type="hidden" name="mutiId<%=i%>" value="<%=question.getId()%>" />
	<%
		}
		typeCnt++;
	%>
	</div>
	<%
		}
	%>
	<input type="button" value="交卷" onclick="submit()">
	</form>
</body>
</html>

<%
	}
	else
		response.sendRedirect(path+"/student/login.jsp");
%>