/**
 * 
 */
function judgeCourse() {
	var choices = document.getElementsByName("course");
	if (choices[0].checked == true) {
		document.getElementsByName("selectCourse")[0].disabled = false;
		document.getElementsByName("createCourse")[0].disabled = true;
	}
	else {
		document.getElementsByName("selectCourse")[0].disabled = true;
		document.getElementsByName("createCourse")[0].disabled = false;
	}
}

function setAnswerType() {
	var type = document.getElementsByName("selectType")[0];
	var judgeAns = document.getElementById("judgeAns");
	var sinAns = document.getElementById("sinAns");
	var mulAns = document.getElementById("mulAns");
	var choiceA = document.getElementById("choiceA");
	var choiceB = document.getElementById("choiceB");
	var choiceC = document.getElementById("choiceC");
	var choiceD = document.getElementById("choiceD");
	
	if (type.selectedIndex == 1) {
		choiceA.style.display = "none";
		choiceB.style.display = "none";
		choiceC.style.display = "none";
		choiceD.style.display = "none";
		judgeAns.style.display = "block";
		sinAns.style.display = "none";
		mulAns.style.display = "none";
	}
	else if (type.selectedIndex == 2) {
		choiceA.style.display = "block";
		choiceB.style.display = "block";
		choiceC.style.display = "block";
		choiceD.style.display = "block";
		judgeAns.style.display = "none";
		sinAns.style.display = "block";
		mulAns.style.display = "none";	
	}
	else if (type.selectedIndex == 3) {
		choiceA.style.display = "block";
		choiceB.style.display = "block";
		choiceC.style.display = "block";
		choiceD.style.display = "block";
		judgeAns.style.display = "none";
		sinAns.style.display = "none";
		mulAns.style.display = "block";	
	}
	else {
		choiceA.style.display = "none";
		choiceB.style.display = "none";
		choiceC.style.display = "none";
		choiceD.style.display = "none";
		judgeAns.style.display = "none";
		sinAns.style.display = "none";
		mulAns.style.display = "none";		
	}
}

function isSubmit() {
	var choices = document.getElementsByName("course");
	var course = "";
	if (choices[0].checked == true)
		course = "selectCourse";
	else
		course = "createCourse";
	var tagCourse = document.getElementsByName(course)[0];
	var type = document.getElementsByName("selectType")[0];
	var ques = document.getElementsByName("ques")[0];
	var answer = "";
	if (type.selectedIndex == 1) {
		var ansChoice = document.getElementsByName("judgeAns");
		for (var i = 0; i < ansChoice.length; ++i)
			if (ansChoice[i].checked == true)
				answer += ansChoice[i].value;
	}
	else if (type.selectedIndex == 2) {
		var ansChoice = document.getElementsByName("sinAns");
		for (var i = 0; i < ansChoice.length; ++i)
			if (ansChoice[i].checked == true)
				answer += ansChoice[i].value;	
	}
	else if (type.selectedIndex == 3) {
		var ansChoice = document.getElementsByName("mulAns");
		for (var i = 0; i < ansChoice.length; ++i)
			if (ansChoice[i].checked == true)
				answer += ansChoice[i].value;
	}
	
	if (tagCourse.value == "" || tagCourse.value == "0")
		alert("请输入科目!");
	else if (type.value == "" || type.value == "0")
		alert("请输入题目类型!");
	else if (ques.value == "")
		alert("请输入题干!");
	else if (answer == "")
		alert("请输入参考答案!");
	else {
		var okey = confirm("确认提交?");
		if (okey)
			document.forms[0].submit();
	}
}