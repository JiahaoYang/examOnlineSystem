<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加</title>
<script src="<%=path%>/js/user.js"></script>
</head>
<body>
<h1>添加用户信息</h1>
<form action="<%=path%>/AddUserServlet" method="post">
<table>
	<tr id="userType">
		<td colspan="2">类型:</td>
		<td><select name="selectType">
			<option value=0>请选择</option>
			<option value=1>管理员</option>
			<option value=2>教师</option>
			<option value=3>学生</option>
		</select></td>
	</tr>
	<tr id="userId">
		<td colspan="2">用户名:</td>
		<td><input type="text" name="userId"></td>
	</tr>
	<tr id="userName">
		<td colspan="2">昵称:</td>
		<td><input type="text" name="userName"></td>
	</tr>
	<tr id="password">
		<td colspan="2">密码:</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td>
		 <input type="button" value="提交" onclick="submitTest()" />
		</td>
	</tr>
</table>
</form>
</body>
</html>