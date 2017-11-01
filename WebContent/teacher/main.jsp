<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String adminId = (String)session.getAttribute("teacherId");
	String course = (String)session.getAttribute("course");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-教师平台</title>

</head>
<body>
	<h1>在线考试系统教师平台</h1>
	<div class="head">
	<table>
		<tr>
			<td> <a href="scoreQuery.jsp?course=<%=course%>" target="_blank">分数查询</a></td>
		</tr>
		<tr>
			<td> <a href="arrangeExam.jsp?course=<%=course%>" target="_blank">安排考试</a></td>
		</tr>
	</table>
	</div>
	
</body>
</html>