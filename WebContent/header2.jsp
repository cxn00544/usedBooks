<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
</head>
<body>
		<!-- 导航栏 -->
					<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%;border-radius: 10px 10px 0 0;">
			 
			 			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    
			    	<div class="navbar-header">
					<span class="logo"></span>
					<a class="navbar-brand" href="#" style="font-size: 25px">校园二手交易平台</a>
					</div>
			    <ul class="navbar-nav mr-auto">
			       <li class="nav-item active">
			        <a class="nav-link" href="toIndex">首页<span class="sr-only">(current)</span></a>
			      </li>
			       <li class="nav-item active">
			        <a class="nav-link" href="doShowAllTBuyBookByUserId?userId=${user.userId}">我的求购<span class="sr-only">(current)</span></a>
			      </li>
			      </li>
 
			      <li class="nav-item active">
			        <a class="nav-link" href="doShowAllSellBook?userId=${user.userId}">我的出售<span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="tbuybook"> 全部求购<span class="sr-only">(current)</span></a>
			      </li>
			       <li class="nav-item active">
			        <a class="nav-link" href="CollectDetailByUserId?userId=${user.userId}"> 收藏夹<span class="sr-only">(current)</span></a>
			      </li>
			        <li class="nav-item active">
			        <a class="nav-link" href="selectOrderByUserId?userId=${user.userId}"> 我的订单<span class="sr-only">(current)</span></a>
			      </li>
<%-- 			        <li class="nav-item active">
			        <a class="nav-link" href="selectOverOrderByUserId?userId=${user.userId}">已经完成的订单<span class="sr-only">(current)</span></a>
			      </li> --%>
			       <li class="nav-item active">
			        <a class="nav-link" href="center?userId=${user.userId}"> 个人中心<span class="sr-only">(current)</span></a>
			      </li>
			       </li>
			       <%--  <li class="nav-item active">
			        <a class="nav-link" href="showalltaddressbookByUserID?userId=${user.userId}"> 收货地址管理<span class="sr-only">(current)</span></a>
			      </li> --%>
			       <li class="nav-item active tuichu" >
			        <a class="nav-link" href="login.jsp" > 退出<span class="sr-only">(current)</span></a>
			      </li>
	
			    </ul>
			
			  </div>
			  
		
			</nav>

</body>
</html>
<style>
.navbar-header{
margin-left:335px;
}
.form-inline{
margin-right:100px;
}
.tuichu{
margin-left:650px!important;
}
.logo{
width:50px;
height:50px;
display:inline-block;
position: absolute;
left:300px;
background: url(./imgs/书本.png) center;
    background-size: 100% 100%;
}
</style>