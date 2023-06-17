<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.pojo.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="js/datepicker-zh-CN.min.js"></script>
	
	<link rel="stylesheet" href="css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员_书籍管理</title>
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
		<h2>书籍管理</h2>
		<label style="color: red;">${msg}</label><br> <br>
	</div>
		<form action="selectBookByValue" method="post">
			<table id="bookList" align="center">
				<tr>
					<td width="200"></td>
					<td width="100"></td>
					<td width="100"></td>
					<td><input name="key" value="ISBN" id="ISBN" type="radio" onclick="radioChangeToOther()">书号
						&nbsp;&nbsp; <input name="key" value="bookTitle" id="bookTitle"type="radio" onclick="radioChangeToOther()">书名 
						&nbsp;&nbsp; <input name="key" value="author" id="author" type="radio" onclick="radioChangeToOther()">作者
						&nbsp;&nbsp;&nbsp;&nbsp;<input name="key" value="typeId" id="typeId" type="radio" onclick="radioChangeToOther()">书籍类型
					</td>
					<td><select name="bookType" onchange="radioChangeToBookType()">
							<option value="">--请选择--</option>
							<%
								List<BookType> bookTypes = new ArrayList();
								bookTypes = (List) session.getAttribute("bookTypeList");
								if (bookTypes != null) {
									for (int i = 0; i < bookTypes.size(); i++) {
										String typeId = bookTypes.get(i).getTypeId();
										String toString = bookTypes.get(i).toString();
							%><option value="<%= typeId%>"><%= toString%></option>
							<%
								}
								}
							%>

					</select></td>
					<td width="200"></td>
					<td width="100"></td>
				</tr>
				<tr>
					<td width="200"></td>
					<td width="100"></td>
					<td width="100"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="value" type="text">
					<td><input type="reset" value="重置"> &nbsp;&nbsp; <input
						type="submit" value="查找"></td>
					</td>
					<td width="200"></td>
					<td width="100"><input type="button" value="添加书籍" class="addButton"></td>

				</tr>
			</table>

		</form>

	<br>

	<table align="center" width="1200" border="1">
		<tr>
			<td align="center" width="200">书号</td>
			<td align="center" width="300">书名</td>
			<td align="center" width="200">作者</td>
			<td align="center" width="200">出版社</td>
			<td align="center" width="100">出版日期</td>
			<td align="center" width="100">类型编号</td>
			<td align="center" width="100">类型名称</td>
			<td align="center" width="100">操作</td>
		</tr>

		<%
			List<Book> books = new ArrayList();
			Book book = new Book();
			books = (List) request.getAttribute("bookList");
			if (books != null) {

				for (int i = 0; i < books.size(); i++) {
					book = (Book) books.get(i);
					String ISBN = book.getISBN();
					String bookTitle = book.getBookTitle();
					String author = book.getAuthor();
					String press = book.getPress();
					String publishDate = book.getPublishDate();
					String typeId = book.getTypeId();
					String typeName = book.getTypeName();
		%>
		<tr>
			<td align="center">
				<%
					out.print(ISBN);
				%>
			</td>
			<td align="center">
				<%
					out.print(bookTitle);
				%>
			</td>
			<td align="center">
				<%
					out.print(author);
				%>
			</td>
			<td align="center">
				<%
					out.print(press);
				%>
			</td>
			<td align="center">
				<%
					out.print(publishDate);
				%>
			</td>
			<td align="center">
				<%
					out.print(typeId);
				%>
			</td>
			<td align="center">
				<%
					out.print(typeName);
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
	
	<!-- 添加书籍弹窗 -->
	<div id="myModalAdd" class="modal">
		<div id="ModalAdd" class="modal-content">
			<h3 align="center">添加书籍</h3>
			<form id="FormAdd" action="addBook">
				<table align="center">
					<tr>				
						<td>书号：</td>
						<td><input type="text" name="ISBN"></td>
					</tr>
					<tr>
						<td>书名：</td>
						<td><input type="text" name="bookTitle"></td>
					</tr>
					<tr>
						<td>作者：</td>
						<td><input type="text" name="author"></td>
					</tr>
					<tr>
						<td>出版社：</td>
						<td><input type="text" name="press"></td>
					</tr>
					<tr>
						<td>出版时间：</td>
						<td><input type="text" name="publishDate" id="datepickerAdd"></td>
					</tr>
					<tr>
						<td>类型编号：</td>
						<td>
						<select name="typeId" >
							<%	if (bookTypes != null) {
									for (int i = 0; i < bookTypes.size(); i++) {
										String typeId = bookTypes.get(i).getTypeId();
										String toString = bookTypes.get(i).toString();
							%><option value="<%= typeId%>"><%= toString%></option>
							<%}}%>
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
	
	<!-- 修改书籍弹窗 -->
	<div id="myModalEdit" class="modal">
		<div id="ModalEdit" class="modal-content">
			<h3 align="center">书籍修改</h3>
			<form id="FormEdit" action="updateBook">
				<table align="center">
					<tr>				
						<td>书号：</td>
						<td><p  name="ISBN"></p><input type="hidden" name="ISBN"></td>
					</tr>
					<tr>
						<td>书名：</td>
						<td><input type="text" name="bookTitle"></td>
					</tr>
					<tr>
						<td>作者：</td>
						<td><input type="text" name="author"></td>
					</tr>
					<tr>
						<td>出版社：</td>
						<td><input type="text" name="press"></td>
					</tr>
					<tr>
						<td>出版时间：</td>
						<td><input type="text" name="publishDate" id="datepickerEdit"></td>
					</tr>
					<tr>
						<td>类型编号：</td>
						<td>
						<select name="typeId" >
							<%	if (bookTypes != null) {
									for (int i = 0; i < bookTypes.size(); i++) {
										String typeId = bookTypes.get(i).getTypeId();
										String toString = bookTypes.get(i).toString();
							%><option value="<%= typeId%>"><%= toString%></option>
							<%}}%>
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
			<h3 align="center">确认删除该书籍吗？</h3>
			<form id="FormDel" action="deleteBook">
				<table align="center">
					<tr>
						<td>书号：</td>
						<td><p name="ISBN"></p></td><input type="hidden" name="ISBNDel"  value="">
					</tr>
					<tr>
						<td>书名：</td>
						<td><p name="bookTitle"></td>
					</tr>
					<tr>
						<td>作者：</td>
						<td><p name="author"></td>
					</tr>
					<tr>
						<td>出版社：</td>
						<td><p name="press"></td>
					</tr>
					<tr>
						<td>出版时间：</td>
						<td><p name="publishDate"></td>
					</tr>
					<tr>
						<td>类型编号：</td>
						<td><p name="typeId"></td>
					</tr>
					<tr>
						<td>类型名称：</td>
						<td><p name="typeName"></td>
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
		var modalDel = document.getElementById("myModalDel");
		var modalContentEdit = document.getElementById("ModalEdit");
		var modalContentDel = document.getElementById("ModalDel");
		var formEdit = document.getElementById("FormEdit");
		var formDel = document.getElementById("FormDel");
		var ISBNInput = formEdit.querySelector("p[name='ISBN']");
		var ISBNHidden = formEdit.querySelector("input[name='ISBN']");
		var bookTitleInput = formEdit.querySelector("input[name='bookTitle']");
		var authorInput = formEdit.querySelector("input[name='author']");
		var pressInput = formEdit.querySelector("input[name='press']");
		var publishDateInput = formEdit.querySelector("input[name='publishDate']");
		var typeIdInput = formEdit.querySelector("select[name='typeId']");
		var returnEdit = document.querySelector('#myModalEdit input[name="return"]');

		var ISBNP = formDel.querySelector("p[name='ISBN']");
		var ISBNDel = formDel.querySelector("input[name='ISBNDel']");
		var bookTitleP = formDel.querySelector("p[name='bookTitle']");
		var authorP = formDel.querySelector("p[name='author']");
		var pressP = formDel.querySelector("p[name='press']");
		var publishDateP = formDel.querySelector("p[name='publishDate']");
		var typeIdP = formDel.querySelector("p[name='typeId']");
		var typeNameP = formDel.querySelector("p[name='typeName']");
		var returnDel = document.querySelector('#myModalDel input[name="return"]');

		var addButton = document.querySelector('.addButton');
		var modalAdd = document.getElementById("myModalAdd");
		var modalContentAdd = document.getElementById("ModalAdd");		
		var returnAdd = document.querySelector('#myModalAdd input[name="return"]');
		addButton.addEventListener("click", function(event) {
			// 显示弹窗
			modalAdd.style.display = "block";
			//关闭弹窗 的监听器
			document.addEventListener('click', function(event) {
				if (event.target == modalAdd && event.target != modalContentAdd || event.target == returnAdd) {
					modalAdd.style.display = 'none';
				}
			});
		});
		// 为每个按钮添加点击事件监听器
		var editButtons = document.querySelectorAll(".editButton");
		for (var i = 0; i < editButtons.length; i++) {
			editButtons[i].addEventListener("click", function(event) {
				// 获取该行的数据
				var row = event.target.parentNode.parentNode;
				var ISBN = row.cells[0].textContent.trim();
				var bookTitle = row.cells[1].textContent.trim();
				var author = row.cells[2].textContent.trim();
				var press = row.cells[3].textContent.trim();
				var publishDate = row.cells[4].textContent.trim();
				var typeId = row.cells[5].textContent.trim();

				// 填充表单数据
				ISBNInput.textContent = ISBN;
				ISBNHidden.value = ISBN;
				bookTitleInput.value = bookTitle;
				authorInput.value = author;
				pressInput.value = press;
				publishDateInput.value = publishDate;
				typeIdInput.value = typeId;

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
				var ISBN = row.cells[0].textContent.trim();
				var bookTitle = row.cells[1].textContent.trim();
				var author = row.cells[2].textContent.trim();
				var press = row.cells[3].textContent.trim();
				var publishDate = row.cells[4].textContent.trim();
				var typeId = row.cells[5].textContent.trim();
				var typeName = row.cells[6].textContent.trim();
				

				// 填充表单数据
				ISBNP.textContent = ISBN;
				ISBNDel.value = ISBN;
				bookTitleP.textContent = bookTitle;
				authorP.textContent = author;
				pressP.textContent = press;
				publishDateP.textContent = publishDate;
				typeIdP.textContent = typeId;
				typeNameP.textContent = typeName;

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
		
		function radioChangeToBookType() {//选择select时改为选择单选框bookType，并把select的value赋予textInput
			var ISBN = document.getElementById("ISBN");
			var bookTitle = document.getElementById("bookTitle");
			var author = document.getElementById("author");
			var typeId = document.getElementById("typeId");
			var select = document.querySelector('select[name="bookType"]');
			var textInput = document.querySelector('input[name="value"]');

			ISBN.checked = false;
			bookTitle.checked = false;
			author.checked = false;
			typeId.checked = true;
			textInput.value = select.value;

		}
		function radioChangeToOther() {//点击bookType以外的单选框时，下拉选项框改为请选择
			var textInput = document.querySelector('input[name="value"]');
			var select = document.querySelector('select[name="bookType"]');
			select.value="";
			textInput.value = "";
		}
		
		$(function() {//实现出版时间的日期选择datepicker
			  $("#datepickerAdd").datepicker($.datepicker.regional["zh-CN"]);
			  $("#datepickerEdit").datepicker($.datepicker.regional["zh-CN"]);
		});
		
	</script>
</body>
</html>