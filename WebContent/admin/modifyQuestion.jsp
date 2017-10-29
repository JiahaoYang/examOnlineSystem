<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	String quesId = request.getParameter("quesId");
	int id = -1;
	if (quesId != null)
		id = Integer.parseInt(quesId);
	TestSetUtil tsUtil = new TestSetUtil();
	ArrayList<String> courses = tsUtil.getCourses();
	QuestionUtil qsUtil = new QuestionUtil();
	Question question = qsUtil.getQuestionById(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题修改</title>
<script src="<%=path%>/js/questionSet.js"></script>
<script>
	function init() {
		setCourse();
		setType();
		setAnswer();
		judgeCourse();
		setAnswerType();
	}
	function setCourse() {
		var subject = document.getElementsByName("selectCourse")[0];
		var course = "<%=question.getCourse()%>";
		for (var i = 0; i < subject.options.length; ++i) 
			if (subject.options[i].value == course)
				subject.options[i].selected = true;
	}
	function setType() {
		var tagType = document.getElementsByName("selectType")[0];
		var type = "<%=question.getType()%>";
		for (var i = 0; i < tagType.options.length; ++i) 
			if (tagType.options[i].value == type)
				tagType.options[i].selected = true;
	}
	function setAnswer() {
		var answer = "<%=question.getAnswer().trim()%>";
		var type = document.getElementsByName("selectType")[0];
		var judgeAns = document.getElementsByName("judgeAns");
		var sinAns = document.getElementsByName("sinAns");
		var mulAns = document.getElementsByName("mulAns");
		
		if (type.selectedIndex == 1) {
			for (var i = 0; i < judgeAns.length; ++i)
				if (judgeAns[i].value == answer)
					judgeAns[i].checked = true;
		}
		else if (type.selectedIndex == 2) {
			for (var i = 0; i < sinAns.length; ++i)
				if (sinAns[i].value == answer)
					sinAns[i].checked = true;
		}
		else if (type.selectedIndex == 3) {
			var strAns = answer.split(" ");
			document.write(strAns);
			for (var i = 0; i < mulAns.length; ++i)
				for (var j = 0; j < strAns.length; ++j)
					if (mulAns[i].value == strAns[j])
						mulAns[i].checked = true;
		}
	}
</script>
</head>
<body onload="init()">
<h1>修改试题</h1>
<form action="<%=path%>/UpdateQuestionServlet" method="post">
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
		 <textarea name="ques"><%=question.getQues().trim()%></textarea>
		</td>
	</tr>
	<tr id="choiceA">
		<td>A:</td>
		<td>
		 <textarea name="KeyA"><%=question.getKeyA()==null ? "" : question.getKeyA().trim()%></textarea>
		</td>
	</tr>
	<tr id="choiceB">
		<td>B:</td>
		<td>
		 <textarea name="KeyB"><%=question.getKeyB()==null ? "" : question.getKeyB().trim()%></textarea>
		</td>
	</tr>
	<tr id="choiceC">
		<td>C:</td>
		<td>
		 <textarea name="KeyC"><%=question.getKeyC()==null ? "" : question.getKeyC().trim()%></textarea>
		</td>
	</tr>
	<tr id="choiceD">
		<td>D:</td>
		<td>
		 <textarea name="KeyD"><%=question.getKeyD()==null ? "" : question.getKeyD().trim()%></textarea>
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
		 <input type="button" value="修改" onclick="isSubmit()" />
		 <input type="hidden" value="<%=question.getId()%>" name="hiddenQuesId" />
		</td>
	</tr>
</table>
</form>
</body>
</html>