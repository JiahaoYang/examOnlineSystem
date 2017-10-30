<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	TestSetUtil tsUtil = new TestSetUtil();
	ArrayList<String> courses = tsUtil.getCourses();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试信息添加</title>
<script src="<%=path%>/js/testSet.js"></script>
<script src="<%=path%>/js/questionSet.js"></script>
</head>
<body onload="judgeCourse()">
<h1>添加考试信息</h1>
<form action="<%=path%>/AddTestServlet" method="post">
<table>
	<tr>
		<td>科目:</td>
		<td>
		 <input type="radio" name="course" value="1" checked="checked" onchange="judgeCourse()"/>
		 <select name="selectCourse">
		  <option value="0">请选择</option>
		  <%
		  	for (String course : courses) {
		  %>
		  <option value="<%=course%>"><%=course%></option>
		  <%}%>
		 </select>
		 <input type="radio" name="course" value="2" onchange="judgeCourse()"/>新建
		 <input type="text" name="createCourse">
		</td>
	</tr>
	<tr id="judgeNum">
		<td colspan="2">判断题:</td>
		<td>数量</td>
		<td><input type="number" name="judgeNum"></td>
		<td>分值</td>
		<td><input type="number" name="judgeScore"></td>
	</tr>
	<tr id="sinChoice">
		<td colspan="2">单选题:</td>
		<td>数量</td>
		<td><input type="number" name="sinNum"></td>
		<td>分值</td>
		<td><input type="number" name="sinScore"></td>
	</tr>
	<tr id="mulChoice">
		<td colspan="2">多选题:</td>
		<td>数量</td>
		<td><input type="number" name="mulNum"></td>
		<td>分值</td>
		<td><input type="number" name="mulScore"></td>
	</tr>
	<tr id="totalTime">
		<td colspan="2">考试时间(/分钟):</td>
		<td><input type="number" name="totalTime"></td>
	</tr>
	<tr id="testTime">
		<td colspan="2">考试日期:</td>
		<td><input type="date" name="testTime"></td>
	</tr>
	<tr>
		<td>
		 <input type="button" value="提交" onclick="submitTest()" />
		</td>
	</tr>
</table>
</form>
</body>
</html>