<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*,com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.css"/>">

</head>
<style>

*{
	margin:0;
	padding:0;
	font: 16px/1.5 tahoma,arial,Hiragino Sans GB,\\5B8B\4F53,sans-serif
}
.form_style{
 width:1119px;


 margin:0 auto;
 
}
.form_style2{
margin:0 auto;
width:100%;
height:auto;


}

.tr_two{
	height:100px;
	
}
table{
	width:100%;
	
    border: 1px solid #e8e8e8;
    text-align: center;
	
}
.tr_title{
	 margin: 10px 0;
    background-color: #f5f5f5;
    border: 1px solid #e8e8e8;
    text-align: center;
}

th{
    padding-top: 5px;
    padding-bottom: 5px;
       background-color: #f5f5f5;
    border: 1px solid #e8e8e8;
    text-align: center;
    border-collapse: collapse;
    border-spacing: 0;
    color: #3c3c3c!important;
    table-layout: fixed;

}
td{
border:2px solid #daf3ff;
}
button{
    background-color: #66b6ff;
    color: #fff;
    border: 1px solid #66b6ff;
}

</style>
<body>

<div class="form_style">
<form class="form_style2">
    <div class="col-md-12 column">
    <table bgcolor="red" align="center" border="2">
        <tr class="tr_title">
           <th>订单编号</th>
            <th>书籍编号id</th>
            <th>卖家id</th>
            <th>收货人姓名</th>
            <th>收货人电话号码</th>
            <th>具体收货地址</th>
            <th>买家id</th>
            <th>具体金额</th>
            <th>书籍名字</th>
            <th>订单状态</th>
            <th>操作</th>
           <!--   <th>订单提交时间</th>
              <th>完成交易时间</th> -->
        </tr>
    <%--     <c:forEach items="${ordermessage}" var="ordermessage">
			 <tr>
                  <td>${ordermessage.orderNum}</td>
                  <td>${ordermessage.bookId}</td>
                  <td>${ordermessage.userId}</td>
	          		<td>${orderbook.name }</td>
	              <td>${orderbook.phoneNum}</td>
	              <td>${orderbook.address }</td>
	              <td>aike</td>
	              <td>price</td>
	              <td>书籍名字</td>
	              <td>订单状态</td>
	              <td>
	               	<button>确认收货</button>
	              </td>
	            
            </tr>
         </c:forEach> --%>
      <c:forEach items="${OrderMessage_list}" var="ordermessage">
			 <tr>
                  <td>${ordermessage.orderNum}</td>
                  <td>${ordermessage.bookId}</td>
                  <td>${ordermessage.userId}</td>
	          		<td>${ordermessage.name }</td>
	              <td>${ordermessage.phoneNum}</td>
	              <td>${ordermessage.address }</td>
	               <%-- <td>${ordermessage. }</td> --%>
	              <td>aike</td>
	              <td>price</td>
	              <td>书籍名字</td>
	              <td>订单状态</td>
	              <td>
	               	<button>确认收货</button>
	              </td>
	            
            </tr>
         </c:forEach>
			
	             
	               
            
         
              
    </table>
    </div>   
    
    
</form>


</div>

</body>
</html>