<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.pojo.*,java.util.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript">
function del(userId){
    var a = window.confirm("您确定要删除吗？");
    if(a==true){
        location.href="${pageContext.request.contextPath}/deletezh?userId=${user.userId}";
    }
}
</script>
<head>
  <title>个人信息查看</title>
  <link href="css/ncss_style.css" rel="stylesheet" type="text/css" />
 
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="form-div">

<form method="post" name="form1" >
	<table>
	<thead>
	<tr>
	<th>用户id</th>
	<th>用户名</th>
	<th>联系方式</th>
	<th>电子邮箱</th>
	</tr>
	</thead>
	<tbody>
<!--通过c:forEach标签遍历集合userById中的元素,集合里存储的是selectbyid方法的返回值,var 用于存储从集合中取出的元素-->
 <c:forEach items="${userById}" var="findId">
	<tr>
<td>${findId.userId}</td>		
<td>${findId.userName}</td>
<td>${findId.telephone}</td>
<td>${findId.email}</td>
	</tr>
</c:forEach>
</tbody>	
	</table>
	</form>
	
				<td align = "center"><a href="toupdatepersonal?userId=${user.userId}">修改个人信息</a></td>
				<td align = "center"><a href="toupdatepwd?userId=${user.userId}">修改密码</a></td>
		<td align = "center"><a href="deletezh?userId=${user.userId}" >注销账号</a></td>			
	</div>
</body>
</html>
 <style>
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

 