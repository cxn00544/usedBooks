<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校园二手书交易系统</title>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
</head>
 <script>
 window.addEventListener('load',function(){
	    //分时间问候
	    var wenhao2=document.querySelector('.wenhao2');
	        // 得到当前的小时数
	        var date=new Date();
	        var h=date.getHours();
	        if(h<12){
	            
	            wenhao2.innerHTML='早上好！';
	        }else if(h<18){
	            
	            wenhao2.innerHTML='下午好！';
	        }else{
	         
	            wenhao2.innerHTML='晚安～';
	        };
	     
	        var tanchuang = document.querySelector('.tanchuang')
	        var xiazai = document.querySelector('.xiazai')
	        var timer=setInterval(()=>{
	           tanchuang.style.display='block';
	        },2000);
	        xiazai.onclick=(function(){
	        	   tanchuang.style.display='';
	        	   clearInterval(timer)
	        	})
	        funtion ConfirmCollect(userId,userName,bookId){
	        	
				alert("收藏成功！");
				location.href="${pageContext.request.contextPath}/addCollect?bookId="+bookId&&;
			}
	    }
	})

</script>
<body>
			<div>
			<jsp:include page="header.jsp" />
	</div>
		

 



<div class="comment-table">
    <div class="comment-header">
    </div>
    <c:if test="${not empty list}">
        <table>
            <thead>
            <tr>
                <th>出售编号&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>ISBN&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>图书名称&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>出售者&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>出售时间&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>介绍&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>价格&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="sellbook" items="${list}">
                <tr>
                    <td>${sellbook.bookId}</td>
                    <td>${sellbook.isbn}</td>
                    <td>${sellbook.bookTitle}</td>
                    <td>${sellbook.userName}</td>
                    <td>${sellbook.sellDate}</td>
                    <td>${sellbook.introduction}</td>
                    <td>${sellbook.price}</td>
                    <td>
                        
                        
                        <button class="delete-btn" >
                        	<a href="<c:url value="/doBuyBook?bookId=${sellbook.bookId}" />" >购买</a>
                       <!--  <button class="delete-btn" >收藏</button> -->
                       <a href="addCollect?bookId=${sellbook.bookId}&&coustemid=${sellbook.userName}&&userId=${user.userId}" onclick="ConfirmCollect()">收藏</a>
                     <%--   <button onclick="ConfirmCollect(${sellbook.bookId}&&coustemid=${sellbook.userName}&&userId=${user.userId})">收藏</button> --%>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </c:if>
    <c:if test="${empty list}">
        <br>
        还没有出售记录，可以点击出售图书
    </c:if>
</div>

   
</body>
 </html>

