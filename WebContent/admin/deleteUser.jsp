<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String userId = request.getParameter("userId").trim();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除用户</title>
</head>
<body>
<%
	UserUtil userUtil = new UserUtil();
	boolean success = userUtil.deleteUser(userId);
	if (success) {
%>
	<script>
		alert("删除成功!");
		window.location.href = "<%=path%>/admin/userMangement.jsp";
	</script>
<%
	}
	else {
%>
	<script>
		alert("删除失败!");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>