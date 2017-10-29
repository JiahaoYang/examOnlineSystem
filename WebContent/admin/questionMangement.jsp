<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	QuestionUtil qsUtil = new QuestionUtil();
	ArrayList<Question> questions = qsUtil.getAllQuestions();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-试题管理</title>
</head>
<body>
	<table>
		<tr>
			<td>课程</td>
			<td>试题类型</td>
			<td>题目</td>
			<td>选项A</td>
			<td>选项B</td>
			<td>选项C</td>
			<td>选项D</td>
			<td>参考答案</td>
			<td>操作</td>
		</tr>
	<%
		for (Question question : questions) {
			int type = question.getType();
			String strType = CommUtil.getStrType(type);
		
	%>
		<tr>
			<td><%=question.getCourse()%></td>
			<td><%=strType%></td>
			<td title="<%=question.getQues()%>"><%=question.getQues()==null ? "" :
				CommUtil.getSubString(question.getQues(), 10) %></td>
			<td title="<%=question.getKeyA()%>"><%=question.getKeyA()==null ? "" :
				CommUtil.getSubString(question.getKeyA(), 10) %></td>
			<td title="<%=question.getKeyB()%>"><%=question.getKeyB()==null ? "" :
				CommUtil.getSubString(question.getKeyB(), 10) %></td>
			<td title="<%=question.getKeyC()%>"><%=question.getKeyC()==null ? "" :
				CommUtil.getSubString(question.getKeyC(), 10) %></td>
			<td title="<%=question.getKeyD()%>"><%=question.getKeyD()==null ? "" :
				CommUtil.getSubString(question.getKeyD(), 10) %></td>
			<td title="<%=question.getAnswer()%>"><%=question.getAnswer()==null ? "" :
				CommUtil.getSubString(question.getAnswer(), 10) %></td>
			<td><a href="<%=path%>/admin/modifyQuestion.jsp?quesId=<%=question.getId()%>">修改</a></td>
			<td><a href="<%=path%>/admin/deleteQuestion.jsp?quesId=<%=question.getId()%>">删除</a></td>
		</tr>
	<%
		}
	%>
		<tr>
			<td><a href="<%=path%>/addQuestion.jsp">添加试题</a></td>
		</tr>
	</table>
</body>
</html>