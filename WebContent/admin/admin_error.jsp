<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出错了！</title>
</head>
<body>
	<div align="center">
		<h1>出错了！</h1>
		<label style="color: red;">${errorMsg}</label><br>
		<a href="adminLogin.jsp">
			<input type="submit" value="请尝试重新登录后重试">
		</a>
	</div>
</body>
</html>