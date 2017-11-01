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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题添加</title>
<script src="<%=path%>/js/questionSet.js"></script>
<script>
	function init() {
		var judgeAns = document.getElementById("judgeAns");
		var sinAns = document.getElementById("sinAns");
		var mulAns = document.getElementById("mulAns");
		var choiceA = document.getElementById("choiceA");
		var choiceB = document.getElementById("choiceB");
		var choiceC = document.getElementById("choiceC");
		var choiceD = document.getElementById("choiceD");
		
		choiceA.style.display = "none";
		choiceB.style.display = "none";
		choiceC.style.display = "none";
		choiceD.style.display = "none";
		judgeAns.style.display = "none";
		sinAns.style.display = "none";
		mulAns.style.display = "none";	
	}
</script>
</head>
<body onload="init()">
<h1>添加试题</h1>
<form action="<%=path%>/AddQuestionServlet" method="post">
<table align="center">
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
	<tr>
		<td>类型:</td>
		<td>
		 <select name="selectType" onchange="setAnswerType()">
		  <option value="0">请选择</option>
		  <option value="1">判断题</option>
		  <option value="2">单选题</option>
		  <option value="3">多选题</option>
		 </select>
		</td>
	</tr>
	<tr>
		<td>题目:</td>
		<td>
		 <textarea name="ques"></textarea>
		</td>
	</tr>
	<tr id="choiceA">
		<td>A:</td>
		<td>
		 <textarea name="KeyA"></textarea>
		</td>
	</tr>
	<tr id="choiceB">
		<td>B:</td>
		<td>
		 <textarea name="KeyB"></textarea>
		</td>
	</tr>
	<tr id="choiceC">
		<td>C:</td>
		<td>
		 <textarea name="KeyC"></textarea>
		</td>
	</tr>
	<tr id="choiceD">
		<td>D:</td>
		<td>
		 <textarea name="KeyD"></textarea>
		</td>
	</tr>
	<tr>
		<td>参考答案</td>
		<td>
		 <div id="judgeAns">
		  <input type="radio" value="yes" name="judgeAns" />正确
		  <input type="radio" value="no" name="judgeAns" />错误
		 </div>
		 <div id="sinAns">
		  <input type="radio" name="sinAns" value="A" />A
		  <input type="radio" name="sinAns" value="B" />B
		  <input type="radio" name="sinAns" value="C" />C
		  <input type="radio" name="sinAns" value="D" />D
		 </div>
		 <div id="mulAns">
		  <input type="checkbox" name="mulAns" value="A" />A
		  <input type="checkbox" name="mulAns" value="B" />B
		  <input type="checkbox" name="mulAns" value="C" />C
		  <input type="checkbox" name="mulAns" value="D" />D
		 </div>
		</td>
	</tr>
	<tr>
		<td>
		 <input type="button" value="提交" onclick="submitQuestion()" />
		</td>
	</tr>
</table>
</form>
</body>
</html>