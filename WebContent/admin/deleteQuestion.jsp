<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String quesId = request.getParameter("quesId").trim();
	int id = -1;
	if (quesId != null)
		id = Integer.parseInt(quesId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除试题</title>
</head>
<body>
<%
	QuestionUtil qsUtil = new QuestionUtil();
	boolean success = qsUtil.deleteQuestion(id);
	if (success) {
%>
	<script>
		alert("删除成功!");
		window.location.href = "<%=path%>/admin/questionMangement.jsp";
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