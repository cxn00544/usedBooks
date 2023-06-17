<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="java.util.*,com.pojo.*"%>
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<style>
.go-top {
    position: fixed; /* 设置fixed固定定位 */
    bottom: 20px; /* 距离浏览器窗口下边框20px */
    right: 20px; /* 距离浏览器窗口右边框20px */
}
</style>
</head>
<body>
	<div align="center" id="topAnchor">
		<h1>校园二手书交易系统 后台管理系统</h1>

	</div>
	<%
		Admin adminInfo = new Admin();
		adminInfo = (Admin) session.getAttribute("adminInfo");
	%>
	<ul>
		<li><a href="adminBook">书籍管理</a></li>
		<li><a href="adminBookItem">二手书管理</a></li>
		<li><a href="adminUserLogout">用户注销</a></li>
		<li><a href="findallsp">意见反馈管理</a></li>
		<li><a href="adminInfo">我的个人信息</a></li>
		<li class="admin-info"><a href="adminInfo">登录管理员：<%=adminInfo.getAdminName()%></a></li>
	</ul>
	<div class="go-top">
		<a href="#topAnchor"><img alt="返回顶部" src="imgs/goTop.png" width="30px" height="30px"></a>
	</div>
</body>
</html>