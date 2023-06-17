<%@ page language="java" import="java.util.*,com.pojo.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单</title>
</head>
<body>
<form>
    <div class="col-md-12 column">
    <table bgcolor="red" align="center" border="2">
        <tr>
           <th>订单编号</th>
            <th>收货地址</th>
            <th>书籍编号</th>
            <th>卖家id</th>
            <th>买家id</th>
            <th>订单状态</th>
            
            <th>书籍名字</th>
             <th>订单提交时间</th>
              <th>完成交易时间</th>
        </tr>

      
        <c:forEach var="ordermessage" items="${ordersList}">
        
                
                <td>${ordermessage.orderNum}</td>
                <td>${ordermessage.orderbook.name}</td>
                <td>${ordermessage.orderbook.phoneNum}</td>
                 <td>${ordermessage.orderbook.address}</td>
                <td>${ordermessage.userId}</td>
                 <td>${ordermessage.customer_id}</td>
                  <td>${ordermessage.orderStatus}</td>
                <td>${ordermessage.bookTitle}</td>
                    <td>${ordermessage.submitDate}</td>
                <td>${ordermessage.endDate}</td>
                
			</tr>
            
            </c:forEach> 
        
    </table>
    </div>
    
</form>
</body>
</html>