<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<script>
		function checkForm() {
			var adminId = document.getElementsByName("adminId")[0].value;
			var adminPassword = document.getElementsByName("adminPassword")[0].value;
			var regex = /^[A-Za-z0-9]+$/;
			if (adminId === "") {
				alert("登录失败！管理员ID不可为空");
				return false;
			} else if (regex.test(adminId) === false) {
				alert("登录失败！管理员ID只可为数字与字母");
				return false;
			} else if (adminPassword === "") {
				alert("登录失败！密码不可为空");
				return false;
			} else if (regex.test(adminPassword) === false) {
				alert("登录失败！密码只可为数字与字母");
				return false;
			} else {
				return true;

			}
		}
	</script>
</head>
<body>
	<div id="loginDiv" style="height: 350px">
		<form action="adminLogin" method="post" onsubmit="return checkForm()"
			name="form" id="form">
			<h1 id="loginMsg">管理员登录</h1>
			<p>
				管理员ID:<input name="adminId" type="text" id="adminId">
			</p>
			<p>
				密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码: <input name="adminPassword"
					type="password" id="adminPassword">
			</p>
			<div id="subDiv">
				<input type="submit" value="登录" class="button"> <input
					type="reset" value="重置" class="button">&nbsp;&nbsp;&nbsp; <br />
				<a href="login.jsp">用户登录</a>
			</div>

		</form>
	</div>
	<c:if test="${msg!=null}">
		<script type="text/javascript">alert("${msg}")</script>
		<c:remove var="msg" />
	</c:if>
	
</body>
</html>
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
	width: 100%;
	overflow: hidden;
	margin: 0;
	padding: 0;
	background: url(./imgs/reg_bg_min.jpg) no-repeat 0px 0px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	-moz-background-size: 100% 100%;
}

body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
}

a {
	border-color: cornsilk;
	background-color: rgba(100, 149, 237, .7);
	color: aliceblue;
	border-style: hidden;
	border-radius: 5px;
	width: 100px;
	height: 31px;
	font-size: 16px;
	display: inline-block;
	text-align: center;
	line-height: 31px;
	text-decoration: none;
	cursor: pointer;
	margin: 10px;
}

input[type="text"], input[type="password"] {
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
	font-size: 16px;
	margin: 10px 0;
	padding: 10px;
	width: 100%;
}

#loginDiv {
	width: 37%;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 380px;
	background-color: rgba(75, 81, 95, 0.3);
	box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
	border-radius: 5px;
}

#name_trip {
	margin-left: 50px;
	color: red;
}

p {
	margin-top: 30px;
	margin-left: 20px;
	color: azure;
}

#remember {
	margin-left: 15px;
	border-radius: 5px;
	border-style: hidden;
	background-color: rgba(216, 191, 216, 0.5);
	outline: none;
	padding-left: 10px;
	height: 20px;
	width: 20px;
}

#adminId {
	width: 200px;
	margin-left: 15px;
	border-radius: 5px;
	border-style: hidden;
	height: 30px;
	background-color: rgba(216, 191, 216, 0.5);
	outline: none;
	color: #f0edf3;
	padding-left: 10px;
}

#adminPassword {
	width: 202px;
	margin-left: 15px;
	border-radius: 5px;
	border-style: hidden;
	height: 30px;
	background-color: rgba(216, 191, 216, 0.5);
	outline: none;
	color: #f0edf3;
	padding-left: 10px;
}

.button {
	border-color: cornsilk;
	background-color: rgba(100, 149, 237, .7);
	color: aliceblue;
	border-style: hidden;
	border-radius: 5px;
	width: 100px;
	height: 31px;
	font-size: 16px;
}

#subDiv {
	text-align: center;
	margin-top: 30px;
}

#loginMsg {
	text-align: center;
	color: aliceblue;
}

#errorMsg {
	text-align: center;
	color: red;
}
</style>