<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	TestSetUtil ts = new TestSetUtil();
	ArrayList<String> courses = ts.getCourses();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>在线考试-学生登陆</title>
	<script type="text/javascript">
		function check() {
			var username = document.forms[0].userId.value;
			var password = document.forms[0].password.value;
			var course = document.forms[0].course.value;
			if (username == "") {
				alert("请输入学号!");
			}
			else if (password == "") {
				alert("请输入密码!");
			}
			else if (course == "0") {
				alert("请选择课程!");
			}
			else {
				document.forms[0].submit();
			}
		}
	</script>
</head>
<body>
	<form action="<%=path %>/LoginServlet" method="post">
	<table id="loginTable">
	<tbody>
		<tr>
			<td>学号：</td>
			<td><input type="text" name="userId" id="userId" /></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password" id="password" /></td>
		</tr>
		<tr>
			<td>科目：</td>
			<td><select name="course" id="course">
				<option value="0">请选择</option>
				<%
					for (String course : courses) {
				%>
				<option value="<%=course%>"><%=course%></option>
				<%	} %>
			</select></td>
		</tr>
		<tr>
			<td><input type="button" value="登陆" onclick="check()"></td>
		</tr>
	</tbody>
	</table>
	</form>
	
	<%
		String flag = request.getParameter("flag");
		if ("submit".equals(flag)) {
	%>
	<script>
		alert("试卷已提交，无法再次考试！");
	</script>
	<%
		}
		else if ("noStuExamInfo".equals(flag)) {
	%>
	<script>
		alert("未参与本场考试！");
	</script>
	<%
		}
		else if ("noExam".equals(flag)) {
	%>
	<script>
		alert("今日无此考试！");
	</script>
	<%
		}
		else if ("nobody".equals(flag)) {
	%>
	<script>
		alert("无考生相关信息！");
	</script>
	<%
		}
		else if ("error".equals(flag)) {
	%>
	<script>
		alert("密码错误！");
	</script>
	<%
		}
	%>
</body>
</html>