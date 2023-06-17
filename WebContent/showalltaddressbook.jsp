<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.pojo.OrderBook"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>展示地址信息列表</title>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.css"/>">

</head>
<script>

function confirmDelete(orderId){
	var a = window.confirm("您确定要删除吗？");
	if(a==true){
		alert("删除成功");
		location.href="${pageContext.request.contextPath}/deleteAddress?orderId="+orderId;

	}
}
</script>

<body>


<div class="big_div">

<br/>
<div>
<a href="oadddressadd" style="display:block;;position:relative;top:30px; ">添加地址信息</a>
</div> 
<br/>
	<table border="0" action="/showalltaddressbookByUserID?userId=${user.userId}">
	 <tr>
	<%--  	<input type="hidden" name="userId" value="${orderId.userId}"> --%>
		<td>收货人</td>
		<td>电话号码	</td>
		<td>地址	</td>
		<td>详细地址	</td>
		<td>地址创建时间	</td>
		<td colspan="2">操作</td>
	</tr> 
	
		
<c:forEach items="${addressList}" var="address">
	<tr>
	
		<td align="center">${address.name }</td>
	<td align="center">${address.phoneNum }</td>
	<td align="center">${address.address }</td>
	<td align="center">${address.detail }</td>
	<td align="center">${address.createTime}</td>
		<%-- <td align = "center"><a href="showAddressDetailById?orderId=${address.orderId} ">详情</a></td> --%>
	<td align="center"><button onclick="confirmDelete(${address.orderId})">删除</button></td>
		<td align="center"><a href="toupdateAddress?orderId=${address.orderId}">修改</a></td>
	</tr>
</c:forEach>

 
	</table>
	
	
	
</div>
 <div>
			<jsp:include page="footer.jsp" />
</div>
</body>

</html>
<style>
	/* togeder */
	a{
	 decoration:none !important;
	}
	.big_div{
	
	width:100%;
	padding:20px;
	}
.btn-back {
  display: inline-block;
  padding: 10px;
  background-color: #f2f2f2;
  border: none;
  border-radius: 5px;
  color: #333;
  font-size: 16px;
  cursor: pointer;
  decoration:none;
}

.btn-back:hover {
  background-color: #ddd;
}
table tr:nth-child(1){
    background: #ebecf0;
}

table {
  border-collapse: collapse; /* 合并表格边框 */
 width:100%; /* 设置宽度为100% */
  font-size: 16px; /* 设置字体大小 */
  text-align: center; /* 居中对齐 */
  margin: 20px auto; /* 设置外边距 */
}

table th, table td {
  padding: 10px; /* 设置内边距 */
  border: 1px solid #ddd; /* 设置表格边框 */
}

table th {
  background-color: #f5f5f5; /* 设置表头背景颜色 */
  font-weight: bold; /* 设置表头字体加粗 */
}

  .location{
   	width:100%;
   	height:100px;
   	margin:0 auto;
   	
   }
   strong,span{
   	font-size:24px;
   }
</style>

