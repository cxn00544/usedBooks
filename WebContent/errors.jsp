<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异常处理页面</title>
</head>
<body>
	<div class="container">
		<h1>sos!</h1>
		<p>出错啦</p>
		<button onclick="window.history.back()">Go back</button>
		<h4 style="color:red">${errorMsg}</h4>
	</div>
</body>
</html>
<style>
body {
	background-color: #f8f8f8;
	font-family: Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
	color: #333;
}
.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 50px 20px;
	text-align: center;
}
h1 {
	font-size: 48px;
	margin-bottom: 20px;
}
p {
	font-size: 24px;
	margin-bottom: 40px;
}
button {
	background-color: #008CBA;
	color: #fff;
	font-size: 20px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
button:hover {
	background-color: #005F6B;
}
</style>