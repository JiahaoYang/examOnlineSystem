<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String adminId = (String)session.getAttribute("adminId");
	UserUtil userUtil = new UserUtil();
	User admin = userUtil.getUser(adminId);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-后台管理</title>
<script>
	function showTime() {
		var time = new Date();
		var timeString = time.toLocaleString();
		document.getElementById("timeSpan").innerHTML = timeString;
	}
</script>
</head>
<body onload="setInterval(showTime, 1000)">
	<h1>在线考试系统后台管理中心</h1>
	<div class="head">
	<table>
		<tr>
			<td>你好,<%=admin.getName()%></td>
			<td> 北京时间:<span id="timeSpan"></span></td>
		</tr>
		<tr>
			<td> <a href="questionMangement.jsp" target="_blank">试题管理</a></td>
		</tr>
		<tr>
			<td> <a href="testMangement.jsp" target="_blank">考试设置</a></td>
		</tr>
		<tr>
			<td> <a href="userMangement.jsp" target="_blank">用户设置</a></td>
		</tr>
	</table>
	</div>
	
</body>
</html>