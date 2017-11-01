<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, entity.*, servlet.*, util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
						request.getServerPort() + path + "/";
	TestSetUtil tsUtil = new TestSetUtil();
	ArrayList<TestSet> tests = tsUtil.getAllTests();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-考试管理</title>
<script>
	function confirmDelete(course, testTime) {
		var okey = confirm("确认删除本场考试?");
		if (okey)
			window.location.href = "<%=path%>/admin/deleteTest.jsp?" + 
				"course=" + course + "&testTime=" + testTime;	
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td rowspan="2">课程</td>
			<td colspan="2">判断题</td>
			<td colspan="2">单选题</td>
			<td colspan="2">多选题</td>
			<td rowspan="2">总分</td>
			<td rowspan="2">考试时间(/分钟)</td>
			<td rowspan="2">考试日期</td>
			<td rowspan="2">操作</td>
		</tr>
		
		<tr>
			<td>数量</td>
			<td>分值</td>
			<td>数量</td>
			<td>分值</td>
			<td>数量</td>
			<td>分值</td>
		</tr>
		
	<%
		for (TestSet test : tests) {
	%>
		<tr>
			<td><%=test.getCourse()%></td>
			<td><%=test.getJudgeCnt()%></td>
			<td><%=test.getJudgeScore()%></td>
			<td><%=test.getSingleCnt()%></td>
			<td><%=test.getSingleScore()%></td>
			<td><%=test.getMulCnt()%></td>
			<td><%=test.getMulScore()%></td>
			<td><%=tsUtil.getTotalScore(test)%></td>
			<td><%=test.getTotalTime()%></td>
			<td><%=test.getTestTime()%></td>
			<td><a href="<%=path%>/admin/modifyTest.jsp?
			course=<%=test.getCourse()%>&testTime=<%=test.getTestTime()%>">修改</a></td>
			<td><input type="button" name="deleteTest" 
			onclick="confirmDelete('<%=test.getCourse()%>', '<%=test.getTestTime()%>')" value="删除"></td>
		</tr>
	<%
		}
	%>
		<tr>
			<td><a href="<%=path%>/admin/addTest.jsp">添加考试</a></td>
		</tr>
		<tr>
			<td><a href="<%=path%>/admin/main.jsp">返回</a></td>
		</tr>
	</table>
</body>
</html>