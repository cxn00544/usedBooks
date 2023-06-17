<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.pojo.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员_二手书管理</title>
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
	<div align="center" >
		<h2>二手书管理</h2>
		<label style="color: red;">${msg}</label><br> <br>
	</div>
		<form action="selectBookItemByValue" method="post">
			<table id="bookList" align="center">
				<tr><td>二手书编号：</td><td><input name="bookId" id="bookId" type="text" value=""></td></tr>
				<tr><td>书号：</td><td><input name="ISBN"  id="ISBN"type="text" value=""> </td></tr>			
				<tr><td>卖家用户编号：</td><td><input name="userId"  id="userId" type="text" value=""></td></tr>
				<tr><td>发售日期：</td><td>
						年：<select name="sellDate_yy"  id="sellDate_yy" >
							<option value="">----</option>
							<% Calendar now = Calendar.getInstance();
								int year = now.get(Calendar.YEAR);
								for (int i = 0; i < 10 ; i++) {
								%><option value="<%= String.format("%d", year-i) %>"><% out.println(year-i); %></option><%
							} %>
						</select>
						月：<select name="sellDate_mm"  id="sellDate_mm" >
							<option value="">----</option>
							<% for (int i = 1; i <= 12 ; i++) {
								%><option value="<%= String.format("%02d", i) %>"><% out.println(i); %></option><%
							} %>
						</select>
						日：<select name="sellDate_dd"  id="sellDate_dd" >
							<option value="">----</option>
							<% for (int i = 1; i <= 31 ; i++) {
								%><option value="<%= String.format("%02d", i) %>"><% out.println(i); %></option><%
							} %>
						</select>
						</td></tr>
				<tr><td>卖家介绍：</td><td><input name="introduction"  id="introduction" type="text" value=""></td></tr>
				<tr><td>是否卖出：</td><td><input name="status" type="radio" value="Y">是&nbsp;&nbsp;&nbsp;&nbsp;
										<input name="status" type="radio" value="N">否</td></tr>	
				<tr><td></td><td><input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="查找"></tr>
			</table>
		</form>
	<br>

	<table align="center" width="1200" border="1">
		<tr>
			<td align="center" width="150">二手书编号</td>
			<td align="center" width="200">书号</td>
			<td align="center" width="150">卖家用户编号</td>
			<td align="center" width="200">发售日期</td>
			<td align="center" width="100">价格</td>
			<td align="center" width="300">卖家介绍</td>
			<td align="center" width="100">是否卖出</td>
			<td align="center" width="100">操作</td>
		</tr>

		<%
			List<BookItem> bookItems = new ArrayList();
			BookItem bookItem = new BookItem();
			bookItems = (List) request.getAttribute("bookItemList");
			if (bookItems != null) {

				for (int i = 0; i < bookItems.size(); i++) {
					bookItem = (BookItem) bookItems.get(i);
					String bookId = bookItem.getBookId();
					String ISBN = bookItem.getISBN();
					String userId = bookItem.getUserId();
					String sellDate = bookItem.getSellDate();
					String price = bookItem.getPrice();
					String introduction = bookItem.getIntroduction();					
					String status =bookItem.getStatus();
		%>
		<tr>
			<td align="center">
				<%
					out.print(bookId);
				%>
			</td>
			<td align="center">
				<%
					out.print(ISBN);
				%>
			</td>
			<td align="center">
				<%
					out.print(userId);
				%>
			</td>
			<td align="center">
				<%
					out.print(sellDate);
				%>
			</td>
			<td align="center">
				<%
					out.print(price);
				%>
			</td>
			<td align="center">
				<%
					out.print(introduction);
				%>
			</td>
			<td align="center">
				<%
					out.print(status);
				%>
			</td>
			<td>
				<button class="editButton">编辑</button>
				<button class="deleteButton">删除</button>
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
	
	
	
	
	
	
	
	<!-- 修改二手书弹窗 -->
	<div id="myModalEdit" class="modal">
		<div id="ModalEdit" class="modal-content">
			<h3 align="center">二手书修改</h3>
			<form id="FormEdit" action="updateBookItem">
				<table align="center">
					<tr>				
						<td>二手书编号：</td>
						<td><p name="bookIdShow"></p><input type="hidden" name="bookId" id="bookIdEdit"></td>
					</tr>
					<tr>
						<td>书号：</td>
						<td><input type="text" name="ISBN"></td>
					</tr>
					<tr>
						<td>卖家用户编号：</td>
						<td><p name="userId"></p></td>
					</tr>
					<tr>
						<td>发售时间：</td>
						<td><p name="sellDate"></p></td>
					</tr>
					<tr>
						<td>价格：</td>
						<td><input type="text" name="price" ></td>
					</tr>
					<tr>
						<td>卖家介绍：</td>
						<td><textarea rows="4" cols="25" name="introduction"></textarea></td>
					</tr>
					<tr>
						<td>是否卖出：</td>
						<td><select name="status">
								<option value="Y">是</option>
								<option value="N">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td><input type="button" value="取消" name="return"></td>
						<td><input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="提交"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 确认删除弹窗 -->
	<div id="myModalDel" class="modal">
		<div id="ModalDel" class="modal-content">
			<h3 align="center">确认删除该二手书吗？</h3>
			<form id="FormDel" action="deleteBookItem">
				<table align="center">
					<tr>
						<td>二手书编号：</td>
						<td><p name="bookIdShow"></p></td><input type="hidden" name="bookId"  value="">
					</tr>
					<tr>
						<td>书号：</td>
						<td><p name="ISBN"></td>
					</tr>
					<tr>
						<td>卖家用户编号：</td>
						<td><p name="userId"></td>
					</tr>
					<tr>
						<td>发售时间：</td>
						<td><p name="sellDate"></td>
					</tr>
					<tr>
						<td>价格：</td>
						<td><p name="price"></td>
					</tr>
					<tr>
						<td>卖家介绍：</td>
						<td><p name="introduction"></td>
					</tr>
					<tr>
						<td>是否卖出：</td>
						<td><p name="status"></td>
					</tr>
					<tr>
						<td><input type="button" value="取消" name="return"></td>
						<td>&nbsp;&nbsp;&nbsp;<input type="submit" value="确认"></td>
					</tr>
				</table>
				
			</form>
		</div>
	</div>
	
	<script type="text/javascript" >
		var modalEdit = document.getElementById("myModalEdit");		
		var modalContentEdit = document.getElementById("ModalEdit");		
		var formEdit = document.getElementById("FormEdit");		
		var bookIdShow = formEdit.querySelector("p[name='bookIdShow']");
		var bookIdInput = formEdit.querySelector("input[name='bookId']");
		var ISBNInput = formEdit.querySelector("input[name='ISBN']");
		var userIdInput = formEdit.querySelector("p[name='userId']");
		var sellDateInput = formEdit.querySelector("p[name='sellDate']");
		var priceInput = formEdit.querySelector("input[name='price']");
		var introductionInput = formEdit.querySelector("textarea[name='introduction']");
		var statusInput = formEdit.querySelector("select[name='status']");
		var returnEdit = document.querySelector('#myModalEdit input[name="return"]');

		var modalDel = document.getElementById("myModalDel");
		var modalContentDel = document.getElementById("ModalDel");
		var formDel = document.getElementById("FormDel");
		var bookIdP = formDel.querySelector("p[name='bookIdShow']");
		var bookIdDel = formDel.querySelector("input[name='bookId']");
		var ISBNP = formDel.querySelector("p[name='ISBN']");
		var userIdP = formDel.querySelector("p[name='userId']");
		var sellDateP = formDel.querySelector("p[name='sellDate']");
		var priceP = formDel.querySelector("p[name='price']");
		var introductionP = formDel.querySelector("p[name='introduction']");
		var statusP = formDel.querySelector("p[name='status']");
		var returnDel = document.querySelector('#myModalDel input[name="return"]');


		// 为每个按钮添加点击事件监听器
		var editButtons = document.querySelectorAll(".editButton");
		for (var i = 0; i < editButtons.length; i++) {
			editButtons[i].addEventListener("click", function(event) {
				// 获取该行的数据
				var row = event.target.parentNode.parentNode;
				var bookId = row.cells[0].textContent.trim();
				var ISBN = row.cells[1].textContent.trim();
				var userId = row.cells[2].textContent.trim();
				var sellDate = row.cells[3].textContent.trim();
				var price = row.cells[4].textContent.trim();
				var introduction = row.cells[5].textContent.trim();
				var status = row.cells[6].textContent.trim();

				// 填充表单数据
				bookIdShow.textContent = bookId;
				bookIdInput.value = bookId;
				ISBNInput.value = ISBN;
				userIdInput.textContent = userId;
				sellDateInput.textContent = sellDate;
				priceInput.value = price;
				introductionInput.value = introduction;
				statusInput.value = status;
				// 显示弹窗
				modalEdit.style.display = "block";

				//关闭弹窗 的监听器
				document.addEventListener('click', function(event) {
					if (event.target == modalEdit && event.target != modalContentEdit || event.target == returnEdit) {
						modalEdit.style.display = 'none';
					}
				});
			});
		}
		var deleteButtons = document.querySelectorAll(".deleteButton");
		for (var i = 0; i < deleteButtons.length; i++) {
			deleteButtons[i].addEventListener("click", function(event) {
				// 获取该行的数据
				var row = event.target.parentNode.parentNode;
				var bookId = row.cells[0].textContent.trim();
				var ISBN = row.cells[1].textContent.trim();
				var userId = row.cells[2].textContent.trim();
				var sellDate = row.cells[3].textContent.trim();
				var price = row.cells[4].textContent.trim();
				var introduction = row.cells[5].textContent.trim();
				var status = row.cells[6].textContent.trim();
				

				// 填充表单数据
				bookIdP.textContent = bookId;
				bookIdDel.value = bookId;
				ISBNP.textContent = ISBN;
				userIdP.textContent = userId;
				sellDateP.textContent = sellDate;
				priceP.textContent = price;
				introductionP.textContent = introduction;
				statusP.textContent = status;

				// 显示弹窗
				modalDel.style.display = "block";

				//关闭弹窗 的监听器
				document.addEventListener('click', function(event) {
					if (event.target == modalDel && event.target != modalContentDel || event.target == returnDel) {
						modalDel.style.display = 'none';
					}
				});
			});
		}
	</script>
</body>
</html>