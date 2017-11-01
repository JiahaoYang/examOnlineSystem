<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String stuId = request.getParameter("stuId").trim();
	String course = (String)session.getAttribute("course");
	String testTime = request.getParameter("testTime").trim();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserFlagUtil ufUtil = new UserFlagUtil();
	boolean success = ufUtil.arrangeExam(stuId, course, testTime);
	if (success) {
%>
	<script>
		alert("安排成功!");
		window.location.href = "<%=path%>/teacher/arrangeExam.jsp";
	</script>
<%
	}
	else {
%>
	<script>
		alert("安排失败!");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>