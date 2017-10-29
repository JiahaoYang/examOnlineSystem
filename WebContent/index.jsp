<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试管理系统</title>
</head>
<body>
<div align="center">
	<table>
	<tr>
		<td>
		<a href="<%=path%>/student/login.jsp">学生登录</a>
		</td>
	</tr>
	<tr>
		<td>
		<a href="<%=path%>/teacher/login.jsp">教师登录</a>
		</td>
	</tr>
	<tr>
		<td>
		<a href="<%=path%>/admin/login.jsp">管理员登录</a>
		</td>
	</tr>
	</table>
</div>
</body>
</html>