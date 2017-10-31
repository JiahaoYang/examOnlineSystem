<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	UserUtil userUtil = new UserUtil();
	ArrayList<User> users = userUtil.getAllUsers();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-用户管理</title>
<script>
	function confirmDelete(userId) {
		var okey = confirm("确认删除此用户?");
		if (okey)
			window.location.href = "<%=path%>/admin/deleteUser.jsp?userId=" + userId;
			
	}
</script>
</head>
<body>
	<table>
		<tr>

			<td>用户名</td>
			<td>昵称</td>
			<td>类别</td>
		</tr>
		
		
	<%
		for (User user : users) {
	%>
		<tr>
			<td><%=user.getId()%></td>
			<td><%=user.getName()%></td>
			<td><%=CommUtil.getUserType(user.getType())%></td>
			<td><input type="button" name="deleteUser" 
			onclick="confirmDelete('<%=user.getId()%>')" value="删除"></td>
		</tr>
	<%
		}
	%>
		<tr>
			<td><a href="<%=path%>/admin/addUser.jsp">添加用户</a></td>
		</tr>
		<tr>
			<td><a href="<%=path%>/admin/main.jsp">返回</a></td>
		</tr>
	</table>
</body>
</html>