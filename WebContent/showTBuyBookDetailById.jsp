<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pojo.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>求购公告内容</title>
<link href="css/ncss_style.css" rel="stylesheet" type="text/css" />
</head>
<body>


<div>
			<jsp:include page="header2.jsp" />
	</div>
<br><br />
<c:choose>
    <c:when test="${empty tbook}">
        <div>对应求购信息没有找到或已删除！</div>
    </c:when>
    <c:otherwise>
    <div class="sell-book-info">
        图书姓名：${tbook.bookName}<br />
        ISBN：${tbook.isbn}<br />
        预购金额：${tbook.price}<br />
        用户姓名：${tbook.userName}<br />
        创建时间：${tbook.publishDate}<br />
    </c:otherwise>
</c:choose>

  </div>

</body>
</html>
<style>

.btn-buy {
  display: inline-block;
  margin: 0.5rem 1rem;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.25;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  background-color: #007bff;
  border-color: #007bff;
  color: #fff;
  border-radius: 0.25rem;
  transition: all .15s ease-in-out;
}

.btn-buy:hover, .btn-buy:focus {
  background-color: #0062cc;
  border-color: #005cbf;
  color: #fff;
}
.sell-book-info {
  max-width: 600px;
  margin: 0 auto;
  padding: 2rem;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 0.25rem;
}

.sell-book-info h1 {
  font-size: 2rem;
  font-weight: 600;
  margin-top: 0;
  margin-bottom: 1rem;
}

.sell-book-info h2 {
  font-size: 1.5rem;
  font-weight: 500;
  margin-top: 2rem;
  margin-bottom: 0.5rem;
}

.sell-book-info p {
  margin-bottom: 1rem;
  font-size: 1rem;
  color: #6c757d;
}

.sell-book-info .book-buttons {
  margin-top: 2rem;
}

.sell-book-info .book-buttons a {
  display: inline-block;
  margin: 0.5rem 1rem;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  background-color: #007bff;
  border-color: #007bff;
  color: #fff;
  border-radius: 0.25rem;
  transition: all .15s ease-in-out;
}

.sell-book-info .book-buttons a:hover, .sell-book-info .book-buttons a:focus {
  background-color: #0062cc;
  border-color: #005cbf;
  color: #fff;
}
</style>