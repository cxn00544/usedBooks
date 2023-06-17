<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.pojo.*,java.util.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>我的反馈</title>
  <link href="css/ncss_style.css" rel="stylesheet" type="text/css" />
 
</head>
<body>
<br>
<br>
<br>


<div class="form-div">

<form method="post" name="form1" >

	<table>

	<tr>
	<th>序号</th>
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
<td>${problem.sptittle}</td>
<td>${problem.sp}</td>
<td>${problem.telephone}</td>
<td>${problem.create_time}</td>
<td>
<c:if test="${problem.statuss==0}">未解决</c:if>
<c:if test="${problem.statuss==1}">已解决</c:if>
</td>
<td align = "center"><a href="${contextPath }deletesp?spID=${problem.spID}">删除</a></td>			
</tr>			
	</c:forEach>	
	</tbody>	
<!--通过c:forEach标签遍历集合userById中的元素,集合里存储的是selectbyid方法的返回值,var 用于存储从集合中取出的元素-->

	</table>
	</form>
	<a href="addspp.jsp">添加意见</a>
	</div>
</body>
</html>
<style>
	/* togeder */


	/* togeder */


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
div {
    text-align: center;

}
div > span {
    position: relative; /* 将内部 span 元素的 position 属性设置为 relative */
}
a {

  text-decoration: none;
     color: #fff; /* 设置字体颜色 */
}
a {
    display: inline-block; /* 转为块级元素 */
    padding: 10px 20px; /* 设置内边距 */
   background-color: #5a88c8;/* 设置背景色 */
    border: none; /* 去掉边框 */
    border-radius: 4px; /* 设置圆角 */
}
a:hover {
    background-color: #0069d9; /* 鼠标悬停时的背景色 */
    cursor: pointer; /* 鼠标悬停时变为手指形状 */
}



.btn-back:hover {
  background-color: #ddd;
}
   
</style>

