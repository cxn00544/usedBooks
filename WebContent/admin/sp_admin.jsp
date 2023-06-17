<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.pojo.*,java.util.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="css/header.css">
  <title>管理反馈</title>
  <link href="css/ncss_style.css" rel="stylesheet" type="text/css" />
 
</head>
<body>

		<jsp:include page="header.jsp"></jsp:include>
<div class="form-div">

<form method="post" name="form1" >
	<table>
	<thead>
	<tr>
	<th>序号</th>
	<th>读者账号</th>
	<th>标题</th>
	<th>问题描述</th>
	<th>联系电话</th>
	<th>提交时间</th>
	<th>问题状态</th>
	<th>操作</th>
	</tr>
	</thead>
	<tbody>
 <c:forEach items="${problem}" var="problem">
<tr>
<td>${problem.spID}</td>
<td>${problem.userId}</td>
<td>${problem.sptittle}</td>
<td>${problem.sp}</td>
<td>${problem.telephone}</td>
<td>${problem.create_time}</td>
<td>
<c:if test="${problem.statuss==0}">未解决</c:if>
<c:if test="${problem.statuss==1}">已解决</c:if>
</td>

<td ><a class="update-link" href="${contextPath }updatestuss?spID=${problem.spID}">解决</a>
<a  class="delete-link" href="${contextPath }deletespp?spID=${problem.spID}">删除</a>

</td>
</tr>			
	</c:forEach>	
	</tbody>	
	
	

	</table>
	</form>
	</div>
</body>
</html>
<style>
	/* togeder */
	.button {
  display: inline-block;
  margin: 0.5rem 1rem;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.25;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  background-color: #007bff;
  border-color: #007bff;
  color: #fff;
  border-radius: 0.25rem;
  transition: all .15s ease-in-out;
}

.button:hover, .button:focus {
  background-color: #0062cc;
  border-color: #005cbf;
  color: #fff;
}
	.update-link {
  color: #007bff;
  text-decoration: none;
}

.delete-link {
  color: #dc3545;
  text-decoration: none;
}
table {
  border-collapse: collapse; /* 合并表格边框 */
 width:60%; /* 设置宽度为100% */
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

table tr:nth-child(even) {
  background-color: #f9f9f9; /* 设置奇数行的背景颜色 */
}
  .location{
   	width:100%;
   	height:100px;
   	margin:0 auto;
   	
   }
   strong,span{
   	font-size:24px;
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
   
</style>

