<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	UserUtil userUtil = new UserUtil();
	ArrayList<User> admins = userUtil.getAdmins();
	ArrayList<User> teachers = userUtil.getTeachers();
	ArrayList<User> students = userUtil.getStudents();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-用户管理</title>
<script src="<%=path%>/js/user.js"></script>
<script>
	function confirmDelete(userId) {
		var okey = confirm("确认删除此用户?");
		if (okey)
			window.location.href = "<%=path%>/admin/deleteUser.jsp?userId=" + userId;	
	}
	
	function display() {
		var type = document.getElementsByName("selectType")[0].value;
		var adminClass = document.getElementsByClassName("admins");
		var teacherClass = document.getElementsByClassName("teachers");
		var stuClass = document.getElementsByClassName("students");
		
		if (type == "0") {
			for (var i = 0; i < adminClass.length; ++i)
				adminClass[i].style.display = "block";
			for (var i = 0; i < teacherClass.length; ++i)
				teacherClass[i].style.display = "block";
			for (var i = 0; i < stuClass.length; ++i)
				stuClass[i].style.display = "block";
		}
		else if (type == "1") {
			for (var i = 0; i < adminClass.length; ++i)
				adminClass[i].style.display = "block";
			for (var i = 0; i < teacherClass.length; ++i)
				teacherClass[i].style.display = "none";
			for (var i = 0; i < stuClass.length; ++i)
				stuClass[i].style.display = "none";
		}
		else if (type == "2") {
			for (var i = 0; i < adminClass.length; ++i)
				adminClass[i].style.display = "none";
			for (var i = 0; i < teacherClass.length; ++i)
				teacherClass[i].style.display = "block";
			for (var i = 0; i < stuClass.length; ++i)
				stuClass[i].style.display = "none";
		}
		else if (type == "3") {
			for (var i = 0; i < adminClass.length; ++i)
				adminClass[i].style.display = "none";
			for (var i = 0; i < teacherClass.length; ++i)
				teacherClass[i].style.display = "none";
			for (var i = 0; i < stuClass.length; ++i)
				stuClass[i].style.display = "block";
		}
	}

</script>
</head>
<body>
	<table>
		<tr>
			<td><select name="selectType" onchange="display()">
				<option value="0">全部</option>
				<option value="1">管理员</option>
				<option value="2">教师</option>
				<option value="3">学生</option>
			</select></td>
		</tr>
		
	<%
		for (User user : admins) {
	%>
		<tr class="admins">
			<td><%=user.getId()%></td>
			<td><%=user.getName()%></td>
			<td><%=CommUtil.getUserType(user.getType())%></td>
			<td><input type="button" name="deleteUser" 
			onclick="confirmDelete('<%=user.getId()%>')" value="删除"></td>
		</tr>
	<%
		}
	%>
	
	<%
		for (User user : teachers) {
	%>
		<tr class="teachers">
			<td><%=user.getId()%></td>
			<td><%=user.getName()%></td>
			<td><%=CommUtil.getUserType(user.getType())%></td>
			<td><input type="button" name="deleteUser" 
			onclick="confirmDelete('<%=user.getId()%>')" value="删除"></td>
		</tr>
	<%
		}
	%>
	
	<%
		for (User user : students) {
	%>
		<tr class="students">
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