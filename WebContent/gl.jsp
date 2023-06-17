<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="com.pojo.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>个人信息管理页面</title>
 

</head>


<body>
<div>
<div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>>>个人信息管理页面  </span>
</div>
<form method="post" name="form1" >
<table >

	<tr>		
		<td align = "center"><a href="findUserById?userId=${user.userId}">查看个人信息</a></td>
			<td align = "center"><a href="toupdatepersonal?userId=${user.userId}">修改个人信息</a></td>
				<td align = "center"><a href="toupdatepwd?userId=${user.userId}">修改密码</a></td>
		<td align = "center"><a href="${contextPath }deletezh?userId=${user.userId}">注销账号</a></td>			
	  </tr>


	</table>
		</form>
	</div>	
</body>
<style>
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
</style>
























