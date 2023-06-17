<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*,com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人收藏</title>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.css"/>">
	 <link rel="stylesheet" href="./css/ordercss.css">
</head>
<body>
<div>
<div>
			<jsp:include page="header2.jsp" />
</div>
<header class="mt-header" data-spm="a210b">
  <article>
    <div class="mt-logo" style="margin-left: 0px;">
      <a title="我的订单" style="background-image: url(https://img.alicdn.com/imgextra/i2/O1CN015xANTA1iq6KMo02E5_!!6000000004463-2-tps-140-34.png);background-image: -webkit-image-set(url(https://img.alicdn.com/imgextra/i2/O1CN015xANTA1iq6KMo02E5_!!6000000004463-2-tps-140-34.png) 1x,url(https://img.alicdn.com/imgextra/i1/O1CN01sCCscO1CKtdpqHDyv_!!6000000000063-2-tps-280-62.png) 2x);" href="//i.taobao.com/my_taobao.htm?nekot=1470211439696&amp;tracelog=newmytb_logodianji" class="mt-tblogo" data-spm="d1000351"></a>
    </div>
    <nav class="mt-nav">
    
			
	<p>我的收藏列表</p>
     
  
    </nav>

  </article>
  
</header>

<table border="0" action="CollectDetailByUserId?userId=${user.userId}">
	 <tr>
		<td colspan="9">收藏列表</td>
	</tr> 
	 <tr>
	</tr> 
	<tr>

		<td>收藏编号</td>
		<td>书号</td>
		<td>书籍编号</td>
		<td>买家名字</td>
	 	<td>书籍名称</td>
		<td>卖家介绍</td>
		<td>发布时间</td>
		<td>价格</td> 
	<!-- 	<td>收藏时间</td>  -->
		<td colspan="3">操作</td>	
	</tr>
	
<c:forEach items="${collectBookList}" var="collectBooks">
	<tr>
		<td align="center">${collectBooks.collectId }</td>
		<td align="center">${collectBooks.bookId }</td>
		<td align="center">${collectBooks.ISBN}</td> 
		<td align="center">${collectBooks.userName }</td>
    <td align="center">${collectBooks.bookTitle }</td>
		<td align="center">${collectBooks.introduction}</td> 
		<td align="center">${collectBooks.sellDate }</td>
		<td align="center">${collectBooks.price }</td>
		<%-- <td align="center">${collectBooks.collectTime }</td> --%>
		
		<td align="center"><a href="deleteCollect?collectId=${collectBooks.collectId}">取消收藏</a></td>
	
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
p{font-size: 24px;
    color: #fff;
    padding-left:200px;
    }
    
    

table {
  border-collapse: collapse; 
 width:60%;
  font-size: 16px; 
  text-align: center;
  margin: 20px auto; 
}

table th, table td {
  padding: 10px; 
  border: 1px solid #ddd; 
}

table th {
  background-color: #f5f5f5; 
  font-weight: bold; 
}

table tr:nth-child(even) {
  background-color: #f9f9f9; 
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

