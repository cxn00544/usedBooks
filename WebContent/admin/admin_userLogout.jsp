<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.pojo.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="js/datepicker-zh-CN.min.js"></script>

<link rel="stylesheet" href="css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员_用户注销</title>
<style>
/* 隐藏弹窗 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* 弹窗样式*/
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 5px solid #333;
	width: 500px;
}


</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h2>用户注销</h2>
		<label style="color: red;">${msg}</label><br> <br>
	</div>
	<form action="selectUserByUserId" method="post"
		onsubmit="return checkForm()">
		<table align="center" >
			<tr><td width="200"></td>
			<td width="200"></td>
				<td>待注销的用户编号：</td>
				<td><input type="text" name="userId"></td>
				<td width="200"></td>
			</tr>
			<tr>
				<td width="200"></td>
				<td width="200"></td>
				<td width="200"></td>
				<td><input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="submit" value="查找"></td><td width="200"></td>
				<td width="200">&nbsp;&nbsp;
						<input type="button" class="delAllButton" value="注销全部"></td>
			</tr>
		</table>
	</form>

	<br>

	<table align="center" width="960" border="1" id="userTable">
		<tr>
			<td align="center" width="150">可注销用户编号</td>
			<td align="center" width="200">用户名</td>
			<td align="center" width="100">性别</td>
			<td align="center" width="200">联系电话</td>
			<td align="center" width="250">电子邮箱</td>
			<td align="center" width="43">操作</td>
		</tr>

		<%
			List<User> users = new ArrayList();
			User user = new User();
			users = (List) request.getAttribute("userList");
			if (users != null) {

				for (int i = 0; i < users.size(); i++) {
					user = (User) users.get(i);
					String userId = user.getUserId();
					String userName = user.getUserName();
					String sex = user.getSex();
					String telephone = user.getTelephone();
					String email = user.getEmail();
		%>
		<tr>
			<td align="center">
				<%
					out.print(userId);
				%>
			</td>
			<td align="center">
				<%
					out.print(userName);
				%>
			</td>
			<td align="center">
				<%
					out.print(sex);
				%>
			</td>
			<td align="center">
				<%
					out.print(telephone);
				%>
			</td>
			<td align="center">
				<%
					out.print(email);
				%>
			</td>
			<td>
				<button class="deleteButton">注销</button>
			</td>
		</tr>
		<%
			}
			} else {
		%><tr>
			<td>
				<%
					out.print("没有记录");
				%>
			</td>
		</tr>
		<%
			}
		%>
	</table>

	<!-- 确认注销弹窗 -->
	<div id="myModalDel" class="modal">
		<div id="ModalDel" class="modal-content">
			<h3 align="center">确认注销该用户吗？</h3>
			<form id="FormDel" action="deleteUserByUserId">
				<table align="center">
				</table>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="取消" name="return">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="确认">
			</form>
		</div>
	</div>

	<!-- 确认注销所有用户弹窗 -->
	<div id="myModalLogout" class="modal">
		<div id="ModalLogout" class="modal-content">
			<h3 align="center">确认注销所有可注销用户吗？</h3>
			<form id="FormLogout" action="deleteUserAll">
				<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="取消" name="return">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="确认"><br><br>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		
		var modalLogout = document.getElementById("myModalLogout");
		var modalContentLogout = document.getElementById("ModalLogout");
		var returnLogout = document.querySelector('#myModalLogout input[name="return"]');

		var modalDel = document.getElementById("myModalDel");
		var modalContentDel = document.getElementById("ModalDel");
		var formDel = document.getElementById("FormDel");
		var tableDel = document.querySelector("#FormDel table");
		var userIdP = formDel.querySelector("p[name='userIdP']");
		var userId = formDel.querySelector("input[name='userId']");
		var userNameP = formDel.querySelector("p[name='userNameP']");
		var returnDel = document.querySelector('#myModalDel input[name="return"]');
		
		var delAllButton = document.querySelector('.delAllButton');
		delAllButton.addEventListener("click", function(event) {
			// 显示弹窗
			modalLogout.style.display = "block";
			//关闭弹窗 的监听器
			document.addEventListener('click', function(event) {
				if (event.target == modalLogout && event.target != modalContentLogout || event.target == returnLogout) {
					modalLogout.style.display = 'none';
				}
			});
		});
		
		var deleteButtons = document.querySelectorAll(".deleteButton");
		for (var i = 0; i < deleteButtons.length; i++) {
			deleteButtons[i].addEventListener("click", function(event) {
				// 获取该行的数据
				var row = event.target.parentNode.parentNode;
				var userId = row.cells[0].textContent.trim();
				var userName = row.cells[1].textContent.trim();

				// 填充表单数据
				var formTable = document.querySelector("#FormDel table");
				var tr = document.createElement("tr");
				tr.innerHTML = `
					<td>用户编号：</td>
					<td><p name="userIdP"></p>
					<input type="hidden" name="userId" ></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<td>用户名：</td>
					<td><p name="userNameP"></p></td>
					`;
				formTable.appendChild(tr);
				tr.querySelector("p[name='userIdP']").textContent = userId;
				tr.querySelector("input[name='userId']").value = userId;
				tr.querySelector("p[name='userNameP']").textContent = userName;
				
				// 显示弹窗
				modalDel.style.display = "block";

				//关闭弹窗 的监听器
				document.addEventListener('click', function(event) {
					if (event.target == modalDel && event.target != modalContentDel || event.target == returnDel) {
						modalDel.style.display = 'none';
						// 删除表格中的数据
					    var rows = tableDel.getElementsByTagName("tr");
					    for (var i = rows.length ; i > 0; i--) {
					    	tableDel.deleteRow(0);
					    }
					}
				});
			});
		}
		
		function checkForm() {
			var userId = document.getElementsByName("userId")[0].value;
			var regex = /^[0-9]+$/;
			if (regex.test(userId) === false && userId !== "") {
				alert("用户编号由数字组成，请输入正确格式！");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>