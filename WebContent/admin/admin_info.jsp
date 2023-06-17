<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.pojo.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员_我的个人信息</title>
<style type="text/css">
td {
	text-align: center;
	vertical-align: middle;
	height: 70px;
}

input {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h2>我的个人信息</h2>
		<label style="color: red;">${msg}</label><br> <br>
	</div>
	<div>
		<form action="updateAdmin" method="post">
			<table align="center" border="1">
				<tr>
					<%
						Admin a = (Admin) session.getAttribute("adminInfo");
					%>
					<td width="150">管理员编号:<br>(不可修改)</td>
					<td width="250"><p id="adminIdP"><%=a.getAdminId()%></p> <input
						type="hidden" id="adminId" name="adminId" value="<%=a.getAdminId()%>"></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><p id="adminNameP"><%=a.getAdminName()%></p> <input
						type="text" id="adminName" name="adminName" style="display: none"
						value="<%=a.getAdminName()%>"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><p id="adminPasswordP"><%=a.getAdminPassword()%></p> <input
						type="text" id="adminPassword" name="adminPassword" style="display: none"
						value="<%=a.getAdminPassword()%>"></td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><p id="telephoneP"><%=a.getTelephone()%></p> <input
						type="text" id="telephone" name="telephone" style="display: none"
						value="<%=a.getTelephone()%>"></td>
				</tr>
				<tr>
					<td>电子邮箱：</td>
					<td><p id="emailP"><%=a.getEmail()%></p> <input type="text"
						id="email" name="email" style="display: none" value="<%=a.getEmail()%>"></td>
				</tr>
			</table>
			<table align="center">
				<tr>
					<td><input type="submit" id="submit" style="display: none"
						value="修改"></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		var adminNameP = document.getElementById("adminNameP");
		var adminName = document.getElementById("adminName");
		var adminPasswordP = document.getElementById("adminPasswordP");
		var adminPassword = document.getElementById("adminPassword");
		var telephoneP = document.getElementById("telephoneP");
		var telephone = document.getElementById("telephone");
		var emailP = document.getElementById("emailP");
		var email = document.getElementById("email");
		var submit = document.getElementById("submit");

		adminNameP.addEventListener("click", function() {
			adminNameP.style.display = "none";
			adminName.style.display = "block";
			submit.style.display = "block";
			adminName.focus();
		});
		adminPasswordP.addEventListener("click", function() {
			adminPasswordP.style.display = "none";
			adminPassword.style.display = "block";
			submit.style.display = "block";
			adminPassword.focus();
		});
		telephoneP.addEventListener("click", function() {
			telephoneP.style.display = "none";
			telephone.style.display = "block";
			submit.style.display = "block";
			telephone.focus();
		});
		emailP.addEventListener("click", function() {
			emailP.style.display = "none";
			email.style.display = "block";
			submit.style.display = "block";
			email.focus();
		});

		document.addEventListener("click", function(event) {
			if (event.target !== adminNameP && event.target !== adminPasswordP
					&& event.target !== telephoneP && event.target !== emailP
					&& event.target !== adminName
					&& event.target !== adminPassword
					&& event.target !== telephone && event.target !== email
					&& event.target !== submit) {
				adminName.value=adminNameP.textContent;
				adminPassword.value=adminPasswordP.textContent;
				telephone.value=telephoneP.textContent;
				email.value=emailP.textContent;
				adminNameP.style.display = "block";
				adminPasswordP.style.display = "block";
				telephoneP.style.display = "block";
				emailP.style.display = "block";
				adminName.style.display = "none";
				adminPassword.style.display = "none";
				telephone.style.display = "none";
				email.style.display = "none";
				submit.style.display = "none";
			}
		});
	</script>


</body>
</html>



