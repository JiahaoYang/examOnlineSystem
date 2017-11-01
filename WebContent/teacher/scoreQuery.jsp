<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String course = request.getParameter("course").trim();
	PaperUtil paperUtil = new PaperUtil();
	ArrayList<Paper> papers = paperUtil.getPapers(course);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师平台-分数查询</title>
</head>
<body>
	<table>
		<tr>
			<td>当前科目:</td>
			<td><%=course%></td>
		</tr>
		<tr>
			<td>学号</td>
			<td>姓名</td>
			<td>分数</td>
		</tr>
	<%
		UserUtil userUtil = new UserUtil();
		for (Paper paper : papers) {
			User user = userUtil.getUser(paper.getUserId());
	%>
		<tr>
			<td><%=user.getId()%></td>
			<td><%=user.getName()%></td>
			<td><%=paper.getScore()%></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>