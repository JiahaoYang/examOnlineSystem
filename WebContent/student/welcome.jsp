<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, util.*, servlet.*, entity.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
						request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统</title>
<script>
	function start() {
		var okey = confirm("确定开始考试？");
		if (okey) {
			window.location.href = "<%=request.getContextPath()%>/student/test.jsp";
		}
	}
</script>

</head>
<body>
	<h1>在线考试系统</h1>
	<%
		String userId = (String)session.getAttribute("userId");
		String course = (String)session.getAttribute("course");
		String testTime = (String)session.getAttribute("testTime");
		
		UserUtil userUtil = new UserUtil();
		TestSetUtil tsUtil = new TestSetUtil();
		User user = userUtil.getUser(userId);
		TestSet testSet = tsUtil.getTestSet(course, testTime);
		System.out.println(testSet);
		
		if (user != null && testSet != null) {
			session.setAttribute("userName", user.getName());
	%>
		<table>
		<tbody>
			<tr><td> 个人信息: </td></tr>
			<tr><td> 学号:<%=userId %> </td></tr>
			<tr><td> 姓名:<%=user.getName()%> </td></tr>
			<tr><td> <a href="./login.jsp" >返回</a> </td></tr>
			<tr><td> 考试信息 : </td></tr>
			<tr><td> 科目:<%=course %> </td></tr>
			<tr><td> 考试时间:<%=testSet.getTotalTime() %>分钟 </td></tr>
			<tr><td> 考试日期:<%=testSet.getTestTime() %></td></tr>
			<tr><td> 考题类型:(满分<%=tsUtil.getTotalScore(testSet)%>)</td></tr>
			<%
				int cnt = 0;
				if (testSet.getJudgeCnt() != 0) {
			%>
			<tr><td>
			<%=++cnt%> 判断:共<%=testSet.getJudgeCnt()%>题,每题<%=testSet.getJudgeScore()%>分
			</td></tr>
			<%
				}
				if (testSet.getSingleCnt() != 0) {
			%>
			<tr><td>
			<%=++cnt%> 单选:共<%=testSet.getSingleCnt()%>题,每题<%=testSet.getSingleScore()%>分
			</td></tr>
			<%
				}
				if (testSet.getMulCnt() != 0) {
			%>
			<tr><td>
			<%=++cnt%> 多选:共<%=testSet.getMulCnt()%>题,每题<%=testSet.getMulScore()%>分
			</td></tr>
			<%
				}
			%>
			<tr><td>
			<input type="button" name="isStart" value="开始考试" onclick="start()">
			</td></tr>
		</tbody>
		</table>
	<%
		}
		else
			response.sendRedirect(path + "/student/login.jsp");
	%>
</body>
</html>