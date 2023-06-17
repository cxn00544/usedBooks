<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.pojo.SellBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  errorPage="error.jsp" %>
<%@ page import="java.util.*,com.pojo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品出售界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/comment.css">
    <script type="text/javascript">
        function checkKeyword() {
            var keyword = form1.keyword.value;
            if ((keyword==null)||(keyword=="")){
                alert("关键词不能为空！");
                return false;
            }
            return true;
        }

        function del(bookId,userId){
            var a = window.confirm("您确定要删除吗？");
            if(a==true){
                location.href="${pageContext.request.contextPath}/doDeleteSellBook?bookId="+bookId +"&userId="+userId;
            }
        }


    </script>

</head>
<body>
	<div>
			<jsp:include page="header2.jsp" />
	</div>
	<br ><br />
		
<div class="comment-table">
    <div class="comment-header">
        <h2>出售图书管理</h2>
        <div class="comment-search">
            <form method="post" name="form1" action="doGetSellBookByKeyword" onsubmit="javascript: return checkKeyword();">
                <input type="text" name="keyword" placeholder="关键词查询">
                <input value="搜索" type="submit" class="search-btn">
            </form>
        </div>
    </div>
    <button class="edit-btn" style="margin-bottom: 10px; margin-top: 5px">
        <a href="<c:url value="/addSellBook?userId=${user.userId }" />" style="text-decoration:none; color:#000;">新增出售图书</a>
    </button>
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
	<input type="hidden" name="userId" value="${user.userId}" />
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
                    	<a class="button-edit" href="editSellBookById?bookId=${sellbook.bookId}&userId=${user.userId }">修改</a>
          
              
                        <a class="button-edit" onclick="del(${sellbook.bookId},${user.userId })">删除</a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        注意，已经售出的商品是不可以删除的。
    </c:if>
    <c:if test="${empty list}">
        <br>
        还没有出售记录，可以点击出售图书
    </c:if>
</div>
 <div>
			<jsp:include page="footer.jsp" />
</div>
</body>
</html>

<style>
a.button-edit,  {
  display: inline-block;
  padding: 8px 16px;
  background-color: #4CAF50;
  color: white;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  border-radius: 4px;
}

a.button-edit:hover {
  background-color: #3e8e41;
}
</style>