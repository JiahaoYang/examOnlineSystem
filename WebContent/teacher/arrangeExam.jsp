<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String course = (String)session.getAttribute("course");
	UserUtil userUtil = new UserUtil();
	ArrayList<User> students = userUtil.getStudents();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师平台-安排考试</title>
<script>
	function arrangeExam(stuId) {
		var testTime = document.getElementsByName("testTime")[0].value;
		if (testTime == "")
			alert("请选择考试时间!");
		else {
			var okey = confirm("确认安排考试?");
			if (okey)
				window.location.href = "<%=path%>/teacher/addUserFlag.jsp?" + 
						"stuId=" + stuId + "&testTime=" + testTime;
		}
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td>科目:</td>
			<td><%=course%></td>
		</tr>
		<tr>
			<td>考试时间:</td>
			<td><input type="date" name="testTime"></td>
		</tr>
		<tr>
			<td>学号</td>
			<td>姓名</td>
			<td>安排考试</td>
		</tr>
		
	<%
		for (User student : students) {
	%>
		<tr>
			<td><%=student.getId()%></td>
			<td><%=student.getName()%></td>
			<td><input type="button" name="arrangeExam" 
			onclick="arrangeExam('<%=student.getId()%>')" value="安排考试"></td>
		</tr>
	<%
		}
	%>
	
		<tr>
			<td><a href="<%=path%>/teacher/main.jsp">返回</a></td>
		</tr>
	</table>
</body>
</html>