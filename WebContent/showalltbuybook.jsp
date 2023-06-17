<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<?xml version="1.0" encoding="UTF-8" ?>

<%@page import="com.pojo.TBuyBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"   %>
<%@ page import="java.util.*,com.pojo.*"%>
<%@ page import="com.pojo.TBuyBook" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>展示求购管理界面</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
	<script type="text/javascript">
		function del(demandId,userId){
			var a = window.confirm("您确定要删除吗？");
			if(a==true){
				location.href="${pageContext.request.contextPath}/doDeleteTBuyBook?demandId="+demandId+"&userId="+userId;
			}
		}
	</script>
</head>
<body>
<div>
			<jsp:include page="header2.jsp" />
	</div>
	<br><br />
<div class="comment-table">
	<div class="comment-header">
		<h2>求购管理</h2>
		<div>
			<a href="<c:url value='/add?userId=${user.userId}'/>">添加求购信息</a>
		</div>
	</div>
	<c:if test="${not empty list}">
		<table>
			<thead>
			<tr>
				<th>求购书名(点击查看详情)&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>

			<c:forEach items="${list}" var="tbook">
				<tr>
					<td>
						<a href="<c:url value="/doShowTBuyBookDetail?demandId=${tbook.demandId}"/>" target="showTBuyBook">${tbook.bookName}</a>
					</td>
					<td>
				
					
						<a class="button-edit" href="doShowTBuyBookDetailForModify?demandId=${tbook.demandId}">修改</a>
						
					
					     <a class="button-edit" onclick="del(${tbook.demandId},${user.userId})">删除</a>
					</td>
						<input type="hidden" name="userId" value="${user.userId}" />
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${empty list}">
		没有记录
	</c:if>


 <div>
			<jsp:include page="footer.jsp" />
</div>
</body>

</html>
<style>
a.button-edit,  {
  display: inline-block;
  padding: 8px 16px;
  background-color: #4CAF50;
  color: white;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  border-radius: 4px;
}

a.button-edit:hover {
  background-color: #3e8e41;
}
</style>