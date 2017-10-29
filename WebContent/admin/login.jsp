<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>在线考试系统-管理员登录</title>
	<script type="text/javascript">
		function check() {
			var username = document.forms[0].adminId.value;
			var password = document.forms[0].password.value;
			if (username == "") {
				alert("请输入工号!");
			}
			else if (password == "") {
				alert("请输入密码!");
			}
			else {
				document.forms[0].submit();
			}
		}
	</script>
</head>
<body>
	<form action="<%=path%>/AdminLoginServlet" method="post">
	<table id="loginTable">
	<tbody>
		<tr>
			<td>工号：</td>
			<td><input type="text" name="adminId" id="adminId" /></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password" id="password" /></td>
		</tr>
		<tr>
			<td><input type="button" value="登陆" onclick="check()"></td>
		</tr>
	</tbody>
	</table>
	</form>
	
	<%
		String flag = request.getParameter("flag");
		if (flag != null && flag.equals("error")) {
	%>
	<script>
		alert("用户名或密码错误!");
	</script>
	<% } %>

</body>
</html>