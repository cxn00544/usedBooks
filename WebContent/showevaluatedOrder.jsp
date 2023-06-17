<%@ page language="java" import="java.util.*,com.pojo.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>所有完成的订单</title>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.css"/>">
	 <link rel="stylesheet" href="./css/ordercss.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script src="https://cdn.bootcss.com/jquery.serializeJSON/2.6.2/jquery.serializejson.js"></script>
</head>
<script>
window.addEventListener('load',function(){

	
}

</script>
<style>

*{
	margin:0;
	padding:0;
	font: 16px/1.5 tahoma,arial,Hiragino Sans GB,\\5B8B\4F53,sans-serif
}
.form_style{
 margin:0 auto;
 
}
.rejectOrderbtn{
background:#fff;

	color:#ff5000;
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
     
    border: 0px solid #e8e8e8;
    text-align: center;
    border-collapse: collapse;
    border-spacing: 0;
    color: #3c3c3c!important;
    table-layout: fixed;

}
.status{
color:#ff5000!important;
}
td{
border:2px solid #daf3ff;
}
button{
    background-color: #66b6ff;
    color: #fff;
    border: 1px solid #66b6ff;
}
.overOrderbtn{
background-color:#4987c9!important;
padding:0 !important;
width:100%!important;

}


</style>
<body>

<div>
			<jsp:include page="header2.jsp" />
	</div>
	<div>
			<jsp:include page="header3.jsp"/>
	</div>
<div class="order_container">
<form class="container_one">
    <div class="form_style">
    <table  align="center" border="2">
    <thead>
        <tr>
           	<th>订单编号</th>
            <th>书籍编号</th>
            <th>买家名字</th>
            <th>卖家账号</th>
            <th>付款金额</th>
            <th>收货人名字</th>
            <th>收货联系方式</th>
            <th>收货人地址</th>
            <th>配送地址</th>
            <th>付款时间</th>
            <th>订单状态</th>
            <th colspan="2">操作</th>
            
        </tr>
	</thead>
     <tbody>
        <c:forEach var="ordermessage" items="${OrderMessageList}">
            <tr>
                
                <td>${ordermessage.orderNum}</td>
                <td>${ordermessage.bookId}</td>
                <td>${ordermessage.isbn}</td>
                <td>${ordermessage.userName}</td>
     			 <td>${ordermessage.customerId}</td>
                <td>${ordermessage.price}</td>
                <td>${ordermessage.name}</td>
                <td>${ordermessage.phoneNum}</td>
          
                <td>${ordermessage.address}</td>
                <td>${ordermessage.detail}</td>
                <td>${ordermessage.submitDate}</td>   
  					<td>
	               	已完成
	              </td>
                 <td>
	               	<button onclick="overOrder" class="overOrderbtn">去评价</button>
	              </td>
	             
			</tr>
            
            </c:forEach> 
           
      </tbody>  
    </table>
    </div> 
</form>
</div>
 <div>
			<jsp:include page="footer.jsp" />
</div>
</body>
</html>
