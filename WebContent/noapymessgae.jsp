<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,com.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/css/bootstrap.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.bootcss.com/jquery.serializeJSON/2.6.2/jquery.serializejson.js"></script>
<style type="text/css">
	*{
	margin:0;
	padding:0;
	font: 16px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
	}
    .tablelist1{border:solid 3px #daf3ff; width:100%; clear:both; margin:0 auto;}
    .tablelist1 td{
    	    line-height: 25px;
    color: #333;
    font-weight: 700;
    font-size: 14px;
    text-align:center;
    
    }
    table .td1{
        text-align: right;
       background-color: rgb(242, 247, 255);
        font-weight: bold;
            border-color: #daf3ff
        
    }
    th,input{
    text-align:center!important;
    }
    #orderForm{
    	width:90%;
    	
    	margin:0 auto;
    }
    table .td2{
        text-align: center;
       background-color: rgb(242, 247, 255);
    
        font-weight: bold;
    }
    table select{
        width: 90%;
       color:rgb(245, 166, 35);
        height: 23px;
        cursor: pointer;
        margin-left: 60px;
    }
    table input{
       width:90%;
        border: 0px solid #3B3B3B;
        height: 23px;
        padding-left: 5%;
        padding-top: 5%;
        padding-bottom: 3%;
       
    }
    input{
    border:0px;
     background-color: rgb(242, 247, 255);
    }
    option{;
     width: 180px;
      padding: 5px 10px;
      border-width: 0 1px 1px 1px;
      border-style: solid;
      border-color: red;
    }
    span{
     color:#4787bd!important;
     
  
    line-height: 26px;
    
   
    font-weight: 700;
    font-size: 14px;
    }
     table .select_set{
        width: 90%;
        border: 1px solid #3B3B3B;
        height: 23px;
        cursor: pointer;
        color:red;
       
    }
    .formbody{
    width: auto;
    min-width: 990px;
    background-color: transparent;
    margin: 0 auto;
    }
    tr{
    width:25%;
    
    }
    .text_style{
    margin: 10px 0;
      background-color: rgb(251, 252, 255);
    border-bottom: 1px dotted rgb(221, 221, 221);
    text-align: center;
    
   
    }
    .text_style th{
    border-collapse: collapse;
    border-spacing: 0;
    color: #3c3c3c;
    }
    input[name='price']{
    color: rgb(255, 0, 54);
    vertical-align: top;
    display: inline-block;
   
    text-align: center;
    padding: 10px 0;
    }
    .text_styel2 {
   background-color: rgb(242, 247, 255);
    }
    
  	.address{
  	height:80px;
  	background-color: rgb(251, 252, 255);
  	
  	}
  	button{
  	border:0px;
    width: 182px;
    height: 39px;
    position: relative;
    vertical-align: middle;
    line-height: 39px;
    cursor: pointer;
    text-align: center;
    font-size: 14px;
    font-weight: 700;
    background: #dd2727;
    color: #fff;
    left:85%;
    top:100px;
  	}
  	h2{
  	
	line-height: 25px;
	color: #333;
	font-weight: 700;
	font-size: 14px;
    }
    .label{
    	font-size:24px;
    	color:
    }
</style>
</head>

<body>
<div>
			<jsp:include page="header2.jsp" />
	</div>
 <div class="formbody">
        <div class="formtitle" style="padding-left:3%; ">
            <h2>确认订单信息</h2>
        </div>
         <div style="border: 1px solid #daf3ff;  height: 300px;">
            <form action="${pageContext.request.contextPath}/addordermeaasge?bookId=${sellBook.bookId}&&userId=${user.userId}" method="post" id="orderForm">
                <table  class="tablelist1" border="0" >
		             <tr class="text_style">
		               <!--  <th>书名</th> -->
			            <th>书籍编号</th>
			            <th>出售者</th>
			            <th>价格</th>
			           
		        	</tr>
         
 	            <tr class="text_styel2">
 	            
 	                <td><input name="bookId" value="${sellBook.isbn}" type="text" readonly="readonly"/></td>
 	                <td><input name="userId" value="${sellBook.userName}" type="text" readonly="readonly"/></td> 
 	                <td><input name="price" value="${sellBook.price}" type="text" readonly="readonly"/></td>

                </tr>
        
                	<tr class="address">
                	 <td style="border-right:solid 3px #daf3ff"><span class="label">配送至：</span></td>
                	 <td colspan="2">
	 		         	<select name="addOrderaddressid" class="address_select">
		 			          <c:forEach var = "address" items="${addressList}">
		 			           		<option value="${address.orderId}">
		 			           		收货人姓名：${address.name }
		 			           		&nbsp;&nbsp;&nbsp;&nbsp;
		 			           		收货人联系方式：${address.phoneNum } 
		 			           		&nbsp;&nbsp;&nbsp;&nbsp;
		 			           		收货地址:${address.address }
		 			           		&nbsp;&nbsp;&nbsp;&nbsp;
		 			           		详细收货地址:${address.detail }
		 			           		
		 			           		</option>
		 			          </c:forEach> 
		 			         
	 	     			</select>
	 	     			
 	             	 </td>
 	             	 <td> <a href="center?userId=${user.userId}">管理收货地址</a></td>
                	</tr>  
               </table>	
			</form>
			<div><button type="submit" id="order-submit" onclick="$('#orderForm').submit()" style="background-color: rgb(255, 0, 54);">提交订单
			</button></div>
			
		
</div>
	
</div>
 <div>
			<jsp:include page="footer.jsp" />
</div>
</body>
</html>