/**
 * 
 */

function submitTest() {
	var judgeNum = document.getElementsByName("judgeNum")[0].value;
	var judgeScore = document.getElementsByName("judgeScore")[0].value;
	var sinNum = document.getElementsByName("sinNum")[0].value;
	var sinScore = document.getElementsByName("sinScore")[0].value;
	var mulNum = document.getElementsByName("mulNum")[0].value;
	var mulScore = document.getElementsByName("mulScore")[0].value;
	var totalTime = document.getElementsByName("totalTime")[0].value;
	var testTime = document.getElementsByName("testTime")[0].value;
	var reg=/(^[1-9][0-9]$|^[0-9]$|^100$)/;
	
	if (judgeNum=="" || judgeScore=="" || sinNum=="" || sinScore=="" || 
			mulNum=="" || mulScore=="" || totalTime=="" || testTime=="")
		alert("请填写完整!");
	else if ( !(reg.test(judgeNum) && reg.test(judgeScore) && reg.test(sinNum) && reg.test(sinScore)
			&& reg.test(mulNum) && reg.test(mulScore) && reg.test(totalTime) ))
		alert("请输入合法数字(0-100间的整数)")
	else
		document.forms[0].submit();
}