function submitTest() {
	var userId = document.getElementsByName("userId")[0].value;
	var userName = document.getElementsByName("userName")[0].value;
	var password = document.getElementsByName("password")[0].value;
	var userType = document.getElementsByName("selectType")[0].value;
	
	
	var regId = /^\d{8}$/;
	var regName = /^[a-zA-Z]{1}[\w\d_]{4,19}$/;
	var regPwd = /^[\w\d]{6,20}$/;
	
	if (userType == 0)
		alert("请选择用户类型!");
	else if (!regId.test(userId))
		alert("请输入8位数用户名!");
	else if (!regName.test(userName))
		alert("请输入5-20位昵称(以字母开头且不含特殊字符)!");
	else if (!regPwd.test(password))
		alert("请输入6-20位密码(不含特殊字符)!");
	else
		document.forms[0].submit();
}

