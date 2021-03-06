<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String c = request.getParameter("course").trim();
	String testTime = request.getParameter("testTime").trim();

	TestSetUtil tsUtil = new TestSetUtil();
	ArrayList<String> courses = tsUtil.getCourses();
	TestSet test = tsUtil.getTestSet(c, testTime);
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试修改</title>
<script src="<%=path%>/js/testSet.js"></script>
<script>
	function setCourse() {
		var subject = document.getElementsByName("selectCourse")[0];
		var course = "<%=test.getCourse()%>";
		for (var i = 0; i < subject.options.length; ++i) 
			if (subject.options[i].value == course)
				subject.options[i].selected = true;
		subject.disabled = true;
	}
</script>
</head>
<body onload="setCourse()">
<h1>考试信息修改</h1>
<form action="<%=path%>/UpdateTestServlet" method="post">
<table>
	<tr>
		<td>科目:</td>
		<td>
		 <input type="radio" name="course" value="1" checked="checked"/>
		 <select name="selectCourse">
		  <option value="0">请选择</option>
		  <%
		  	for (String course : courses) {
		  %>
		  <option value="<%=course%>"><%=course%></option>
		  <%}%>
		 </select>
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
		 <input type="button" value="修改" onclick="submitTest()" />
		 <input type="hidden" value="<%=c%>" name="hiddenCourse" />
		</td>
	</tr>
</table>
</form>
</body>
</html>